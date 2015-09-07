require 'watir-webdriver'
#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle
Before do
  # binding.pry
  # Do something before each scenario.
end

Before do |scenario|
  $driver = Selenium::WebDriver.for(:"#{$browser_type}")
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
  Screenshot.capture_screenshot(scenario) if scenario.failed?
  set_scenarios_details(scenario)
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

at_exit do
  if $report_name.nil?
    close_table
  end
  # summary_report(2,1,1)
end