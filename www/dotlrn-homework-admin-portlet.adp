<if @shaded_p@ true>
  <br>
</if>
<else>
  <ul>
    <li>
      Alert me when homework files are updated: 
      <if @subscribe_p@ true>
        <b>Yes</b> | <a href="@toggle_url@">No</a>
      </if>
      <else>
        <a href="@toggle_url@">Yes</a> | <b>No</b>
      </else>
      </a>
  </ul>
</else>
