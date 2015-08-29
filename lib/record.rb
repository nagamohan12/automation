require 'fileutils'
require 'csv'
require 'yaml'
class Record
  def self.present_directory_path
    Dir.pwd
  end

  def self.get_seed_path
    present_directory_path + '/seed/'
  end

  def self.file_name(file,format)
    File.basename(file, format)
  end

  def self.get_all_input_csv_files
    Dir.glob("#{present_directory_path}/input/*.csv")
  end

  def self.csv_file(file)
    Dir.glob("#{file}")
  end

  def self.create_seed_directory
    Dir::mkdir('seed') unless File.directory?('seed')
  end

  def self.delete_seed_directory
    FileUtils.remove_dir(get_seed_path) if File.directory?('seed')
  end

  def self.get_file_data(file_name)
    return nil if file_name.empty?
    file = get_file_name_with_yaml(file_name)
    YAML.load_documents(File.open(file)).flatten
  end

  def self.get_csv_file_data(file_name)
    return nil if file_name.empty?
    file = get_file_name_with_yaml(file_name)
    YAML.load_documents(File.open(file)).flatten
  end

  def self.get_file_name_with_yaml(file_name)
    get_seed_path + file_name + '.yaml'
  end

  def self.get_all_xls_files(dir_name)
    Dir.glob("#{present_directory_path}/#{dir_name}/*.xls")
  end
end