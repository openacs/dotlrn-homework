<master src="master">
<property name="title">@name@</property>
<property name="context_bar">@context_bar@</property>

  <p>
  [<if @show_all_versions_p@ true>
      <a href="file?file_id=@file_id@&folder_id=@folder_id@&show_all_versions_p=f">#dotlrn-homework.lt_Show_only_live_versio#</a>
   </if>
   <else>
     <a href="file?file_id=@file_id@&folder_id=@folder_id@&show_all_versions_p=t">#dotlrn-homework.Show_all_versions#</a>
   </else>
  <if @write_file_p@ true>
    | <a href="@version_add_url@">#dotlrn-homework.Upload_a_new_version#</a>
    <if @correction_file_p@ not true>
    | <a href="@move_url@">#dotlrn-homework.Move#</a>
    </if>
  </if>
  <if @delete_file_p@ true>
    | <a href="file-delete?file_id=@file_id@">#dotlrn-homework.lt_Delete_this_file_incl#</a>
  </if>]
  <p>

<table border=1 cellspacing=2 cellpadding=2>
  <tr>
    <td colspan=7>
      <if @show_all_versions_p@ true>#dotlrn-homework.All_Versions_of_name#</if>
      <else>#dotlrn-homework.Live_version_of_name#</else>
    </td>
  </tr>
  <tr>
    <td>#dotlrn-homework.Version_filename#</td>
    <td>#dotlrn-homework.Author#</td>
    <td>#dotlrn-homework.Size_bytes#</td>
    <td>#dotlrn-homework.Type#</td>
    <td>#dotlrn-homework.Modified#</td>
    <td>#dotlrn-homework.Version_Notes#</td>
    <td>
      <if @action_exists_p@ true>
        #dotlrn-homework.Action#
      </if>
    </td>
  </tr>

<multiple name=version>
  <tr>
    <td><img src="@file_storage_url@/graphics/file.gif">
      <a href="@download_url@">@version.title@</a>
    </td>
    <td>@version.author@</td>
    <td align=right>@version.content_size@</td>
    <td>@version.type@</td>
    <td>@version.last_modified@</td>
    <td>@version.description@</td>
    <td>
      <if @version.delete_p@ true>
          &nbsp;
          <a href="version-delete?version_id=@version.version_id@">#dotlrn-homework.delete#</a> 
      </if>
    </td>
  </tr>
</multiple>

</table>

