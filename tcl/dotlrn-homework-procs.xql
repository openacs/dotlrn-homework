<?xml version="1.0"?>
<queryset>

<fullquery name="dotlrn_homework::new.get_owner_id">      
   <querytext>
     select creation_user as homework_user_id from acs_objects where object_id = :homework_file_id
   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::new.update_context">      
   <querytext>
      
     update acs_objects
     set context_id = null
     where object_id = :file_id
            
   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::new.fs_content_size">      
   <querytext>
      
     update cr_revisions
     set content = :tmp_filename,
       content_length = :tmp_size
     where revision_id = :revision_id
            
   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::send_homework_alerts.get_alert_info">      
   <querytext>
      
     select f.name, folder.label as folder_name,
       p.first_names || ' ' || p.last_name as student_name
     from cr_items f, cr_folders folder, persons p, acs_objects o
     where f.item_id = :file_id
       and o.object_id = :file_id
       and folder.folder_id = :folder_id
       and p.person_id = o.creation_user

   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::send_correction_alerts.get_alert_info">      
   <querytext>
      
     select f.name, folder.label as folder_name,
       p.first_names || ' ' || p.last_name as admin_name
     from cr_items f, cr_folders folder, persons p
     where item_id = :homework_file_id
       and folder.folder_id = :folder_id
       and p.person_id = :user_id

   </querytext>
</fullquery>
 
</queryset>
