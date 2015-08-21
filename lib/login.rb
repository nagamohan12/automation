class Login

  # include PageObject

  def self.check_user_name
    begin
      gmail_user_name = get_element_text("xpath", ".//*[@id='gb']/div[1]/div[1]/div/div[4]/div[1]/a")
      if gmail_user_name == 'nousautomation@gmail.com'
        puts "#{gmail_user_name} as logged in successfully"
      else
        puts "not valid Credentials"
      end
    rescue Exception => e
      puts e.message
    end
  end

  def self.check_password_error_message
    begin
      value = get_element_text("id", "errormsg_0_Email")
      if value == "Please enter your email."
        puts "Empty text in Email text field"
      else
        puts "Entered some text in email text field"
      end
    rescue Exception => e
      puts e.message
    end
  end
end