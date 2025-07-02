@form
Feature: EHU-ATJS-20269. Add "Employer Country" Field to the Petition for Space Travel Form

  As a user,
  I want to provide my employer's country in the Petition for Space Travel form
  So that authorities can verify the country where my workplace is located and ensure accurate record-keeping.

  Scenario: Employer Country field allows valid input and appears in submitted data
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "Canada" value in "Employer Country" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Employer Country" contain value "Canada" on submitted Petition form

  Scenario: Employer Country field is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Employer Country" contain value "" on submitted Petition form

  Scenario Outline: Employer Country field accepts valid edge case values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "<country_value>" value in "Employer Country" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Employer Country" contain value "<country_value>" on submitted Petition form

    Examples:
      | country_value                                   |
      | United States                                   |
      | A                                               |
      | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
      | -'&                                            |

  Scenario Outline: Employer Country field shows validation error for invalid input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "<invalid_value>" value in "Employer Country" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Verify tooltip "Field must contain valid characters." is displayed for "Employer Country" field

    Examples:
      | invalid_value |
      | @@@          |
      | Россия       |
      |              | # spaces only (if possible to simulate)