
-- Drops homework portlets

-- @author Don Baccus (dhogaza@pacifier.com)
-- @creation-date 2002-07-19

-- $Id$

-- This is free software distributed under the terms of the GNU Public
-- License version 2 or higher.  Full text of the license is available
-- from the GNU Project: http://www.fsf.org/copyleft/gpl.html

-- porting to PostgreSQL by Jarkko Laine (jarkko.m.laine@tut.fi)

create function inline_0()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
  foo integer;
begin

    select datasource_id into ds_id
      from portal_datasources
     where name = ''dotlrn_homework_portlet'';

  if ds_id is not null then
    foo := portal_datasource__delete(ds_id);
  end if;

return 0;
end;' language 'plpgsql';

select inline_0();
drop function inline_0();

	-- drop the hooks
	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_portlet',
	       'GetMyName'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_portlet',
	       'GetPrettyName'
	);


	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_portlet',
	       'Link'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_portlet',
	       'AddSelfToPage'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_portlet',
	       'Show'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_portlet',
	       'Edit'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_portlet',
	       'RemoveSelfFromPage'
	);

	-- Drop the binding
	select acs_sc_binding__delete (
	    'portal_datasource',
	    'dotlrn_homework_portlet'
	);

	-- drop the impl
	select acs_sc_impl__delete (
		'portal_datasource',
		'dotlrn_homework_portlet'
	);


-- Drop admin portlet
create function inline_0()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
  foo integer;
begin

    select datasource_id into ds_id
      from portal_datasources
     where name = ''dotlrn_homework_admin_portlet'';

  if ds_id is not null then
    foo := portal_datasource__delete(ds_id);
  end if;

return 0;
end;' language 'plpgsql';

select inline_0();
drop function inline_0();

	-- drop the hooks
	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_admin_portlet',
	       'GetMyName'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_admin_portlet',
	       'GetPrettyName'
	);


	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_admin_portlet',
	       'Link'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_admin_portlet',
	       'AddSelfToPage'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_admin_portlet',
	       'Show'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_admin_portlet',
	       'Edit'
	);

	select acs_sc_impl_alias__delete (
	       'portal_datasource',
	       'dotlrn_homework_admin_portlet',
	       'RemoveSelfFromPage'
	);

	-- Drop the binding
	select acs_sc_binding__delete (
	    'portal_datasource',
	    'dotlrn_homework_admin_portlet'
	);

	-- drop the impl
	select acs_sc_impl__delete (
		'portal_datasource',
		'dotlrn_homework_admin_portlet'
	);
