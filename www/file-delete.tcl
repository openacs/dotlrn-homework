ad_page_contract {
    page to confirm and delete a file

    @author Kevin Scaldeferri (kevin@arsdigita.com)
    @creation-date 10 Nov 2000
    @cvs-id $Id$
} {
    file_id:integer,notnull
    {confirmed_p "f"}
} -validate {
    valid_file -requires {file_id} {
	if ![fs_file_p $file_id] {
	    ad_complain "The specified file is not valid."
	}
    }
} -properties {
    file_id:onevalue
    file_name:onevalue
    blocked_p:onevalue
    context_bar:onevalue
}

# check for delete permission on the file

ad_require_permission $file_id delete

# check the file doesn't have any revisions that the user
# doesn't have permission to delete

set user_id [ad_conn user_id]

set blocked_p [ad_decode [db_string blockers {}] 0 f t]
set correction_file_exists_p [db_0or1row correction_file_id {}]

if { [string is true $confirmed_p] && [string is false $blocked_p] &&
     [string is false $correction_file_exists_p] } {

    db_1row parent_id {}

    db_transaction {

        # DRB: damned permissions table has no "on delete cascade" and file storage
        # delete assumes there are perms on the revision itself.   This code breaks
        # the permissions abstraction but some day, 4.7 perhaps, we'll have proper
        # referential integrity operators in at least some of the datamodel

        db_dml version_perms_delete {}
        notification::request::delete_all -object_id $file_id
        db_exec_plsql delete_file {}

    }

    ad_returnredirect "folder-contents?folder_id=$parent_id"

} else {

    # they need to confirm that they really want to delete the file or to be
    # told they can't really delete it.

    db_1row file_name {}
    set title [dotlrn_homework::decode_name $title]
    set context_bar {"Delete"}
    ad_return_template

}
