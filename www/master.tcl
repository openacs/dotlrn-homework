set cmd [list ad_context_bar -node_id [site_node::get_parent_id -node_id [ad_conn node_id]] --]
foreach elem $context_bar { 
    lappend cmd $elem
}
set context_bar [eval $cmd]
