@form
Feature: EHU-ATJS-20265. Add "Work Phone" Field in "Employment Information" section to the Petition for Space Travel Form

  As a user,
  I want to provide my work phone number in the Petition for Space Travel form
  So that authorities can contact me through my professional phone line if necessary.

  Scenario Outline: Check Work Phone field accepts valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    # And Fill "<work_phone>" in "Work Phone" field on "Employment Information" section
    And Select "<work_phone>" value in "Work Phone" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Work Phone" contain value "<work_phone>" on submitted Petition form

    Examples:
      | work_phone     |
      | +12025550123   |
    #  | +447911123456  |
    #  | +81312345678   |

  Scenario: Check Work Phone field is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Work Phone" contain value "" on submitted Petition form

  @skip
  Scenario Outline: Check Work Phone field shows validation error for invalid <invalid_phone> values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "<invalid_phone>" value in "Work Phone" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Verify tooltip "Please enter a valid phone number in E.164 format." is displayed for "Work Phone" field

    Examples:
      | invalid_phone  |
      | abc123         |
      | 123-456-7890   |
      | ++11234567890  |
