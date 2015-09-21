transfer_data = $login["transfer_amount"]
Given(/^An account holder is on payment form$/) do
  open_page $base_url
  login transfer_data["sender"], transfer_data["sender_password"]
  payment
end

When(/^Transfers amount to other account holder$/) do
  username_to_send_amount(transfer_data["receiver"], transfer_data['amount'])
  logout
  alert_accept 'Please confirm to logout'
  successful_logout
end

Then(/^Recepeint should recieves the same amount which has been tranfered$/) do
  login transfer_data["receiver"], transfer_data["receiver_password"]
  open_account_information
  check_account_transffered
end