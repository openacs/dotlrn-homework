
-- Drops homework portlets

-- @author Don Baccus (dhogaza@pacifier.com)
-- @creation-date 2002-07-19

-- $Id$

-- This is free software distributed under the terms of the GNU Public
-- License version 2 or higher.  Full text of the license is available
-- from the GNU Project: http://www.fsf.org/copyleft/gpl.html

create function inline_0() returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
  from portal_datasources
  where name = ''dotlrn_homework_portlet'';

  if ds_id is not null then
    perform portal_datasource__delete(ds_id);
  end if;

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

create function inline_0() returns integer as '
declare
	foo integer;
begin

	-- drop the hooks
	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''GetMyName''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''GetPrettyName''
	);


	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''Link''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''AddSelfToPage''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''Show''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''Edit''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''RemoveSelfFromPage''
	);

	-- Drop the binding
	perform acs_sc_binding__delete (
	          ''portal_datasource'',
	          ''dotlrn_homework_portlet''
	);

	-- drop the impl
	perform acs_sc_impl__delete (
                  ''portal_datasource'',
		  ''dotlrn_homework_portlet''
	);

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

create function inline_0() returns integer as '
-- Drop admin portlet
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
  from portal_datasources
  where name = ''dotlrn_homework_admin_portlet'';

  if ds_id is not null then
    perform portal_datasource__delete(ds_id);
  end if;

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

create function inline_0() returns integer as '
declare
	foo integer;
begin

	-- drop the hooks
	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''GetMyName''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''GetPrettyName''
	);


	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''Link''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''AddSelfToPage''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''Show''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''Edit''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''RemoveSelfFromPage''
	);

	-- Drop the binding
	perform acs_sc_binding__delete (
	        ''portal_datasource'',
	        ''dotlrn_homework_admin_portlet''
	);

	-- drop the impl
	perform acs_sc_impl__delete (
		''portal_datasource'',
		''dotlrn_homework_admin_portlet''
	);

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

