Feature: Login Functionality Feature

  Scenario: Login Functionality

    Given i navigates to gmail.com
    When user logs in using Username as "nousautomation@gmail.com" and Password "nous@123"
    Then login should be successfull