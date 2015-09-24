Feature: User should be able to login with correct credentials and for wrong credentails user should get error message
  As a user of the Cyclos website I should be able to login and logout

  Background:
    Given I open Cyclos website

  Scenario Outline: User tries to login With valid credentials and Logout
    When Login with username and password
    Then After Login I verify that I successfully click on logout
    Then I verify that alert message with "<arg>"
    Then It should successfully logout
    Examples:
      | arg                      |
      | Please confirm to logout |
#      | Are you sure you wish to logout? |

  Scenario Outline: User tries to login With wrong credentials and Logout
    When Login with incorrect user credentials
    Then I should get success with "<arg>"
    Examples:
      | arg                              |
      | Invalid login. Please try again  |
      | Wrong Credentials. Please try again! |

  @smoke
  Scenario: User tries to login with wrong credentials
    Then login invalid credentials