<master src="master">
<property name="title">Delete @title@</property>
<property name="context_bar">@context_bar@</property>

<if @blocked_p@ or @correction_file_exists_p@>

  <if @blocked_p@>
    <p>This file has versions that you do not have permission to delete,
       so you cannot delete the file.
  </if>

  <if @correction_file_exists_p@>
    <p>This file has corrections attached to it.  You must delete them first.
  </if>

</if>
<else>

  <form method=POST action=file-delete>
    <input type=hidden name=file_id value=@file_id@>
    <input type=hidden name=confirmed_p value="t">

    <p>Are you sure you want to delete the file "@title@" and all of
       its versions?  This action cannot be reversed.
    <p>

    <center>
      <input type=submit value="Yes, Delete It">
    </center>
  </form>

</else>

