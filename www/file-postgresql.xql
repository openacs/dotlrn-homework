<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="file_info">      
      <querytext>
      
	select person__name(o.creation_user) as owner,
       		i.name as title,
       		r.title as name,
       		acs_permission__permission_p(:file_id,:user_id,'write') as write_p
	from   acs_objects o, cr_revisions r, cr_items i
	where  o.object_id = :file_id
	and    i.item_id   = o.object_id
	and    r.revision_id = i.live_revision
      </querytext>
</fullquery>

<fullquery name="version_info">      
      <querytext>

	select  r.title,
       		r.revision_id as version_id,
       		person__name(o.creation_user) as author,
       		r.mime_type as type,
       		to_char(o.last_modified,'YYYY-MM-DD HH24:MI') as last_modified,
       		r.description,
       		r.content_length as content_size
	from   acs_objects o, cr_revisions r, cr_items i
	where  o.object_id = r.revision_id
	and    r.item_id = i.item_id
	and    r.item_id = :file_id
	$show_versions

      </querytext>
</fullquery> 

<partialquery name="show_all_versions">      
      <querytext>

      </querytext>
</partialquery> 	

<partialquery name="show_live_version">      
      <querytext>

	and r.revision_id = i.live_revision

      </querytext>
</partialquery> 	

</queryset>


