ad_page_contract {
    Master
} {
    title:optional
    {context_bar ""}
}

if {![info exists title]} {
    if {[info exists doc(title)]} {
        set title $doc(title)
    } else {
        set title "Homework"
    }
}

set context_bar [ad_context_bar \
                     -node_id [site_node::get_parent_id \
                                   -node_id [ad_conn node_id]] -- \
                     {*}$context_bar]

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
