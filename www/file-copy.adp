<master src="master">
<property name="title">#dotlrn-homework.Copy#</property>
<property name="context_bar">@context_bar@</property>

<P>#dotlrn-homework.lt_Select_the_folder_tha#

<form method=GET action="file-copy-2">
<input type=hidden name=file_id value="@file_id@">

<include src="/packages/file-storage/www/folder-list" file_id="@file_id@">
<p>
<input type=submit value="#dotlrn-homework.Copy#">
</form>

