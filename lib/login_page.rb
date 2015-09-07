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
end