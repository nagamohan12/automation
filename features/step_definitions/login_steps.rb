login_Valid_Data = $yaml_test_data["Login With Valid Credentials and Logout"]
login_invalid_Data = $yaml_test_data["Login With Invalid Credentials"]

Given(/^I open Cyclos website$/) {
  open_page $base_url
}

When(/^Login with username and password$/) {
  login login_Valid_Data["user_id"], login_Valid_Data["password"]
  check_text login_Valid_Data["user_id"]
}

Then(/^I verify that I successfully logged in and logging out with alert "([^"]*)"$/) do |arg|
  logout
  alert_accept arg
  successful_logout
end

When(/^Login with incorrect user credentials$/) {
  login login_invalid_Data["user_id"], login_invalid_Data["password"]
}

Then(/^I should get message not found with "([^"]*)"$/) do |arg|
  login_message arg
end

Then(/^I should get success with "([^"]*)"$/) do |arg|
  login_message arg
end

Then(/^After Login I verify that I successfully click on logout$/) do
  logout
end

Then(/^It should successfully logout$/) do
  successful_logout
end

Then(/^I verify that alert message with "([^"]*)"$/) do |arg|
  alert_accept arg
end

Then(/^login invalid credentials$/) do
  # $yaml_test_data["User tries to login with wrong credentials"].each do |d|
  $json_data_driven.each do |d|
    login d["user_id"], d["password"]
    check_login_scenario_is_valid
  end
end