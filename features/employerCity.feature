@form
Feature: Add "Employer City" Field to the Petition for Space Travel Form

  As a user,
  I want to provide my employer's city in the Petition for Space Travel form
  So that authorities can verify the location of my workplace and ensure accurate record-keeping.

  Scenario: Employer City field allows valid input and appears in submitted data
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "New York" value in "Employer City" field
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Employer City" contain value "New York" on submitted Petition form

  Scenario: Employer City field is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Employer City" contain value "" on submitted Petition form

  Scenario: Employer City field shows validation tooltip on invalid input
    Given Open web page url "https://ryasrdp.github.io/"
    And Select "РУССКИЙ@#!" value in "Employer City" field
    And Click on "Submit" button
    Then Verify tooltip "Field must contain valid characters." is displayed for "Employer City" field
