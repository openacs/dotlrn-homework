
--
-- Drop the dotlrn homework applet for dotLRN
-- distributed under GPL v2.0
--
--
-- Don Baccus (dhogaza@pacifier.com)
--
-- 2002-08-06
--
-- ported to PostgreSQL by Jarkko Laine (jarkko.m.laine@tut.fi)
-- 2003-06-03

-- drop all the hooks

-- GetPrettyName
select acs_sc_impl_alias__delete (
       'dotlrn_applet',
       'dotlrn_homework_applet',
       'GetPrettyName'
);

-- AddApplet
select acs_sc_impl_alias__delete (
       'dotlrn_applet',
       'dotlrn_homework_applet',
       'AddApplet'
);

-- AddAppletToCommunity
select acs_sc_impl_alias__delete (
       'dotlrn_applet',
       'dotlrn_homework_applet',
       'AddAppletToCommunity'
);

-- RemoveApplet
select acs_sc_impl_alias__delete (
       'dotlrn_applet',
       'dotlrn_homework_applet',
       'RemoveApplet'
);

-- AddUser
select acs_sc_impl_alias__delete (
       'dotlrn_applet',
       'dotlrn_homework_applet',
       'AddUser'
);

-- AddUserToCommunity
select acs_sc_impl_alias__delete (
       'dotlrn_applet',
       'dotlrn_homework_applet',
       'AddUserToCommunity'
);

-- RemoveUser
select acs_sc_impl_alias__delete (
	'dotlrn_applet',
	'dotlrn_homework_applet',
	'RemoveUser'
);

select acs_sc_impl_alias__delete (
	'dotlrn_applet',
        'dotlrn_homework_applet',
        'ChangeEventHandler'
        );

-- delete the binding
select acs_sc_binding__delete (
	'dotlrn_applet',
	'dotlrn_homework_applet'
);

-- delete the implementation
select acs_sc_impl__delete (
	'dotlrn_applet',
	'dotlrn_homework_applet'
);
