<master src="master">
<property name="title">Move</property>
<property name="context_bar">@context_bar@</property>

<P>Select the folder that you would like to move "@name@" under

<form method=GET action="file-move-2">
<input type=hidden name=file_id value="@file_id@">

<include src="/packages/file-storage/www/folder-list" file_id="@file_id@">
<p>
<input type=submit value="Move">
</form>
