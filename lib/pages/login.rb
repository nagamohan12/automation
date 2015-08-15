class Login

  include PageObject

  def check_user_name(value)
    gmail_user_name = $driver.find_element(:xpath, "//*[@id="gb"]/div[1]/div[1]/div/div[4]/div[1]/a")
    if gmail_user_name == value
      puts "#{value} as logged in successfully"
    else
      raise "Not a valid login"
    end
  end
end