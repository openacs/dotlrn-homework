<master src="master">
<property name="title">@name@</property>
<property name="context_bar">@context_bar@</property>

  <p>
  [<if @show_all_versions_p@ true>
      <a href="file?file_id=@file_id@&folder_id=@folder_id@&show_all_versions_p=f">Show only live version</a>
   </if>
   <else>
     <a href="file?file_id=@file_id@&folder_id=@folder_id@&show_all_versions_p=t">Show all versions</a>
   </else>
  <if @write_file_p@ true>
    | <a href="@version_add_url@">Upload a new version</a>
    <if @correction_file_p@ not true>
    | <a href="@move_url@">Move</a>
    </if>
  </if>
  <if @delete_file_p@ true>
    | <a href="file-delete?file_id=@file_id@">Delete this file (including all versions)</a>
  </if>]
  <p>

<table border=1 cellspacing=2 cellpadding=2>
  <tr>
    <td colspan=7>
      <if @show_all_versions_p@ true>All Versions of "@name@"</if>
      <else>Live version of "@name@"</else>
    </td>
  </tr>
  <tr>
    <td>Version filename</td>
    <td>Author</td>
    <td>Size (bytes)</td>
    <td>Type</td>
    <td>Modified</td>
    <td>Version Notes</td>
    <td>
      <if @action_exists_p@ true>
        Action
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
          <a href="version-delete?version_id=@version.version_id@">delete</a> 
      </if>
    </td>
  </tr>
</multiple>

</table>
