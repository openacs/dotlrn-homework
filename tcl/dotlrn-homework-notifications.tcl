ad_library {

    dotlrn-homework notifications

    @creation-date 2002-07-24
    @author Don Baccus (dhogaza@pacifier.com)
    @cvs-id $Id$

}

namespace eval dotlrn_homework::notification {

   # We don't really use either of these at the moment though this might change
   # in the future ...

    ad_proc -private get_url {
        object_id
    } {
    }

    ad_proc -private process_reply {
        reply_id
    } {
    }

}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
