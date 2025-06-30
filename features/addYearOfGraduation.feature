@form
Feature: EHU-ATJS-20280. Add "Year of Graduation" Field in "Education Information" section to the Petition for Space Travel Form

  As a user,
  I want to provide the year I graduated from high school in the Petition for Space Travel form
  So that authorities can verify my educational timeline and confirm when I completed my secondary education.

  Scenario: Check field "Year of Graduation" is visible
    Given Open web page url "https://ryasrdp.github.io/"
    Then Check field "Year of Graduation" is present on "Education Information" section

  Scenario Outline: Check field "Year of Graduation" with valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Year of Graduation" is present on "Education Information" section
    And Select "<valid_year>" value in "Year of Graduation" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Year of Graduation" on "6. Education Information" section contain value "<valid_year>" on submitted Petition form

    Examples:
      | valid_year |
      | 2000       |
      | 1995       |
      | 2025       |

  Scenario Outline: Check field "Year of Graduation" with invalid inputs
    Given Open web page url "https://ryasrdp.github.io/"
    And Select "<invalid_value>" value in "Year of Graduation" field on "Education Information" section
    Then Click on "Submit" button
    Then Check section "Education Information" is present on "Petition to leave planet Earth" form

    Examples:
      | invalid_value |
      | 1899          |
      | 3000          |

  Scenario: Check field "Year of Graduation" is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Year of Graduation" is present on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
