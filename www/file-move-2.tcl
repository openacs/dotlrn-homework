ad_page_contract {
    script to move a file into a new folder

    @author Kevin Scaldeferri (kevin@arsdigita.com)
    @creation-date 13 Nov 2000
    @cvs-id $Id$
} {
    file_id:integer,notnull
    parent_id:integer,notnull
} -validate {
    valid_file -requires {file_id} {
	if ![fs_file_p $file_id] {
	    ad_complain "[_ dotlrn-homework.lt_specified_file]"
	}
    }

    valid_folder -requires {parent_id} {
	if ![fs_folder_p $parent_id] {
	    ad_complain "[_ dotlrn-homework.lt_spec_parent]"
	}
    }
}

# check for write permission on both the file and the target folder

ad_require_permission $file_id write
ad_require_permission $parent_id write

set creation_user [ad_conn user_id]
set creation_ip [ns_conn peeraddr]

db_transaction {

    set correction_file_id [db_string correction_file_id {} -default ""]

    db_exec_plsql file_move {}
    db_dml context_update {}

    if { ![string equal $correction_file_id ""] } {
        db_exec_plsql correction_file_move {}
        db_dml correction_context_update {}
    }

} on_error {

    ad_return_exception_template -params {errmsg} "/packages/acs-subsite/www/shared/db-error"
    return

}

ad_returnredirect "folder-contents?folder_id=$parent_id"

