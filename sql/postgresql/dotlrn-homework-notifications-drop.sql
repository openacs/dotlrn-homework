declare
	foo integer;
begin
-- Notifications Service Contract implementation for dotlrn-homework

-- Don Baccus (dhogaza@pacifier.com)
-- ported to PostgreSQL by Jarkko Laine (jarkko.m.laine@tut.fi)

create function inline_0 ()
returns integer as '                                                    
declare                                                                 
    row                             record;                             
begin                                                                   
    for row in select nt.type_id                                        
               from notification_types nt                               
               where nt.short_name in (''homework_upload'', ''correction_upload'')     
    loop                                                                
        perform notification_type__delete(row.type_id);                 
    end loop;                                                           
                                                                        
    return null;                                                        
end;' language 'plpgsql';

select inline_0();
drop function inline_0 ();


create function inline_0() returns integer as '
declare
	impl_id integer;
	v_foo integer;
begin

        -- the notification type impl                                                            
        impl_id := acs_sc_impl__get_id (                                                         
                      ''NotificationType'',             -- impl_contract_name                    
                      ''homework_upload''  		-- impl_name                             
        );

        PERFORM acs_sc_binding__delete (
                    ''NotificationType'',
                    ''homework_file_upload''
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

        select into v_foo type_id
        from notification_types
	where sc_impl_id = impl_id
        and short_name = ''homework_upload'';

        PERFORM notification_type__delete(v_foo);

        delete from notification_types_intervals                                       
         where type_id = v_foo                                                         
           and interval_id in (                                                        
                select interval_id                                                     
                  from notification_intervals                                          
                 where name in (''instant'')                      
        );                                                                             
                                                                                       
        delete from notification_types_del_methods                                     
         where type_id = v_foo                                                         
           and delivery_method_id in (                                                 
                select delivery_method_id                                              
                  from notification_delivery_methods                                   
                 where short_name in (''email'')                                       
        ); 



        PERFORM acs_sc_impl__delete (
                      ''NotificationType'',
                      ''homework_file_type''
        );



        -- the notification type impl                                                            
        impl_id := acs_sc_impl__get_id (                                                         
                      ''NotificationType'',             -- impl_contract_name                    
                      ''correction_upload''  		-- impl_name                             
        );

        PERFORM acs_sc_binding__delete (
                    ''NotificationType'',
                    ''correction_file_upload''
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



        select into v_foo type_id
        from notification_types
	where sc_impl_id = impl_id
        and short_name = ''correction_upload'';

        PERFORM notification_type__delete(v_foo);

        delete from notification_types_intervals                                       
         where type_id = v_foo                                                         
           and interval_id in (                                                        
                select interval_id                                                     
                  from notification_intervals                                          
                 where name in (''instant'')                      
        );                                                                             
                                                                                       
        delete from notification_types_del_methods                                     
         where type_id = v_foo                                                         
           and delivery_method_id in (                                                 
                select delivery_method_id                                              
                  from notification_delivery_methods                                   
                 where short_name in (''email'')                                       
        ); 



        PERFORM acs_sc_impl__delete (
                      ''NotificationType'',
                      ''correction_file_upload''
        );

	return (0);
end;
' language 'plpgsql';

select inline_0();
drop function inline_0();

