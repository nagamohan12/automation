require 'watir'

Given(/^i navigates to gmail\.com$/) do
  @login = Login.check_user_name('nousautomation@gmail.com')
  navigate_to("http://www.gmail.com")
end

When(/^user logs in using Username as "([^"]*)" and Password "([^"]*)"$/) do |arg1, arg2|
  enter_text('name', arg1, 'Email')
  click('name', 'signIn')
  enter_text('name', arg2, 'Passwd')
  submit('name', 'signIn')
end

Then(/^login should be successfull$/) do
  @login = Login.new
  wait(10)
  @login.check_user_name('nousautomation@gmail.com')
  wait(10)
  close_driver()
end
