require 'rubygems'
require 'selenium-cucumber'
require 'pry'
require 'page-object'
require 'spreadsheet'
require 'selenium-webdriver'
require 'rails'
# require 'rubysl-win32ole'
# require 'win32ole'
require 'record'
require 'rake'
require 'xls_act'
require 'roo'
require 'seed_data'
require 'code_html'
require 'report_details'
require 'xls_report'
require 'keyword'
require 'login_page'
require 'registration_page'
require 'screenshot'

# Store command line arguments
include CodeHtml
include XlsReport
include ReportDetails
include Keyword
SeedData.new()
$browser_type = ENV['BROWSER'] || $browser || 'ff'
$report_name = ENV['REPORT']
$features = []

begin
  set_initial_report_with_cucumber if $report_name.nil?
rescue Exception => e
  puts e.message
  Process.exit(0)
end
