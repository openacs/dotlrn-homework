ad_page_contract {
    page to select a new folder to move a file into (Actually, this should 
    work to move folders too)

    @author Kevin Scaldeferri (kevin@arsdigita.com)
    @creation-date 13 Nov 2000
    @cvs-id $Id$
} {
    file_id:integer,notnull
    name:notnull
} -validate {
    valid_file -requires {file_id} {
	if ![fs_file_p $file_id] {
	    ad_complain "The specified file is not valid."
	}
    }
} -properties {
    file_id:onevalue
    name:onevalue
    context_bar:onevalue
}

# check they have write permission on the file (is this really the
# right permission?)

ad_require_permission $file_id write
set context_bar "Move"
set return_url "[ad_conn url]?[ad_conn query]"

ad_return_template


