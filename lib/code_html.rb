# To Create HTML report for this application
module CodeHtml
  def get_time_name
    $time=Time.now
    $time_name=$time.strftime("%H-%M-%S-%d-%m-%Y")
    $result_date = $time.strftime("%a, %e-%b-%Y %H:%M:%S")
  end
  def create_report
    get_time_name
    @result_file_name="Report"+"-"+$time_name
    $full_file_name="Results/#{@result_file_name}"
    @report_name = "#{$full_file_name}.html"
    $report=File.open($full_file_name,'w')
  end
  def open_report_file
    $report_full_name = $report_name.nil? ? $full_file_name : $report_name
    @report_name = "#{$report_full_name}.html"
    $report=File.open($report_full_name,'a')
  end
  def insert_head_title(title)
    $report.puts "<html><head>
  <title> #{title} </title>
  </head>"
  end

  def browser_data
    open_report_file
    browser_name = "<b>Browser: </b> #{$browser}"
    post_data(browser_name,'','')
  end

  def scenario_data(name,result,remarks,screenshot,start_time,end_time,duration)
    open_report_file
    start_scenario_time = convert_standard_date_time_format(start_time)
    end_scenario_time = convert_standard_date_time_format(end_time)
    post_data(name,result,remarks,screenshot,start_scenario_time,end_scenario_time,duration)
  end

  def feature_data(name)
    open_report_file
    feature_name = "<b>Feature: </b> #{name}"
    post_data(feature_name,'','')
  end

  def post_data(name,result,remarks,screenshot=nil,start_time=nil,end_time=nil,duration=nil)
    color = ""
    color = "bgcolor='green'" if result.downcase == 'pass'
    color = "bgcolor='red'" if result.downcase == 'fail'
    screenshot_link = "screenshot" unless screenshot.nil?
    if name.include? 'Feature'
      $report.puts "<tr></tr>"
    end
    $report.puts "<tr>
                    <td>#{name}</td>
                    <td #{color}>#{result}</td>
                    <td>#{remarks}</td>
                    <td><a href=#{screenshot} target='_blank'>#{screenshot_link}</a></td>
                    <td>#{start_time}</td>
                    <td>#{end_time}</td>
                    <td>#{duration}</td>
                  </tr>"
    $report.close
  end

  def start_table
    open_report_file
    $report.puts "<table border='1'; width: '100%'>
                    <tr>
                      <th>Description</th>
                      <th>Result</th>
                      <th width='40%'>Remarks</th>
                      <th width='10%'>Screenshot</th>
                      <th>Start</th>
                      <th>End</th>
                      <th>Duration</th>
                    </tr>"
    $report.close
    browser_data
  end

  def insert_reportname_date(name,date)
    $report.puts "<body bgcolor='#5CB3FF'>
  <p size=12>
  <center> <b><u>#{name} </u></b></center>
  </p>
  <p align='right' size=12>
  <b>Execution Starts: #{date} </b>
  </p>"
    $report.close
  end

  def report_row(*details)
    open_report_file
    name=details[0]
    desc=details[1]
    browser=details[2]
    result=details[3]
    reason=details[4]
    if result.downcase == "pass"
      $report.puts "<tr>
  <td>#{name}</td>
  <td> #{desc}</td>
  <td> #{browser} </td>
  <td bgcolor='green'>#{result}</td>
  <td>#{reason}</td>
  </tr>"
    else
      $report.puts "<tr>
  <td>#{name}</td>
  <td> #{desc}</td>
  <td> #{browser} </td>
  <td bgcolor='red'>#{result}</td>
  <td>#{reason}</td>
  </tr>"
    end
    $report.close
  end
  def close_table
    $report=File.open($report_full_name,'a')
    $report.puts "</table></br>"
    $report.close
  end
  def summary_report(overall,passed,failed)
    $report_overall=overall
    $report_pass=passed
    $report_fail=failed
    $report=File.open($report_full_name,'a')
    $report.puts "<p> <b>Total Test cases : #{$report_overall} </b></p>
  <p> <b>Passed : #{$report_pass} </b></p>
  <p> <b>Failed : #{$report_fail} </b></p>
  </body>
  </html>"
    $report.close
  end
  def execution_ends(time)
    open_report_file
    end_date = time.strftime("%a, %e-%b-%Y %H:%M:%S")
    $report.puts "<p align='right' size=12>
  <b>Execution Ends: #{end_date} </b>
  </p>"
    $report.close
  end
end