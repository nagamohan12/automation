require 'selenium-webdriver'
require 'page-object'

module Keyword

  def open_page url
    navigate_to(url)
  end

  def login(userid, password)
    begin
      @login = LoginPage.new($driver)
      $wait.until {@login.username}
      @login.username_element.clear
      @login.username_element.send_keys userid
      @login.password_element.clear
      @login.password_element.send_keys password
      @login.loginbtn_element.click
    rescue
      raise ArgumentError.new("Failure to login")
    end
  end

  def logout
    begin
      sleep(1)
      @login.logoutbtn_element.click
    rescue
      raise ArgumentError.new("logout button failed to click")
    end
  end

  def check_text(username)
    begin
      $wait.until {@login.loggedinuser.include?(username)}
    rescue StandardError => e
      raise ArgumentError.new("'#{username}' is not present on the page")
    end
  end

  def alert_accept(confirm_message)
    sleep(1)
    begin
      alert = $wait.until {$driver.switch_to.alert}
      $wait.until {alert.text.include? (confirm_message)}
      # alert.check_text(confirm_message)
      alert.accept
    rescue
      alert.dismiss if alert
      raise ArgumentError.new("'#{confirm_message}' is not present on the page")
    end
  end

  def successful_logout
    begin
      $wait.until {@login.username_element}
    rescue
      raise ArgumentError.new("'#{confirm_message}' is not present on the page")
    end
  end

  def login_message message
    begin
      $wait.until {@login.errormessage.include?(message)}
    rescue
      raise ArgumentError.new("'#{message}' is not present on the page")
    end
  end

  def self.browser_close
      $driver.close
  end

  def navigate_to_registration_form
    @register = RegistrationPage.new($driver)
    $wait.until {@register.registerbtn_element}
    @register.registerbtn_element.click
  end

  def register_user(loginName, fullName, emailID, birthDay, addressDetails, postalCode, cityName, phoneNumbr,
                    mobilePhoneNumbr, faxNumbr, urlLink, password, confirmPassword)
    $wait.until {@register.loginname}
    @register.loginname_element.clear
    @register.loginname_element.send_keys loginName
    @register.fullname_element.clear
    @register.fullname_element.send_keys fullName
    @register.email_element.clear
    @register.email_element.send_keys emailID
    @register.birthday_element.clear
    @register.birthday_element.send_keys birthDay
    @register.gender_element.click
    @register.address_element.clear
    @register.address_element.send_keys addressDetails
    @register.postalcode_element.clear
    @register.postalcode_element.send_keys postalCode
    @register.city_element.clear
    @register.city_element.send_keys cityName
    @register.area_element.click
    @register.phone_element.clear
    @register.phone_element.send_keys phoneNumbr
    @register.mobilephone_element.clear
    @register.mobilephone_element.send_keys mobilePhoneNumbr
    @register.fax_element.clear
    @register.fax_element.send_keys faxNumbr
    @register.url_element.clear
    @register.url_element.send_keys urlLink
    @register.password_element.clear
    @register.password_element.send_keys password
    @register.confirmpassword_element.clear
    @register.confirmpassword_element.send_keys confirmPassword

    @register.allcheckboxclick_elements.each { |e| e.click if e.attribute('checked').nil? }

   #@register.captcha_element.send_keys
  end

  def submit_user
    begin
      @register.submitbtn_element.location_once_scrolled_into_view
      @register.submitbtn_element.click
    rescue
      ArgumentError.new("Failure! submit button failed to click")
    end
  end

  def register_successfull success_message
    sleep(2)
    begin
      @alert = $driver.switch_to.alert
      $wait.until {@alert.text.include? success_message}
      @alert.accept
      # $wait.until {@register.registerSuccess.include? successMesssge}
      # @register.okbtn_element.click
    rescue
      @alert.dismiss
      raise ArgumentError.new("#{success_message} is not present on the page")
    end
  end

    # def captcha_decode
    #   @register.captcha_element
    # end

  def payment
    sleep(1)
    begin
      @login.payment_element.click
    rescue
      raise ArgumentError.new("payment button failed to click")
    end
  end

  def username_to_send_amount(user,amount)
    begin
      $wait.until {@login.member_user_id}
      @login.member_user_id.clear
      @login.member_user_id_element.send_keys user
      sleep(1)
      @login.amount_element.send_keys amount
      $account_description = Time.now
      @login.description_element.send_keys $account_description
      @login.amount_submit_element.click
      sleep(1)
      @login.submit
    rescue
      raise ArgumentError.new('payment not success')
    end
  end

  def open_account_information
    begin
      sleep(1)
      @login.account_btn_element.click
      sleep(1)
      @login.account_information_btn_element.click
    rescue
      raise ArgumentError.new('Payment information not opened properly')
    end
  end

  def check_account_transffered
    begin
      description = $wait.until {$driver.find_element(:xpath, "//*[contains(text(),'#{$account_description}')]")}
      description.text.equal? $account_description
    rescue
      raise ArgumentError.new('Payment not transffered')
    end
  end

  def check_login_scenario_is_valid
    invalid = ["Login name is required","Password is required","Invalid login. Please try again"]
    sleep(1)
    begin
      alert = $driver.switch_to.alert
    rescue
      alert = nil
    end
    if alert
      result = false
      invalid.each do |message|
        if alert.text.include? message
          result = true
        end
        next
      end
    else
      logout
      alert_accept 'Please confirm to logout'
      successful_logout
    end
    alert.dismiss if alert
  end

end
