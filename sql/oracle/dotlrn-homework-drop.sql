@dotlrn-homework-applet-drop
@dotlrn-homework-portlet-drop
@dotlrn-homework-notifications-drop

begin
  content_type.unregister_relation_type (
    content_type  => 'content_item',
    target_type   => 'content_item',
    relation_tag  => 'homework_correction'
  );
end;
/
show errors;
