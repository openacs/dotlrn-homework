-- Notifications Service Contract implementation for dotlrn-homework

-- Don Baccus (dhogaza@pacifier.com)

create function inline_0() returns integer as '
declare
        impl_id integer;
        v_foo   integer;
begin

        select type_id into v_foo
        from notification_types
        where short_name = ''homework_upload'';

        perform notification_type__delete(
                  v_foo
                );

        v_foo := acs_sc_impl_alias__delete (
                    ''NotificationType'',
                    ''homework_file_upload'',
                    ''GetURL''
                 );

        v_foo := acs_sc_impl_alias__delete (
                    ''NotificationType'',
                    ''homework_file_upload'',
                    ''ProcessReply''
                 );

        perform acs_sc_binding__delete (
                  ''NotificationType'',
                  ''homework_file_upload''
                );


        impl_id := acs_sc_impl__delete (
                      ''NotificationType'',
                      ''homework_file_type''
                   );

        select type_id into v_foo
        from notification_types
        where short_name = ''correction_upload'';

        perform notification_type__delete(
                  v_foo
                );

        v_foo := acs_sc_impl_alias__delete (
                    ''NotificationType'',
                    ''correction_file_upload'',
                    ''GetURL''
                 );

        v_foo := acs_sc_impl_alias__delete (
                    ''NotificationType'',
                    ''correction_file_upload'',
                    ''ProcessReply''
                 );

        perform acs_sc_binding__delete (
                  ''NotificationType'',
                  ''correction_file_upload''
                );

        -- the notification type impl
        impl_id := acs_sc_impl__delete (
                      ''NotificationType'',
                      ''correction_file_upload''
                   );

        return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();
