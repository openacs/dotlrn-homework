<master src="master">
<property name="title">Delete @folder_name@</property>
<property name="context_bar">@context_bar@</property>

<form method=POST action=folder-delete>
<input type=hidden name=folder_id value=@folder_id@>
<input type=hidden name=confirmed_p value="t">

<p>Are you sure you want to delete the folder "@folder_name@"?  This action cannot be reversed.

<p>
<center>
<input type=submit value="Yes, Delete It">
</center>

</form>
