
--
-- The dotlrn_homework applet for dotLRN
-- distributed under GPL v2.0
--
--
-- Don Baccus (dhogaza2pacifier.com)
--


declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl.new (
		'dotlrn_applet',
		'dotlrn_homework_applet',
		'dotlrn_homework_applet'
	);

	-- add all the hooks

	-- GetPrettyName
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'GetPrettyName',
	       'dotlrn_homework_applet::get_pretty_name',
	       'TCL'
	);

	-- AddApplet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddApplet',
	       'dotlrn_homework_applet::add_applet',
	       'TCL'
	);

	-- RemoveApplet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemoveApplet',
	       'dotlrn_homework_applet::remove_applet',
	       'TCL'
	);

	-- AddAppletToCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddAppletToCommunity',
	       'dotlrn_homework_applet::add_applet_to_community',
	       'TCL'
	);

	-- RemoveAppletFromCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemoveAppletFromCommunity',
	       'dotlrn_homework_applet::remove_applet_from_community',
	       'TCL'
	);

	-- AddUser
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddUser',
	       'dotlrn_homework_applet::add_user',
	       'TCL'
	);

	-- RemoveUser
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemoveUser',
	       'dotlrn_homework_applet::remove_user',
	       'TCL'
	);

	-- AddUserToCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddUserToCommunity',
	       'dotlrn_homework_applet::add_user_to_community',
	       'TCL'
	);

	-- RemoveUserFromCommunity
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemoveUserFromCommunity',
	       'dotlrn_homework_applet::remove_user_from_community',
	       'TCL'
	);

	-- AddPortlet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'AddPortlet',
	       'dotlrn_homework_applet::add_portlet',
	       'TCL'
	);

	-- RemovePortlet
	foo := acs_sc_impl.new_alias (
	       'dotlrn_applet',
	       'dotlrn_homework_applet',
	       'RemovePortlet',
	       'dotlrn_homework_applet::remove_portlet',
	       'TCL'
	);

        foo := acs_sc_impl.new_alias (
            impl_contract_name => 'dotlrn_applet',
            impl_name => 'dotlrn_homework_applet',
            impl_operation_name => 'Clone',
            impl_alias => 'dotlrn_homework_applet::clone',
            impl_pl => 'TCL'
        );

        foo := acs_sc_impl.new_alias (
            impl_contract_name => 'dotlrn_applet',
            impl_name => 'dotlrn_homework_applet',
            impl_operation_name => 'ChangeEventHandler',
            impl_alias => 'dotlrn_homework_applet::change_event_handler',
            impl_pl => 'TCL'
        );

	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'dotlrn_applet',
	    impl_name => 'dotlrn_homework_applet'
	);
end;
/
show errors
