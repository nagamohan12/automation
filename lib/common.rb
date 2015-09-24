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
end