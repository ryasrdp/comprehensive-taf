@form
Feature: EHU-ATJS-20257. Add "Solar System" Field in "Address Information" section to the Petition for Space Travel Form

  As a user,
  I want to provide the name of my solar system in the Petition for Space Travel form
  So that authorities can identify my origin and better understand my interstellar background.

  Scenario: Check Solar System field visibility
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Address Information" is present on "Petition to leave planet Earth" form
    Then Check field "Solar system" is present on "Address Information" section

  Scenario Outline: Check Solar System field with valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Solar system" is present on "Address Information" section
    And Select "<solar_system_value>" value in "Solar system" field on "Address Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Solar System" on "4. Address Information" section contain value "<solar_system_value>" on submitted Petition form

    Examples:
      | solar_system_value |
      | Milky Way         |
      | Andromeda         |
      | Alpha Centauri    |

  Scenario: Check Solar System field is not mandatory
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Solar system" is present on "Address Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario Outline: Check Solar System field with edge case values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Solar system" is present on "Address Information" section
    And Select "<edge_value>" value in "Solar system" field on "Address Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Solar System" on "4. Address Information" section contain value "<edge_value>" on submitted Petition form

    Examples:
      | edge_value |
      | A          |
      | Galaxy-42  |
      | Alpha & Co |

  Scenario: Check Solar System field accepts empty value
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Solar system" is present on "Address Information" section
    And Select "" value in "Solar system" field on "Address Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
