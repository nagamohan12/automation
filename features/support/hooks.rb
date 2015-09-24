require 'watir-webdriver'
#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle
Before do
  # binding.pry
  # Do something before each scenario.
end

Before do |scenario|
  $start_scenario_time = Time.now
  $driver = Selenium::WebDriver.for(:"#{$browser_type}")
  # Selenium::WebDriver::Chrome::Service.executable_path = '/usr/local/bin/chromedriver'
  # $driver = Selenium::WebDriver.for(:chrome)
  $driver.manage().window().maximize()
  $wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
end

After do
  # $driver.save_screenshot('screenshots/' + driver.current_url + @time.inspect + '.png')
  # Do something after each scenario.
end

After do |scenario|
  screenshot_path = scenario.failed? ? Screenshot.capture_screenshot(scenario) : nil
  $end_scenario_time = Time.now
  diff = time_difference($start_scenario_time,$end_scenario_time)
  time_diff = convert_sec_to_hour(diff)
  if $custom_report == true
    other_data = {screenshot_path: screenshot_path, start_time: $start_scenario_time, end_time: $end_scenario_time, duration: time_diff}
    set_scenarios_details(scenario,other_data)
  end
  $driver.close
  sleep(1)
end

AfterStep do |step|
  # binding.pry
end


#Tagged hooks

Before('@Ex_tag1, @Ex_tag2') do
  # This will only run before scenarios tagged
  # with @cucumis OR @sativus.
end

AfterStep('@Ex_tag1, @Ex_tag2') do
  # This will only run after steps within scenarios tagged
  # with @cucumis AND @sativus.
end

AfterConfiguration do |config|

end

at_exit do
    # if ParallelTests.first_process?
    #   ParallelTests.wait_for_other_processes_to_finish
    if $custom_report == true && $report_name.nil?
      close_table
      execution_ends(Time.now)
    end
    # end
    # close_table
    # execution_ends(Time.now)
    # summary_report(2,1,1)
end