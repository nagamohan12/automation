require 'fileutils'
require 'csv'
module XlsReport
  def create_new_xls
    xls_report_name = $report_name.nil? ? $full_file_name : $report_name
    report_name = "#{xls_report_name}.xls"
    $excel_result_file = "#{Record.present_directory_path}/#{report_name}"
    create_header
  end
  def create_header
    header = ["Feature", "Scenario", "Result", "Remarks","start","end","Duration"]
    insert_output_excel_row(header)
  end
  def insert_output_excel_row(row)
    @xls_report_name = $report_name.nil? ? $excel_result_file : $report_name
    @report_name = "#{@xls_report_name}.xls"
    CSV.open("#{@report_name}", "a") do |csv|
      csv << row
    end
  end
end