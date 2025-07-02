@form
Feature: EHU-ATJS-20261: Add "Previous City" Field to the Petition for Space Travel Form

  As a user,
  I want to provide the name of my previous city in the Petition for Space Travel form
  So that authorities can verify my residential history if I have lived at my current address for less than two years.

  @skip
  Scenario: Verify field becomes visible when checkbox is checked
    Given Open web page url "https://ryasrdp.github.io/"
    Then Check field "Previous City" is absent on "Address Information" section
    When Uncheck checkbox "I have lived at my current address for 2+ years" on "Address Information" section
    Then Check field "Previous City" is present on "Address Information" section

  Scenario: Submit form with "Previous City" filled
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    When Select "Tokyo" value in "Previous City" field on "Address Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Previous City" contain value "Tokyo" on submitted Petition form

  @skip
  Scenario: Check validation for invalid characters in "Previous City" field
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Fill Mandatory Petition Form for "USER" "1"
    When Select "City123!@#" value in "Previous City" field on "Address Information" section
    And Click on "Submit" button
    Then Verify tooltip "Field must contain valid characters." is displayed for "Previous City" field on "Address Information" section
