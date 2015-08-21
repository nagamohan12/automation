require 'fileutils'
require 'csv'
require 'yaml'
class CsvToYml
  def self.convert_csv_to_yaml
    delete_old_yml_file
    begin
      files = Record.get_all_input_csv_files
      files.each do |file|
        file_basename = Record.file_name(file,'.csv')
        data = CSV.read(file, :headers => true).map(&:to_hash)
        Record.create_seed_directory
        file_name = Record.present_directory_path + '/seed/' + file_basename + '.yaml'
        File.open(file_name, 'w') { |f| f.write(data.to_yaml) }
      end
    rescue Exception => e
      puts e.message
      # process.exit(0)
    end
  end

  def self.delete_old_yml_file
    begin
      Record.delete_seed_directory
    rescue Exception => e
      puts e.message
    end
  end

end