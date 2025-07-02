@form
Feature: EHU-ATJS-20262. Add "Previous ZIP/Postal Code" Field to the Petition for Space Travel Form

  As a user,
  I want to provide my previous ZIP/Postal Code in the Petition for Space Travel form
  So that authorities can verify my residential history if I have lived at my current address for less than two years.

  Scenario: Check that "Previous ZIP/Postal Code" is not visible by default
    Given Open web page url "https://ryasrdp.github.io/"
    Then Check field "Previous ZIP/Postal Code" is not present on "Address Information" section

  Scenario: Check visibility of "Previous ZIP/Postal Code" after selecting checkbox
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check checkbox "I have lived here less than 2 years" is present
    And Click on checkbox "I have lived here less than 2 years"
    Then Check field "Previous ZIP/Postal Code" is present on "Address Information" section

  Scenario Outline: Fill and submit form with valid Previous ZIP/Postal Code values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Click on checkbox "I have lived here less than 2 years"
    Then Check field "Previous ZIP/Postal Code" is present on "Address Information" section
    And Select "<zip_value>" value in "Previous ZIP/Postal Code" field on "Address Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Previous ZIP/Postal Code" on "4. Address Information" section contain value "<zip_value>" on submitted Petition form

    Examples:
      | zip_value   |
      | 12345       |
      | 9876-AB     |
      | A1B-2C3     |

  Scenario: Submit form without Previous ZIP/Postal Code (field not visible)
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    Then Check field "Previous ZIP/Postal Code" is not present on submitted Petition form

  Scenario: Submit form with empty Previous ZIP/Postal Code (optional field)
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Click on checkbox "I have lived here less than 2 years"
    Then Check field "Previous ZIP/Postal Code" is present on "Address Information" section
    And Select "" value in "Previous ZIP/Postal Code" field on "Address Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  @skip
  Scenario Outline: Check validation for invalid Previous ZIP/Postal Code values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Click on checkbox "I have lived here less than 2 years"
    Then Check field "Previous ZIP/Postal Code" is present on "Address Information" section
    And Select "<invalid_value>" value in "Previous ZIP/Postal Code" field on "Address Information" section
    Then Verify tooltip "Please enter a valid ZIP/Postal Code." is displayed for "Previous ZIP/Postal Code" field

    Examples:
      | invalid_value    |
      | !@#$%            |
      | 12               |
      | 123456789012345  |
