<if @shaded_p@ true>
  <br>
</if>
<else>
  <include src="folder-chunk" admin_actions_p=@admin_actions_p@ show_upload_url_p="@show_upload_url_p@" show_header_p="0"
           admin_p="@admin_p@" min_level="@min_level@" max_level="@max_level@" list_of_folder_ids="@list_of_folder_ids@" package_id="@package_id@">
</else>
