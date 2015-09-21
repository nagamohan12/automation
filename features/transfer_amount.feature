@smoke
Feature: An account holder should be able to transfer amount to another account
  Scenario: Transfer amount from one account to another
    Given An account holder is on payment form
    When Transfers amount to other account holder
    Then Recepeint should recieves the same amount which has been tranfered
