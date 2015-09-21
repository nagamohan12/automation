Feature: Member Registration
  Member Registration process should be quick and friendly

  Scenario Outline: User tries to register on cyclos
    Given I open Cyclos member registration form
    When I submit the form with valid details
    Then I should see the message with "<arg>"
#    When I submit the form with valid details
#    Then I verify that I successfully registered by logging into the application
    Examples:
      | arg                                               |
#      | Registration is Successfull |
      | You have not typed the image characters correctly |

