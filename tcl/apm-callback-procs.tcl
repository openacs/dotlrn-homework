ad_library {

    dotLRN Homework Applet Package APM callbacks library
    
    Procedures that deal with installing, instantiating, mounting.

    @creation-date 2003-06-10
    @author Don Baccus <dhogaza@pacifier.com>
    @cvs-id $Id$
}

namespace eval dotlrn_homework::apm_callbacks {}

ad_proc -private dotlrn_homework::apm_callbacks::package_install {} {

    Define dotLRN Homework applet, portlet and notifications.

    @author Don Baccus (dhogaza@pacifier.com)

} {

    # Define notifications for homework and correction file uploads

    set impl_id \
        [acs_sc::impl::new_from_spec -spec {
            name homework_file_upload
            contract_name NotificationType
            owner dotlrn-homework
            aliases {
                GetURL dotlrn_homework::notification::get_homework_url
                ProcessReply dotlrn_homework::notification::process_homework_reply
            }
        }]

    set type_id [notification::type::new \
                 -sc_impl_id $impl_id \
                 -short_name homework_upload \
                 -pretty_name Homework \
                 -description "Notification of Homework File Upload"]

    notification::type::interval_enable \
        -type_id $type_id \
        -interval_id [notification::interval::get_id_from_name -name instant]

    notification::type::delivery_method_enable \
        -type_id $type_id \
        -delivery_method_id [notification::delivery::get_id_from_name -name email]

    set impl_id \
        [acs_sc::impl::new_from_spec -spec {
            name correction_file_upload
            contract_name NotificationType
            owner dotlrn-homework
            aliases {
                GetURL dotlrn_homework::notification::get_correction_url
                ProcessReply dotlrn_homework::notification::process_correction_reply
            }
        }]

    set type_id [notification::type::new \
                 -sc_impl_id $impl_id \
                 -short_name correction_upload \
                 -pretty_name "Comment File" \
                 -description "Notification of Comment File Upload"]

    notification::type::interval_enable \
        -type_id $type_id \
        -interval_id [notification::interval::get_id_from_name -name instant]

    notification::type::delivery_method_enable \
        -type_id $type_id \
        -delivery_method_id [notification::delivery::get_id_from_name -name email]

    # Define the dotLRN Homework Applet

    acs_sc::impl::new_from_spec -spec {
        name dotlrn_homework
        contract_name dotlrn_applet
        owner dotlrn_applet
        aliases {
            GetPrettyName dotlrn_homework::get_pretty_name
	    AddApplet dotlrn_homework::add_applet
	    RemoveApplet dotlrn_homework::remove_applet
	    AddAppletToCommunity dotlrn_homework::add_applet_to_community
	    RemoveAppletFromCommunity dotlrn_homework::remove_applet_from_community
	    AddUser dotlrn_homework::add_user
	    RemoveUser dotlrn_homework::remove_user
	    AddUserToCommunity dotlrn_homework::add_user_to_community
	    RemoveUserFromCommunity dotlrn_homework::remove_user_from_community
            AddPortlet dotlrn_homework::add_portlet
            RemovePortlet dotlrn_homework::remove_portlet
            ChangeEventHandler dotlrn_homework::change_event_handler
            Clone dotlrn_homework::clone
        }
    }

    # Define the user portlet

    portal::datasource::new_from_spec -spec {
        name homework_portlet
        description "Homework Portlet"
        params {
            {shadeable_p:config_required,configured t}
            {shaded_p:config_required,configured f}
            {hideable_p:config_required,configured t}
            {user_editable_p:config_required,configured f}
            {link_hideable_p:config_required,configured t}
            {folder_id:config_required ""}
            {package_id:config_required ""}
         }
    }

    # Define the admin portlet

    portal::datasource::new_from_spec -spec {
        name "homework_admin_portlet"
        description "Homework Administration Portlet"
        params {
            {shadeable_p:config_required,configured t}
            {shaded_p:config_required,configured f}
            {hideable_p:config_required,configured t}
            {user_editable_p:config_required,configured f}
            {link_hideable_p:config_required,configured t}
            {folder_id:config_required ""}
            {package_id:config_required ""}
         }
    }
}

ad_proc -private dotlrn_homework::apm_callbacks::package_uninstall {} {

    Delete dotLRN stuff defined in package_install above

    @author Don Baccus (dhogaza@pacifier.com)

} {
    notification::type::delete -short_name homework_upload
    acs_sc::impl::delete -contract_name NotificationType -impl_name homework_file_upload
    notification::type::delete -short_name correction_upload
    acs_sc::impl::delete -contract_name NotificationType -impl_name correction_file_upload
    portal::datasource_delete -name homework_portlet
    acs_sc::impl::delete -contract_name dotlrn_applet -impl_name dotlrn_homework
}
