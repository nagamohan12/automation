require_relative 'code_html.rb'
require_relative 'xls_report.rb'
module ReportDetails
  include CodeHtml
  include XlsReport
  def set_initial_report_with_rake
    create_report
    $report_name = $full_file_name
    create_new_xls
    application_name =XlsAct.get_application_name
    insert_head_title(application_name)
    insert_reportname_date(application_name,$result_date)
  end

  def set_initial_report_with_cucumber
    create_report
    create_new_xls
    insert_head_title($application_name)
    insert_reportname_date($application_name,$result_date)
    start_table
  end

  def set_feature_details(scenario)
    feature_data(scenario[:feature]) unless $features_list.include? scenario[:feature]
    $features_list << scenario[:feature]
  end

  def set_scenarios_details(scenario,screenshot)
    # Cucumber::Core::Ast
    scenario_name = scenario.name
    feature_name = scenario.feature.name
    status = scenario.failed? ? "FAIL" : "PASS"
    remarks = scenario.exception ? scenario.exception.message.to_s : ""
    if $report_name.nil?
      feature_data(feature_name) unless $features.include? feature_name
      $features << feature_name
    end
    scenario_data(scenario_name,status,remarks,screenshot[:screenshot_path],screenshot[:start_time],screenshot[:end_time],screenshot[:duration])
    insert_output_excel_row([feature_name,scenario_name,status,remarks,screenshot[:start_time],screenshot[:end_time],screenshot[:duration]])
  end

  def set_browser_to_xls_table_to_html
    start_table
    insert_output_excel_row(['','','',''])
    insert_output_excel_row(["BROWSER: #{$browser}",'','',''])
    insert_output_excel_row(['','','',''])
  end
end