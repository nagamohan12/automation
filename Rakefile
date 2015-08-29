require 'rubygems'
require 'cucumber/rake/task'
require 'pry'
require_relative 'lib/record.rb'
require_relative 'lib/excel_to_csv.rb'
require_relative 'lib/csv_to_yml.rb'
require_relative 'lib/csv_act.rb'
require_relative 'lib/xls_act.rb'

task default: %w[features]
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format html --out=features_report.html --format pretty" # Any valid command line option can go here.
end

Cucumber::Rake::Task.new(:selected_features) do |t|
  features = XlsAct.get_features_with_path
  t.cucumber_opts = "#{features} --format html --out=selected_features_report.html --format pretty"
end

Cucumber::Rake::Task.new(:selected_scenarios) do |t|
  scenarios = XlsAct.get_scenario_list
  scenarios.each do |scenario|
    puts "1"
    t.cucumber_opts = "--name #{scenario} --format html --out=selected_scenario_report.html --format pretty"
  end
end


task :selected_scenario => [] do
  ExcelToCsv.convert_all_xls_to_csv
  @user = Record.get_file_data('test')
  array_scenarios = @user.select { |u| u['status'].downcase == 'y' && !u['scenario'].nil?}
  array_scenarios.each do |record|
    Rake::Task[:list].execute record['scenario']
  end
end

task :list, [:level] => [] do |t, args|
  system "cucumber --name '#{args}'"
end
