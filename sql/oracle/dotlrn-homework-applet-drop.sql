
--
-- Drop the dotlrn homework applet for dotLRN
-- distributed under GPL v2.0
--
--
-- Don Baccus (dhogaza@pacifier.com)
--
-- 2002-08-06
--


declare
	foo integer;
begin

	-- drop all the hooks

	-- GetPrettyName
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'GetPrettyName'
	);

	-- AddApplet
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddApplet'
	);

	-- RemoveApplet
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemoveApplet'
	);

	-- AddAppletToCommunity
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddAppletToCommunity'
	);

	-- RemoveAppletFromCommunity
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemoveAppletFromCommunity'
	);

	-- AddUser
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddUser'
	);

	-- RemoveUser
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemoveUser'
	);

	-- AddUserToCommunity
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddUserToCommunity'
	);

	-- RemoveUserFromCommunity
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemoveUserFromCommunity'
	);

	-- AddPortlet
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddPortlet'
	);

	-- RemovePortlet
	foo := acs_sc_impl.delete_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemovePortlet'
	);

        foo := acs_sc_impl.delete_alias (
            impl_contract_name => 'dotlrn_applet',
            impl_name => 'dotlrn_homework_applet',
            impl_operation_name => 'ChangeEventHandler'
        );

	-- Add the binding
	acs_sc_binding.delete (
	    contract_name => 'dotlrn_applet',
	    impl_name => 'dotlrn_homework_applet'
	);

	-- create the implementation
	foo := acs_sc_impl.delete (
		'dotlrn_applet',
		'dotlrn_homework_applet'
	);
end;
/
show errors
