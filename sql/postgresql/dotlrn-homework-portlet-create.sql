--
-- dotlrn-events/sql/oracle/dotlrn-events-portlet-create.sql
--

-- Creates dotlrn-homework user and admin portlets

-- @author Don Baccus (dhogaza@pacifier.com)
-- @creation-date 2002-07-19

-- $Id$

-- This is free software distributed under the terms of the GNU Public
-- License version 2 or higher.  Full text of the license is available
-- from the GNU Project: http://www.fsf.org/copyleft/gpl.html

-- user portlet
create function inline_0() returns integer as '
declare
  ds_id portal_datasources.datasource_id%TYPE;
begin

  ds_id := portal_datasource__new(
             ''dotlrn_homework_portlet'',
             ''Displays dotLRN Events ''
  );
  
  --  the standard 4 params

  -- shadeable_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''shadeable_p'',
	    ''t''
          );	


  -- hideable_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''hideable_p'',
	    ''t''
          );	

  -- link_hideable_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''link_hideable_p'',
	    ''t''
          );	

  -- user_editable_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''user_editable_p'',
	    ''t''
          );	

  -- shaded_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''shaded_p'',
	    ''f''
          );	

  perform portal_datasource__set_def_param(
            ds_id,
            ''t'',
            ''f'',
            ''folder_id'',
            ''''
          );


  -- dotlrn_homework-specific params

  -- The package_id of the package associated with this portal
  -- serves as our instance key.
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''f'',
	    ''package_id'',
	    ''''
          );

-- XXX community dotlrn_homeworks

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

create function inline_0() returns integer as '
declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl__new (
		''portal_datasource'',
		''dotlrn_homework_portlet'',
		''dotlrn_homework_portlet''
	);

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

create function inline_0() returns integer as '
declare
	foo integer;
begin

	-- add all the hooks
	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''GetMyName'',
	       ''dotlrn_homework_portlet::my_name'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''GetPrettyName'',
	       ''dotlrn_homework_portlet::get_pretty_name'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''Link'',
	       ''dotlrn_homework_portlet::link'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''AddSelfToPage'',
	       ''dotlrn_homework_portlet::add_self_to_page'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''Show'',
	       ''dotlrn_homework_portlet::show'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''Edit'',
	       ''dotlrn_homework_portlet::edit'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_portlet'',
	       ''RemoveSelfFromPage'',
	       ''dotlrn_homework_portlet::remove_self_from_page'',
	       ''TCL''
	);

	-- Add the binding
	perform acs_sc_binding__new (
	        ''portal_datasource'',
	        ''dotlrn_homework_portlet''
	);

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

-- Create the admin portlet
create function inline_0() returns integer as '
declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
  ds_id := portal_datasource__new(
             ''dotlrn_homework_admin_portlet'',
             ''dotLRN Homework Administration ''
           );

  
  --  the standard 4 params

  -- shadeable_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''shadeable_p'',
	    ''t''
          );	

  -- hideable_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''hideable_p'',
	    ''t''
          );	

  -- link_hideable_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''link_hideable_p'',
	    ''t''
          );	

  -- user_editable_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''user_editable_p'',
	    ''t''
  );	

  -- shaded_p 
  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''t'',
	    ''shaded_p'',
	    ''f''
          );	

  perform portal_datasource__set_def_param(
            ds_id,
            ''t'',
            ''f'',
            ''folder_id'',
            ''''
          );


  -- dotlrn_homework-specific params

  -- The package_id of the package associated with this portal
  -- serves as our instance key.

  perform portal_datasource__set_def_param (
	    ds_id,
	    ''t'',
	    ''f'',
	    ''package_id'',
	    ''''
          );

-- XXX community dotlrn_homeworks

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

create function inline_0() returns integer as '
declare
	foo integer;
begin

	-- create the implementation
	foo := acs_sc_impl__new (
		''portal_datasource'',
		''dotlrn_homework_admin_portlet'',
		''dotlrn_homework_admin_portlet''
	);

	-- add all the hooks
	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''GetMyName'',
	       ''dotlrn_homework_admin_portlet::my_name'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''GetPrettyName'',
	       ''dotlrn_homework_admin_portlet::get_pretty_name'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''Link'',
	       ''dotlrn_homework_admin_portlet::link'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''AddSelfToPage'',
	       ''dotlrn_homework_admin_portlet::add_self_to_page'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''Show'',
	       ''dotlrn_homework_admin_portlet::show'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''Edit'',
	       ''dotlrn_homework_admin_portlet::edit'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''dotlrn_homework_admin_portlet'',
	       ''RemoveSelfFromPage'',
	       ''dotlrn_homework_admin_portlet::remove_self_from_page'',
	       ''TCL''
	);

	-- Add the binding
	perform acs_sc_binding__new (
	        ''portal_datasource'',
	        ''dotlrn_homework_admin_portlet''
	);

  return 1;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();
