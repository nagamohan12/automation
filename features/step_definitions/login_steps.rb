require 'watir'
require 'selenium-cucumber'
# require 'Login'

Given(/^it navigates to gmail\.com$/) do
  navigate_to("http://www.gmail.com")
end

When(/^user logs in using Username as "([^"]*)"$/) do |arg1|
  enter_text('name', arg1, 'Email')
  click('name', 'signIn')
end

When(/^Password "([^"]*)"$/) do |arg1|
  enter_text('name', arg1, 'Passwd')
  submit('name', 'signIn')
  wait(10)
end

Then(/^login should be successfull$/) do
  value = get_element_text("xpath", ".//*[@id='gb']/div[1]/div[1]/div/div[4]/div[1]/a")
  Login.check_user_name(value)
  wait(10)
  click("xpath", ".//*[@id='gb']/div[1]/div[1]/div/div[4]/div[1]/a")
  click("xpath", "//a[text()='Sign out']")
  wait(5)
  close_driver()
end

Then(/^login should be failed$/) do
  value = get_element_text("id", "errormsg_0_Passwd")
  Login.check_password_error_message(value)
end
