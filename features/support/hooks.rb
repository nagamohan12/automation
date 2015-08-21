require 'watir-webdriver'
#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle
Before do
  # binding.pry
  # $workbook = RubyXL::Workbook.new
  # Do something before each scenario.
end

Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
end

After do
  # $driver.save_screenshot('screenshots/' + driver.current_url + @time.inspect + '.png')
  # Do something after each scenario.
end

After do |scenario|
  if scenario.respond_to?('scenario_outline') then
    scenario = scenario.scenario_outline
  end
  if scenario.failed?
    Dir::mkdir('screenshots') unless File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now}.png"
    $driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  # close_driver()
  # $driver.cookies.clear
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