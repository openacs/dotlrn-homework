  <if @toolbar:rowcount@ gt 0>
     <nobr>
       <small>[
         <multiple name="toolbar">
           <if @toolbar.rownum@ ne 1>
             |
           </if>
           <a href="@toolbar.target@">@toolbar.label@</a>
         </multiple>
       ]</small>
     </nobr>
     <br><br>
  </if>

  <if @folders:rowcount@ eq 0>
     <i>Folder is empty</i>
  </if>
  <else>
    <if @admin_p@ true and @show_header_p@ true>

      <%
         # This wording was provided by Sloan/MIT.  Other users will probably want to modify
         # it.
      %>

      <p>There are two ways to comment on students' files: 1) upload a separate/new file or
      2) make comments directly in the student's file.  For #1, upload your file from this page.
      For #2, first download/open and save the file to your computer.  When finished, save the
      file and then return to the Homework folder and upload your comments.
      <p>TAs and professors can upload different versions of comments from the Details page
      and can use the Version notes text box to differentiate between comments files.
      <p>For more information, read the Admin FAQ on the class Control Panel page or refer
      to the Handbook.
      <p>
    </if>
    <table border="0" class="table-display" cellpadding="5" cellspacing="0" width="85%">
      <if @show_header_p@ true>
        <tr class="table-header">
          <td>&nbsp;</td>
          <td>Title</td>
          <if @show_users_p@ true>
            <td>Student</td>
          </if>
	<else>
	<td></td>
	</else>
          <td>Action</td>
        </tr>
      </if>
      <multiple name="folders">
        <if @folders.rownum@ odd>
          <tr class="z_dark">
        </if>
        <else>
          <tr class="z_light">
        </else>
      <if @folders.content_type@ eq "content_folder">
          <td align="left">@folders.spaces;noquote@<img border="0" src="@file_storage_url@/graphics/folder.gif"></td>
          <td colspan="3"><a href="@folders.contents_url@">@folders.name@</a></td>
      </if>
      <else>
          <td align="left">@folders.spaces@<img border="0" src="@file_storage_url@/graphics/file.gif"></td>
          <td><a href="@folders.download_url@">@folders.pretty_name@</a></td>
          <td>
            <if @show_users_p@ true>
              @folders.file_owner_name@
            </if>
          </td>
          <td><small>
             <a href="@folders.view_details_url@">Details</a> 
             <if @folders.upload_correction_url@ not nil>
               | <a href="@folders.upload_correction_url@">New Comments</a>
             </if>
             <if @folders.view_correction_details_url@ not nil>
               | <a href="@folders.view_correction_details_url@">View<if @admin_p@ true>/Edit</if> Comments</a>
             </if>
          </small></td>
      </else>
        </tr>
      </multiple>
    </table>
  </else>
