require 'page-object'

class RegistrationPage
  include PageObject

  #register button element
  button(:registerbtn, :css => '#loginRegistrationDiv > input')

  #register form field elements
  text_field(:loginname, :name => 'member(user).username')
  text_field(:fullname, :name => 'member(name)')
  text_field(:email, :name => 'member(email)')
  text_field(:birthday, :name => 'member(customValues).value')
  radio_button(:gender, :id => '_radio_2_1')
  text_field(:address, :xpath => './/*[@id="tdContents"]/div/form/table[1]/tbody/tr[2]/td/table/tbody/tr[6]/td[2]/input[3]')
  text_field(:postalcode, :xpath => './/*[@id="tdContents"]/div/form/table[1]/tbody/tr[2]/td/table/tbody/tr[7]/td[2]/input[3]')
  text_field(:city, :xpath => './/*[@id="tdContents"]/div/form/table[1]/tbody/tr[2]/td/table/tbody/tr[8]/td[2]/input[3]')
  select_list(:area, :xpath => './/*[@id="custom_field_select_6"]/option[2]')
  text_field(:phone, :xpath => './/*[@id="tdContents"]/div/form/table[1]/tbody/tr[2]/td/table/tbody/tr[10]/td[2]/input[3]')
  text_field(:mobilephone, :xpath => './/*[@id="tdContents"]/div/form/table[1]/tbody/tr[2]/td/table/tbody/tr[11]/td[2]/input[3]')
  text_field(:fax, :xpath => './/*[@id="tdContents"]/div/form/table[1]/tbody/tr[2]/td/table/tbody/tr[12]/td[2]/input[3]')
  text_field(:url, :xpath => './/*[@id="tdContents"]/div/form/table[1]/tbody/tr[2]/td/table/tbody/tr[13]/td[2]/input[3]')
  text_field(:password, :name => 'member(user).password')
  text_field(:confirmpassword, :name => 'confirmPassword')

  #all checkbox elements available in form
  checkboxes(:allcheckboxclick, :xpath => './/input[@class="checkbox"]')

  #captcha paasing element
  text_field(:captcha, :name => 'captcha')

  #submit button element
  button(:submitbtn, :id => 'saveButton')

  #registration success text
  span(:registerSuccess, :xpath => './/*[@id="tdContents"]/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr[1]/td')
  button(:okbtn, :id => 'btn')
end