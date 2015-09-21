require 'fileutils'
# require 'csv'
require 'yaml'
require 'roo'
require 'roo-xls'

class XlsAct

  def self.excel_to_hash(folder_name, file_name, tab_name)
    rows = []
    file = File.open(File.join(folder_name, file_name), mode = 'r')
    excel = Roo::Excel.new(file.path)
    excel.default_sheet = excel.sheets.index(tab_name) + 1
    header = excel.row(1)
    (2..excel.last_row).each do |i|
      next unless excel.row(i)[0]
      row = Hash[[header, excel.row(i)].transpose]
      row.each_key{|x| row[x] = row[x].to_s.strip if row[x]}
      rows << row
    end
    return rows
  end

  def self.excel_to_hash_for_feature(folder_name, file_name, tab_name)
    previous_rows = {}
    final_rows = {}
    file = File.open(File.join(folder_name, file_name), mode = 'r')
    excel = Roo::Excel.new(file.path)
    excel.default_sheet = excel.sheets.index(tab_name) + 1
    header = excel.row(1)
    sub_headers = excel.column(1).each_with_index.collect{|row,index| index+1 if row.to_s == '$'}.compact
    sub_headers << (excel.last_row + 1)
    initial = sub_headers.first
    i = 0
    scenario_rows = []
    scenario_row = {}
    scenario_r = []
    sub_headers.each do |sh|
      next if sh == initial
      sub_header = excel.row(sub_headers[i])
      initial_value = sub_headers[i]+1
      final_value = sh-1
      (initial_value..final_value).each do |r|
        row = Hash[[sub_header,excel.row(r)].transpose]
        row.each_key{|x| row[x] = row[x].to_s.strip if row[x]}
        row.each {|key,value| row.delete(key) if value.nil?}
        scenario_position = get_scenario_position(header)
        scenario = {sub_header[scenario_position]=>row}
        scenario_r = scenario_row.merge(scenario) {|key, a_val, b_val| [a_val,b_val] }
        scenario_row = scenario
      end
      final_rows = scenario_r.merge(previous_rows) {|key, a_val, b_val| a_val.merge b_val }
      previous_rows = final_rows
      i += 1
    end
    return final_rows
  end

  def self.get_scenario_position(header)
    index = 0
    header.each do |h|
      return index if h == 'Scenario'
      index +=1
    end
  end

  def self.xls_file_data_for_feature(filename,tabname)
    data_folder = "#{Record.present_directory_path}/input"
    data_file = "#{filename}"
    tab_name = "#{tabname}"
    my_data_in_a_hash = excel_to_hash_for_feature(data_folder, data_file, tab_name)
    return my_data_in_a_hash
  end

  def self.xls_file_data(filename,tabname)
    data_folder = "#{Record.present_directory_path}/input"
    data_file = "#{filename}"
    tab_name = "#{tabname}"
    my_data_in_a_hash = excel_to_hash(data_folder, data_file, tab_name)
    return my_data_in_a_hash
  end

  def self.get_appllication_config
    application = xls_file_data('environment.xls','Sheet1')
    application.collect{|app_name| app_name if app_name['Execute'].downcase == 'y'}.compact
  end

  def self.get_application_name
    get_appllication_config[$browser_count.to_i]['ApplicationName']
  end

  def self.get_browser
    get_appllication_config[$browser_count.to_i]['Browsers']
  end

  def self.get_all_features
    @all_features = xls_file_data("#{get_application_name}.xls",'features')
  end

  def self.get_features_list
    feature_list = get_all_features.collect{|feature| feature['Feature'] if (!feature['Execute'].nil? && feature['Execute'].downcase == 'y')}.compact
    return feature_list
  end

  def self.get_scenario_list_old
    valid_scenarios = get_all_features.collect{|feature| feature if (!feature['ScenarioExecute'].nil? && feature['ScenarioExecute'].downcase == 'y')}.compact
    @all_features_names = get_features_list
    scenarios_list = valid_scenarios.collect{|feature| feature['Scenario'] if validate_feature(feature['FeatureName'])}.compact
    return scenarios_list
  end

  def self.get_scenario_list
    scenarios_collection = []
    @all_features_names = get_features_list
    filename = "#{get_application_name}.xls"
    @all_features_names.each do |feature|
      tab_scenarios = xls_file_data(filename,feature)
      valid_scenarios = tab_scenarios.collect{|scenario| {feature: feature,scenario: scenario["Scenario"]} if scenario["Execute"].downcase == 'y'}
      scenarios_collection << valid_scenarios
    end
    return scenarios_collection.flatten.compact
  end

  def self.validate_feature(feature_name)
    return @all_features_names.include? feature_name
  end

  def self.get_features_with_path
    get_features_list.map{|feature| "features/#{feature}.feature"}
  end

end