class Login

  # include PageObject

  def name
    'Hi'
  end

  def self.check_user_name(value)
    gmail_user_name = value
    if gmail_user_name == 'nousautomation@gmail.com'
      puts "#{value} as logged in successfully"
    else
      raise "not valid"
    end
  end

  def self.check_password_error_message(value)
    binding.pry
  end
end