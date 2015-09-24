require 'rubygems'
require 'cucumber/rake/task'
require 'pry'
require_relative 'lib/record.rb'
require_relative 'lib/xls_act.rb'
require_relative 'lib/code_html.rb'
require_relative 'lib/xls_report.rb'
require_relative 'lib/report_details'
require 'spreadsheet'

include CodeHtml
include XlsReport
include ReportDetails
$custom_report = ENV['CUSTOM_REPORT'] || false
task default: %w[features]

# Cucumber::Rake::Task.new(:features) do |t|
#   t.cucumber_opts = "--format html --out=features_report.html --format pretty" # Any valid command line option can go here.
#   t
# end
#
# Cucumber::Rake::Task.new(:selected_features) do |t|
#   features = XlsAct.get_features_with_path
#   t.cucumber_opts = "#{features}"
# end

task :selected_scenario => [] do
  browsers = XlsAct.get_appllication_config
  set_initial_report_with_rake if $custom_report
  $browser_count = 0
  browsers.each do |browser|
    $browser = XlsAct.get_browser
    scenarios = XlsAct.get_scenario_list
    set_browser_to_xls_table_to_html if $custom_report
    $features_list = []
    scenarios.each do |scenario|
      set_feature_details(scenario) if $custom_report
      Rake::Task[:list].execute scenario[:scenario]
    end
    close_table if $custom_report
    $browser_count += 1
  end
  execution_ends(Time.now) if $custom_report
end

task :list, [:level] => [] do |t, args|
  system "cucumber REPORT=#{$report_name} BROWSER=#{$browser} CUSTOM_REPORT=#{$custom_report} --name '#{args}'"
  # system "cucumber REPORT=#{$report_name} BROWSER=#{$browser} CUSTOM_REPORT=#{$custom_report} --name '#{args}' -f pretty -f json -o /home/administrator/RubymineProjects/json_reports/results.json >> /home/administrator/RubymineProjects/json_reports/results1.json"
end

