@form
Feature: EHU-ATJS-20280. Add "Year of Graduation" Field in "Education Information" section to the Petition for Space Travel Form

  As a user,
  I want to provide the year I graduated from high school in the Petition for Space Travel form
  So that authorities can verify my educational timeline and confirm when I completed my secondary education.

  Scenario Outline: Check field "Year of Graduation" with valid values
    Given Open web page url "https://ryasrdp.github.io/"
    Then Check field "Year of Graduation" is present on "Education Information" section
    And Create "USER" "1" using storage
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