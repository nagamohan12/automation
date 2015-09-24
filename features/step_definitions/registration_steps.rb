require 'selenium-cucumber'
require 'watir'

# include Keyword
registration_data = $yaml_test_data["Register user"]

Given(/^I open Cyclos member registration form$/) {
  open_page $base_url
  navigate_to_registration_form
}

When(/^I submit the form with valid details$/) {
  register_user registration_data["login_name"],
                registration_data["full_name"],
                registration_data["email_id"],
                registration_data["birthday"],
                registration_data["address_details"],
                registration_data["postal_code"],
                registration_data["city_name"],
                registration_data["phone_number"],
                registration_data["mobile_phone_number"],
                registration_data["fax_number"],
                registration_data["url_link"],
                registration_data["password"],
                registration_data["confirm_password"]
  submit_user
}

Then(/^I verify that I successfully registered by logging into the application$/) {
  register_successfull 'Thanks for registering! Your account has been created and needs to be activated by the administration.'
}


Then(/^I should see the message with "([^"]*)"$/) do |arg|
  register_successfull "#{arg}"
end