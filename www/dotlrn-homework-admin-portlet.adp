<if @shaded_p@ true>
  <br>
</if>
<else>
  <ul>
    <li>
      <if @subscribe_p@ true>
        <b>Alert</b> | <a href="@toggle_url@">Do not alert</a>
      </if>
      <else>
        <a href="@toggle_url@">Alert</a> | <b>Do not alert</b>
      </else>
      me when homework files are updated
  </ul>
</else>
