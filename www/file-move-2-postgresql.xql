<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="file_move">      
      <querytext>
      
         select file_storage__move_file (
                  :file_id,
                  :parent_id
                );

      </querytext>
</fullquery>

<fullquery name="correction_file_move">      
      <querytext>
      
         select file_storage__move_file (
                  :correction_file_id,
                  :parent_id
                );

      </querytext>
</fullquery>

 
</queryset>
