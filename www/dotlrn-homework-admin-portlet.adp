<if @shaded_p@ true>
  <br>
</if>
<else>
  <ul>
    <li>
      <if @subscribe_p@ false>
        <b>#dotlrn-homework.Alert#</b> | <a href="@toggle_url@">#dotlrn-homework.Do_not_alert#</a>
      </if>
      <else>
        <a href="@toggle_url@">#dotlrn-homework.Alert#</a> | <b>#dotlrn-homework.Do_not_alert#</b>
      </else>
      #dotlrn-homework.lt_me_when_homework_file#
  </ul>
</else>

