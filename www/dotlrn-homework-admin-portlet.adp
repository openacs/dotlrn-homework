<if @shaded_p@ true>
  <br>
</if>
<else>
  <ul>
    <li>
      <a href="@toggle_url@">
      <if @subscribe_p@ true>
        Mail me an alert whenever a homework file is uploaded
      </if>
      <else>
        Don't mail me an alert when homework files are uploaded
      </else>
      </a>
  </ul>
</else>
