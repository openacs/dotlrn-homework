\i dotlrn-homework-applet-create.sql
\i dotlrn-homework-portlet-create.sql
\i dotlrn-homework-notifications-create.sql

-- We'll use the content repository's built-in relationships on items to relate
-- a homework assignment to the correction or critique uploaded by a class
-- admin

select content_type__register_relation_type (
    'file_storage_object',
    'file_storage_object',
    'homework_correction',
    0,
    1
);
