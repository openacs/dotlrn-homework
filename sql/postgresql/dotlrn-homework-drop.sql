\i dotlrn-homework-applet-drop.sql
\i dotlrn-homework-portlet-drop.sql

select  content_type__unregister_relation_type (
    'content_item',
    'content_item',
    'homework_correction'
);
