@form
Feature: EHU-ATJS-20266. Add "Employer Address" Field in "Employment Information" section to the Petition for Space Travel Form

  As a user,
  I want to provide my employer's address in the Petition for Space Travel form
  So that authorities can process my employment data with correct location reference

  Scenario: Check Employer Address field visibility and default state
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    Then Check field "Employer Address" is present on "Employment Information" section

  Scenario Outline: Check Employer Address field with valid ASCII input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Select "<valid_input>" value in "Employer Address" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Employer Address" on "6. Employment Information" section contain value "<valid_input>" on submitted Petition form

    Examples:
      | valid_input                     |
      | 123 NASA Street                |
      | HQ West - Unit 7               |
      | Building 5. Sector A           |

  Scenario Outline: Check Employer Address field with invalid characters
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Select "<invalid_input>" value in "Employer Address" field on "Employment Information" section
    Then Verify tooltip "Field must contain valid characters." is displayed for "Employer Address" field


    Examples:
      | invalid_input          |
      | 🏢 Galaxy Office       |
      | Office@123 #HQ    |
      | 住所            |

  Scenario: Check Employer Address field is not mandatory
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
