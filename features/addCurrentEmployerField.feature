@form
Feature: EHU-ATJS-20264. Add "Current Employer" Field to the Petition for Space Travel Form

  As a user,
  I want to provide the name of my current employer in the Petition for Space Travel form
  So that authorities can understand my professional affiliations and verify my employment details.

  Scenario: Check Current Employer field visibility
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    Then Check field "Current Employer" is present on "Employment Information" section

  Scenario Outline: Check Current Employer field with valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Current Employer" is present on "Employment Information" section
    And Select "<employer_value>" value in "Current Employer" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Current Employer" on "5. Employment Information" section contain value "<employer_value>" on submitted Petition form

    Examples:
      | employer_value      |
      | SpaceX              |
      | Company 42          |
      | Stark-Industries Ltd|

  Scenario: Check Current Employer field is not mandatory
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Current Employer" is present on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario Outline: Check Current Employer field with edge case values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Current Employer" is present on "Employment Information" section
    And Select "<edge_value>" value in "Current Employer" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Current Employer" on "5. Employment Information" section contain value "<edge_value>" on submitted Petition form

    Examples:
      | edge_value         |
      | A                  |
      | Galactic-42        |
      | Smith & Associates |

  Scenario: Check Current Employer field accepts empty value
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Current Employer" is present on "Employment Information" section
    And Select "" value in "Current Employer" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form 