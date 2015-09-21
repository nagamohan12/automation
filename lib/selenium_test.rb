class SeleniumTest
  def setup
    $seleniums = %w(ff chrome).map do |browser|
      puts 'creating browser ' + browser
      # $driver = Selenium::SeleniumDriver.new("localhost", 4444, browser, "http://192.168.16.169:8080", 10000)
      Selenium::WebDriver.for(:"#{browser}")
    end
    # start
    maximize
  end

  def maximize
    $seleniums.each do |selenium_driver|
      selenium_driver.manage().window().maximize()
    end
  end

  def teardown
    stop
  end

  #sub-classes should override this if they want to change it
  def start_address
    "http://192.168.16.169:8080"
  end

  # Overrides standard "open" method
  def open(addr)
      # navigate_to addr
  end

  # Overrides standard "type" method
  def type(inputLocator, value)
    method_missing 'type', inputLocator, value
  end

  # Overrides standard "select" method
  def select(inputLocator, optionLocator)
    method_missing 'select', inputLocator, optionLocator
  end

  def method_missing(method_name, *args)
    $seleniums.each do |selenium_driver|
      binding.pry
      if args.empty?
        # method_name.inject(selenium_driver) {|a,b| a.send(b)}
        selenium_driver.send method_name
      else
        # method_name.inject(selenium_driver) {|a,b| a.send(b)}
        selenium_driver.send method_name, *args
      end
    end
  end
end