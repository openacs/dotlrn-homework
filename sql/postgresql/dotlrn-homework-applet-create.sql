
--
-- The dotlrn_homework applet for dotLRN
-- distributed under GPL v2.0
--
--
-- Don Baccus (dhogaza2pacifier.com)
--
-- ported to PostgreSQL by Jarkko Laine (jarkko.m.laine@tut.fi)

-- create the implementation

create function inline_0()
returns integer as '
begin

perform acs_sc_impl__new (
	''dotlrn_applet'',
	''dotlrn_homework_applet'',
	''dotlrn_homework_applet''
);

-- add all the hooks

-- GetPrettyName
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''GetPrettyName'',
       ''dotlrn_homework_applet::get_pretty_name'',
       ''TCL''
);

-- AddApplet
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''AddApplet'',
       ''dotlrn_homework_applet::add_applet'',
       ''TCL''
);

-- AddAppletToCommunity
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''AddAppletToCommunity'',
       ''dotlrn_homework_applet::add_applet_to_community'',
       ''TCL''
);

-- RemoveApplet
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''RemoveApplet'',
       ''dotlrn_homework_applet::remove_applet'',
       ''TCL''
);

-- RemoveAppletFromCommunity
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''RemoveAppletFromCommunity'',
       ''dotlrn_homework_applet::remove_applet_from_community'',
       ''TCL''
);


-- AddUser
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''AddUser'',
       ''dotlrn_homework_applet::add_user'',
       ''TCL''
);

-- AddUserToCommunity
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''AddUserToCommunity'',
       ''dotlrn_homework_applet::add_user_to_community'',
       ''TCL''
);

-- RemoveUser
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''RemoveUser'',
       ''dotlrn_homework_applet::remove_user'',
       ''TCL''
);

-- RemoveUserFromCommunity
perform acs_sc_impl_alias__new (
       ''dotlrn_applet'',
       ''dotlrn_homework_applet'',
       ''RemoveUserFromCommunity'',
       ''dotlrn_homework_applet::remove_user_from_community'',
       ''TCL''
);

perform acs_sc_impl_alias__new (
	''dotlrn_applet'',
        ''dotlrn_homework_applet'',
        ''Clone'',
        ''dotlrn_homework_applet::clone'',
        ''TCL''
);

perform acs_sc_impl_alias__new (
	''dotlrn_applet'',
        ''dotlrn_homework_applet'',
        ''ChangeEventHandler'',
        ''dotlrn_homework_applet::change_event_handler'',
        ''TCL''
);

-- Add the binding
perform acs_sc_binding__new (
	''dotlrn_applet'',
	''dotlrn_homework_applet''
);

return 0;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();
