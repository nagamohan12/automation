module Common
  def time_difference(start_time,end_time)
    difference_in_seconds = end_time - start_time
    return difference_in_seconds
  end

  def convert_sec_to_hour(sec=0)
    Time.at(sec).utc.strftime("%H:%M:%S:%L")
  end

  def convert_standard_date_time_format(datetime)
    datetime.strftime("%d%b %H:%M:%S")
  end

  def selenium(method)
    $seleniums.each do |driver|
      binding.pry
      if method.nil?
        driver
      else
        driver.send(method)
      end
    end
  end

  def selenium_url(url)
    $seleniums.each do |driver|
      $driver = driver
      navigate_to(url)
    end
  end
end