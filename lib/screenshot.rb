class Screenshot
  def self.capture_screenshot(scenario)
    return nil unless scenario
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime('%Y%m%dT%H%M%S')}.png"
    $driver.save_screenshot(screenshot)
    # embed screenshot, 'image/png'
  end
end