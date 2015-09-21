require 'rubygems'
require 'selenium-cucumber'
require 'pry'
require 'page-object'
require 'spreadsheet'
require 'selenium-webdriver'
# require 'rails'
# require 'rubysl-win32ole'
# require 'win32ole'
require 'rake'
require 'roo'
require 'json'
require "require_all"
require_all 'lib'

# Store command line arguments
include CodeHtml
include XlsReport
include ReportDetails
include Keyword
include Common
SeedData.new()
$browser_type = ENV['BROWSER'] || $browser || 'ff'
$report_name = ENV['REPORT']
$features = []

# if ENV['HEADLESS'] == 'true'
#   require 'headless'
#
#   headless = Headless.new
#   headless.start
#
#   at_exit do
#     headless.destroy
#   end
# end

begin
  set_initial_report_with_cucumber if $report_name.nil?
rescue Exception => e
  puts e.message
  Process.exit(0)
end
