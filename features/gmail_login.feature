Feature: Login Functionality Feature

  Scenario: Login Functionality with Faiure
  
    Given it navigates to gmail.com
    When user logs in using Username as "nousaut@gmail.com" 
    And Password "nous@123"
    Then login should be failed

  Scenario: Login Functionality with Success

    Given it navigates to gmail.com
    When user logs in using Username as "nousautomation@gmail.com" 
    And Password "nous@123"
    Then login should be successfull
