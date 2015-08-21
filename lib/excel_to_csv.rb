require 'roo-xls'
require 'roo'
require 'csv'
require 'yaml'
class ExcelToCsv
INPUT_DIR = 'input'
  def self.convert_all_xls_to_csv
    present_directory_path = Record.present_directory_path
    all_excel_files = Record.get_all_xls_files(INPUT_DIR)
    all_excel_files.each do |file|
      file_path = "#{file}"
      file_basename = Record.file_name(file, ".xls")
      xls =Roo::Excel.new(file_path)
      xls.to_csv("#{present_directory_path}/#{INPUT_DIR}/#{file_basename}.csv")
    end
    CsvToYml.convert_csv_to_yaml
  end
end
