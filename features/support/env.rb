require 'rubygems'
require 'selenium-cucumber'
require 'pry'
require 'login'
require 'rubyXL'
require 'page-object'
require 'spreadsheet'
require 'importex'
require 'user'
require 'rails'
# require 'rubysl-win32ole'
# require 'win32ole'
require 'excel_to_csv'
require 'csv_to_yml'
require 'record'
# require 'odbc'
require 'xls_with_odbc'
require 'csv_act'
require 'rake'
require 'xls_act'
require 'roo'
require 'seed_data'
# require "#{File.dirname(__FILE__)}/configuration"

# Store command line arguments
SeedData.new()
$browser_type = $browser || 'ff'
$platform = ENV['PLATFORM'] || 'desktop'
$os_version = ENV['OS_VERSION']
$device_name = ENV['DEVICE_NAME']
$udid = ENV['UDID']
$app_path = ENV['APP_PATH']

# check for valid parameters
# validate_parameters $platform, $browser_type, $app_path

# If platform is android or ios create driver instance for mobile browser
# if $platform == 'android' or $platform == 'iOS'
  
#   if $browser_type == 'native'
#     $browser_type = "Browser"
#   end
  
#   if $platform == 'android'
#     $device_name, $os_version = get_device_info
#   end
  
#   desired_caps = {
#     caps:       {
#       platformName:  $platform,
#       browserName: $browser_type,
#       versionNumber: $os_version,
#       deviceName: $device_name,
#       udid: $udid,
#       app: ".//#{$app_path}"
#       },
#     }

#   begin
#     $driver = Appium::Driver.new(desired_caps).start_driver
#   rescue Exception => e
#     puts e.message
#     Process.exit(0)  
#   end
# else # else create driver instance for desktop browser
  begin
    # CsvAct.read_feature
    # ExcelToCsv.convert_all_xls_to_csv
    $driver = Selenium::WebDriver.for(:"#{$browser_type}")
    $driver.manage().window().maximize()
    # Spreadsheet.client_encoding = 'UTF-8'
    # User.import('/home/administrator/RubymineProjects/test_automation/logins.xls')
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
# end
