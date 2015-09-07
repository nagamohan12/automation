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

task default: %w[features]

# Cucumber::Rake::Task.new(:features) do |t|
#   # t.cucumber_opts = "--format html --out=features_report.html --format pretty" # Any valid command line option can go here.
#   t
# end
#
# Cucumber::Rake::Task.new(:selected_features) do |t|
#   features = XlsAct.get_features_with_path
#   t.cucumber_opts = "#{features}"
# end

task :selected_scenario => [] do
  browsers = XlsAct.get_appllication_config
  set_initial_report_with_rake
  $browser_count = 0
      .each do |browser|
    $browser = XlsAct.get_browser
    scenarios = XlsAct.get_scenario_list
    set_browser_to_xls_table_to_html
    $features_list = []
    scenarios.each do |scenario|
      set_feature_details(scenario)
      Rake::Task[:list].execute scenario[:scenario]
    end
    close_table
    $browser_count += 1
  end
end

task :list, [:level] => [] do |t, args|
  system "cucumber REPORT=#{$report_name} BROWSER=#{$browser} --name '#{args}'"
end

