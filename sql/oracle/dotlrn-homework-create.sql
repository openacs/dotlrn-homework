@dotlrn-homework-applet-create
@dotlrn-homework-portlet-create
@dotlrn-homework-notifications-create

-- We'll use the content repository's built-in relationships on items to relate
-- a homework assignment to the correction or critique uploaded by a class
-- admin

begin
  content_type.register_relation_type (
    content_type  => 'file_storage_object',
    target_type   => 'file_storage_object',
    relation_tag  => 'homework_correction',
    min_n         => 0,
    max_n         => 1
  );
end;
/
show errors;
