
--
-- Drop the dotlrn homework applet for dotLRN
-- distributed under GPL v2.0
--
--
-- Don Baccus (dhogaza@pacifier.com)
--
-- 2002-08-06
--

create function inline_0() returns integer as '
declare
	foo integer;
begin

	-- drop all the hooks

	-- GetPrettyName
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''GetPrettyName''
	);

	-- AddApplet
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''AddApplet''
	);

	-- RemoveApplet
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''RemoveApplet''
	);

	-- AddAppletToCommunity
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''AddAppletToCommunity''
	);

	-- RemoveAppletFromCommunity
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''RemoveAppletFromCommunity''
	);

	-- AddUser
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''AddUser''
	);

	-- RemoveUser
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''RemoveUser''
	);

	-- AddUserToCommunity
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''AddUserToCommunity''
	);

	-- RemoveUserFromCommunity
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''RemoveUserFromCommunity''
	);

	-- AddPortlet
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''AddPortlet''
	);

	-- RemovePortlet
	foo := acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_homework_applet'',
	       ''RemovePortlet''
	);

        foo := acs_sc_impl_alias__delete (
               ''dotlrn_applet'',
               ''dotlrn_homework_applet'',
               ''ChangeEventHandler''
        );

	-- Add the binding
	perform acs_sc_binding__delete (
	        ''dotlrn_applet'',
	        ''dotlrn_homework_applet''
	);

	-- create the implementation
	foo := acs_sc_impl__delete (
		''dotlrn_applet'',
		''dotlrn_homework_applet''
	);

  return 1;

end;' language 'plpgsql';
select inline_0();
drop function inline_0();
