require 'watir'
require 'selenium-cucumber'
# require 'Login'

Given(/^it navigates to gmail\.com$/) do
  navigate_to("http://www.gmail.com")
end

# When(/^user logs with Username as "([^"]*)"$/) do |arg1|
#   enter_text('name', arg1, 'Email')
#   click('name', 'signIn')
# end

# When(/^Password "([^"]*)"$/) do |arg1|
#   enter_text('name', arg1, 'Passwd')
#   submit('name', 'signIn')
#   wait(10)
# end
@user = Record.get_file_data(test)
When(/^user logs in using valid user name$/) do
  # @user = User.all.first
  enter_text('name', @user['email'], 'Email')
  click('name', 'signIn')
end

And(/^Valid password$/) do
  wait(3)
  enter_text('name', @user['password'], 'Passwd')
  submit('name', 'signIn')
  wait(10)
end

Then(/^login should be successfull$/) do
  Login.check_user_name
  wait(10)
  click("xpath", ".//*[@id='gb']/div[1]/div[1]/div/div[4]/div[1]/a")
  click("xpath", "//a[text()='Sign out']")
  wait(5)
  close_driver()
end

Then(/^login should be failed as 'Please enter your email\.'$/) do
  Login.check_password_error_message
end

When(/^user logs in using Username as "([^"]*)"$/) do |arg1|
  enter_text('name', arg1, 'Email')
  click('name', 'signIn')
end

When(/^Password "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^login should be failed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end