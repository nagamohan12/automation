require 'page-object'

class LoginPage
  include PageObject

  #username field element
  text_field(:username, :id => 'cyclosUsername')

  #password field element
  text_field(:password, :id => 'cyclosPassword')

  #login button element
  button(:loginbtn, :class => 'button')

  #logout button element
  button(:logoutbtn, :css => '#menu6 > span.menuText')

  #loggedinuser text element
  span(:loggedinuser, :xpath => '//*[@id="loginDataBar"]/span[1]')

  #incorrect credential error message element
  span(:errormessage, :xpath => './/*[@id="tdContents"]/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr[1]/td')

  #payment button
  button(:payment, :xpath => ".//*[@id='tdContents']/table[2]/tbody/tr[2]/td/table/tbody/tr/td[3]/a")

  #username field element
  text_field(:member_user_id, :id => 'memberUsername')

  #amount field
  text_field(:amount, :id => 'amount')

  #amount submit
  button(:amount_submit, :id => 'submitButton')

  #confirm button
  button(:submit, :class => 'button')

  #
  button(:account_btn, :css => '#menu2 > span.menuText')
  button(:account_information_btn, :xpath => "//*[contains(text(),'Account Information')]")
  text_field(:description, :id => 'description')

end