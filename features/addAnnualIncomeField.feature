@form
Feature: EHU-ATJS-20271. Add "Annual Income" Field to the Petition for Space Travel Form

  As a user,  
  I want to provide my annual income in the Petition for Space Travel form  
  So that authorities can assess my financial stability and ability to fund interstellar travel

  Scenario: Annual Income field accepts valid input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "3000" value in "Annual Income" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form
    And Check Field "Annual Income" contain value "3000" on submitted Petition form

  Scenario: Annual Income field is empty (optional field)
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Annual Income" contain value "" on submitted Petition form

  @skip
  Scenario: Annual Income field shows error for invalid input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "2500" value in "Annual Income" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Verify tooltip "Please enter a valid income (e.g., 1000, 2000, etc.)" is displayed for "Annual Income" field
