-- Notifications Service Contract implementation for dotlrn-homework

-- Don Baccus (dhogaza@pacifier.com)

declare
        impl_id integer;
        v_foo   integer;
begin

        select type_id into v_foo
        from notification_types
        where short_name = 'homework_upload';

        notification_type.delete(
            type_id => v_foo
        );

        v_foo := acs_sc_impl.delete_alias (
                    'NotificationType',
                    'homework_file_upload',
                    'GetURL'
                 );

        v_foo := acs_sc_impl.delete_alias (
                    'NotificationType',
                    'homework_file_upload',
                    'ProcessReply'
                 );

        acs_sc_binding.delete (
                    contract_name => 'NotificationType',
                    impl_name => 'homework_file_upload'
                 );


        impl_id := acs_sc_impl.delete (
                      'NotificationType',
                      'homework_file_type'
                   );

        select type_id into v_foo
        from notification_types
        where short_name = 'correction_upload';

        notification_type.delete(
            type_id => v_foo
        );


        v_foo := acs_sc_impl.delete_alias (
                    'NotificationType',
                    'correction_file_upload',
                    'GetURL'
                 );

        v_foo := acs_sc_impl.delete_alias (
                    'NotificationType',
                    'correction_file_upload',
                    'ProcessReply'
                 );

        acs_sc_binding.delete (
                    contract_name => 'NotificationType',
                    impl_name => 'correction_file_upload'
                 );


        -- the notification type impl
        impl_id := acs_sc_impl.delete (
                      'NotificationType',
                      'correction_file_upload'
                   );

end;
/
show errors
