<?xml version="1.0"?>

<queryset>
<rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="dotlrn_homework::new.check_duplicate">      
   <querytext>
      
     select 1
     where exists (select name
                   from cr_items
                   where parent_id = :parent_folder_id
                     and name = :title)

   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::new.new_lob_file">      
   <querytext>
      FIX ME PLSQL
FIX ME PLSQL

     begin
       :1 := file_storage__new_file (
               item_id => :file_id,
               title => :title,
               folder_id => :parent_folder_id,
               creation_user => :user_id,
               creation_ip => :creation_ip,
               indb_p => :indb_p
             );
     end;
            
   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::new.new_version">      
   <querytext>
      FIX ME PLSQL
FIX ME PLSQL

     begin
       :1 := file_storage__new_version (
               filename => :filename,
               description => :description,
               mime_type => :mime_type,
               item_id => :file_id,
               creation_user => :user_id,
               creation_ip => :creation_ip
             );
     end;
   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::new.lob_content">      
   <querytext>
      FIX ME LOB

     update cr_revisions
     set content = empty_blob()
     where revision_id = :revision_id
     returning content into :1
            
   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::new.lob_size">      
   <querytext>
      
     update cr_revisions
     set content_length = dbms_lob__getlength(content) 
     where revision_id = :revision_id
            
   </querytext>
</fullquery>

 
<fullquery name="dotlrn_homework::add_correction_relation.relate">      
   <querytext>
      FIX ME PLSQL
FIX ME PLSQL

     begin
       :1 := content_item__relate(
               item_id => :homework_file_id,
               object_id => :correction_file_id,
               relation_tag => 'homework_correction'
             );
     end;
        
   </querytext>
</fullquery>

 
</queryset>
