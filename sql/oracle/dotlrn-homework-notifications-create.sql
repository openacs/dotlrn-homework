-- Notifications Service Contract implementation for dotlrn-homework

-- Don Baccus (dhogaza@pacifier.com)

declare
        impl_id integer;
        v_foo   integer;
begin

        -- the notification type impl
        impl_id := acs_sc_impl.new (
                      'NotificationType',
                      'homework_file_upload',
                      'dotlrn-homework'
                   );

        v_foo := acs_sc_impl.new_alias (
                    'NotificationType',
                    'homework_file_upload',
                    'GetURL',
                    'dotlrn_homework::notification::get_homework_url',
                    'TCL'
                 );

        v_foo := acs_sc_impl.new_alias (
                    'NotificationType',
                    'homework_file_upload',
                    'ProcessReply',
                    'dotlrn_homework::notification::process_homework_reply',
                    'TCL'
                 );

        acs_sc_binding.new (
                    contract_name => 'NotificationType',
                    impl_name => 'homework_file_upload'
                 );

        v_foo:= notification_type.new (
                short_name => 'homework_upload',
                sc_impl_id => impl_id,
                pretty_name => 'Homework',
                description => 'Notification of Homework File Upload',
                creation_user => NULL,
                creation_ip => NULL
                );

        -- enable the various intervals and delivery methods

        -- we only support instant delivery of homework notifications

        -- it seems a bit odd that Open Force stepped outside the service contract
        -- realm to do this.  Why not do it in a PL/SQL init routine or something
        -- like that and call it via service contract?

        insert into notification_types_intervals
        (type_id, interval_id)
        select v_foo, interval_id
        from notification_intervals where name = 'instant';

        insert into notification_types_del_methods
        (type_id, delivery_method_id)
        select v_foo, delivery_method_id
        from notification_delivery_methods where short_name in ('email');


        -- the notification type impl
        impl_id := acs_sc_impl.new (
                      'NotificationType',
                      'correction_file_upload',
                      'dotlrn-homework'
                   );

        v_foo := acs_sc_impl.new_alias (
                    'NotificationType',
                    'correction_file_upload',
                    'GetURL',
                    'dotlrn_homework::notification::get_correction_url',
                    'TCL'
                 );

        v_foo := acs_sc_impl.new_alias (
                    'NotificationType',
                    'correction_file_upload',
                    'ProcessReply',
                    'dotlrn_homework::notification::process_correction_reply',
                    'TCL'
                 );

        acs_sc_binding.new (
                    contract_name => 'NotificationType',
                    impl_name => 'correction_file_upload'
                 );

        v_foo:= notification_type.new (
                short_name => 'correction_upload',
                sc_impl_id => impl_id,
                pretty_name => 'Comment File',
                description => 'Notification of Comment File Upload',
                creation_user => NULL,
                creation_ip => NULL
                );

        -- enable the various intervals and delivery methods

        -- we only support instant delivery of homework notifications

        -- it seems a bit odd that Open Force stepped outside the service contract
        -- realm to do this.  Why not do it in a PL/SQL init routine or something
        -- like that and call it via service contract?

        insert into notification_types_intervals
        (type_id, interval_id)
        select v_foo, interval_id
        from notification_intervals where name = 'instant';

        insert into notification_types_del_methods
        (type_id, delivery_method_id)
        select v_foo, delivery_method_id
        from notification_delivery_methods where short_name in ('email');

end;
/
show errors
