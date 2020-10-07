# packages/dotlrn-homework/tcl/test/dotlrn-homework-procs.tcl

ad_library {

    Test cases for dotlrn-homework

    @author Roel Canicula (roel@solutiongrove.com)
    @creation-date 2006-02-23
    @arch-tag: 2cbd4146-c8f6-4ee7-946c-0c5d05378622
    @cvs-id $Id$
}

aa_register_case -cats { api } \
    -procs { dotlrn_homework::new } \
    homework_new { Test homework submission } {
    aa_run_with_teardown \
        -rollback \
        -test_code {
        # Run on all assessment packages
        foreach element_id [db_list homework_elements {
            select element_id
            from portal_element_map
            where name = 'dotlrn_homework_portlet'
        }] {
            foreach param [portal::element_params_not_cached $element_id] {
                set params([lindex $param 0]) [lindex $param 1]
            }

            # portal element parameters might report a
            # package_id of 0... this would make much things
            # fail afterwards
            if {[apm_package_key_from_id $params(package_id)] eq ""} {
                aa_log "Element $element_id not associated with a valid package -> \$params(package_id) = $params(package_id). Skipping this test."
                continue
            }

            set test_package_id [ad_conn package_id]
            set package_id [site_node::closest_ancestor_package -url [site_node::get_url_from_object_id -object_id $params(package_id)] -package_key dotlrn]

            ad_conn -set package_id $package_id
            util_memoize_flush "dotlrn_community::get_community_id_not_cached -package_id $package_id"

            set homework_id [dotlrn_homework::new \
                     -file_id [db_nextval acs_object_id_seq] \
                     -new_file_p 1 \
                     -parent_folder_id $params(folder_id) \
                     -title "AA Homework Submit Test" \
                     -description "AA Homework Submit Test" \
                     -upload_file [list readme.txt "[acs_root_dir]/readme.txt" text/plain] \
                     -homework_file_id 0 \
                     -package_id $params(package_id)]

            aa_true "homework successfully uploaded: $homework_id" $homework_id

            aa_log "deleting homework: $homework_id"

            set item_id [content::revision::item_id -revision_id $homework_id]

            content::item::delete -item_id $item_id

            util_memoize_flush "dotlrn_community::get_community_id_not_cached -package_id $test_package_id"
            ad_conn -set package_id $test_package_id
        }
    }
}


aa_register_case -procs {
        dotlrn_homework_admin_portlet::link
        dotlrn_homework_portlet::link
        dotlrn_homework_admin_portlet::get_pretty_name
        dotlrn_homework_applet::get_pretty_name
        dotlrn_homework_portlet::get_pretty_name
    } -cats {
        api
        production_safe
    } dotlrn_homework_portlet_links_names {
        Test diverse link and name procs.
} {
    aa_equals "dotLRN homework admin portlet link"          "[dotlrn_homework_admin_portlet::link]" ""
    aa_equals "dotLRN homework portlet link"                "[dotlrn_homework_portlet::link]" ""
    aa_equals "dotLRN homework admin portlet pretty name"   "[dotlrn_homework_admin_portlet::get_pretty_name]" "#dotlrn-homework.homework_pretty_admin#"
    aa_equals "dotLRN homework applet pretty name"          "[dotlrn_homework_applet::get_pretty_name]" "[_ dotlrn-homework.pretty_name]"
    aa_equals "dotLRN homework portlet pretty name"         "[dotlrn_homework_portlet::get_pretty_name]" "#dotlrn-homework.pretty_name#"
}

aa_register_case -procs {
        dotlrn_homework_applet::package_key
        dotlrn_homework_applet::my_package_key
        dotlrn_homework_applet::applet_key
    } -cats {
        api
        smoke
        production_safe
    } dotlrn_homework_applet_keys {
        Simple test for the various dotlrn_homework_applet::..._key procs.
} {
    aa_equals "Package key"     "[dotlrn_homework_applet::package_key]"     "dotlrn-homework"
    aa_equals "My Package key"  "[dotlrn_homework_applet::my_package_key]"  "dotlrn-homework"
    aa_equals "Applet key"      "[dotlrn_homework_applet::applet_key]"      "dotlrn_homework_applet"
}

aa_register_case -procs {
        dotlrn_homework::get_file_storage_url
    } -cats {
        api
        smoke
        production_safe
    } dotlrn_homework_get_file_storage_url {
        Simple test for the dotlrn_homework::get_file_storage_url proc.
} {
    aa_equals "File storage URL" "[dotlrn_homework::get_file_storage_url]" "/dotlrn/file-storage"
}

aa_register_case -procs {
        dotlrn_homework_portlet::add_self_to_page
        dotlrn_homework_portlet::remove_self_from_page
        dotlrn_homework_admin_portlet::add_self_to_page
        dotlrn_homework_admin_portlet::remove_self_from_page
    } -cats {
        api
    } dotlrn_homework_portlet_add_remove_from_page {
        Test add/remove portlet procs.
} {
    #
    # Helper proc to check portal elements
    #
    proc portlet_exists_p {portal_id portlet_name} {
        return [db_0or1row portlet_in_portal {
            select 1 from dual where exists (
              select 1
                from portal_element_map pem,
                     portal_pages pp
               where pp.portal_id = :portal_id
                 and pp.page_id = pem.page_id
                 and pem.name = :portlet_name
            )
        }]
    }
    #
    # Start the tests
    #
    aa_run_with_teardown -rollback -test_code {
        #
        # Create a community and a folder.
        #
        # As this is running in a transaction, it should be cleaned up
        # automatically.
        #
        set community_id [dotlrn_community::new -community_type dotlrn_community -pretty_name foo]
        set folder_id [fs::new_folder -name foo -pretty_name foo -parent_id $community_id]
        if {$community_id ne ""} {
            aa_log "Community created: $community_id"
            set portal_id [dotlrn_community::get_admin_portal_id -community_id $community_id]
            set package_id [dotlrn::instantiate_and_mount $community_id [dotlrn_homework_portlet::my_package_key]]
            #
            # dotlrn_homework_portlet
            #
            set portlet_name [dotlrn_homework_portlet::get_my_name]
            #
            # Add portlet.
            #
            dotlrn_homework_portlet::add_self_to_page -portal_id $portal_id -package_id $package_id -param_action "" -folder_id $folder_id
            aa_true "Portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Remove portlet.
            #
            dotlrn_homework_portlet::remove_self_from_page -portal_id $portal_id -package_id $package_id -folder_id $folder_id
            aa_false "Portlet is in community portal after removal" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Add portlet.
            #
            dotlrn_homework_portlet::add_self_to_page -portal_id $portal_id -package_id $package_id -param_action "" -folder_id $folder_id
            aa_true "Portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # admin_portlet
            #
            set portlet_name [dotlrn_homework_admin_portlet::get_my_name]
            #
            # Add portlet.
            #
            dotlrn_homework_admin_portlet::add_self_to_page -portal_id $portal_id -package_id $package_id -param_action "" -folder_id $folder_id
            aa_true "Admin portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Remove portlet.
            #
            dotlrn_homework_admin_portlet::remove_self_from_page -portal_id $portal_id  -package_id $package_id -folder_id $folder_id
            aa_false "Admin portlet is in community portal after removal" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Add portlet.
            #
            dotlrn_homework_admin_portlet::add_self_to_page -portal_id $portal_id -package_id $package_id -param_action "" -folder_id $folder_id
            aa_true "Admin portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
        } else {
            aa_error "Community creation failed"
        }
    }
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
