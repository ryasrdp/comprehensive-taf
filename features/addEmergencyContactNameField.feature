@form
Feature: EHU-ATJS-20252. Add "Emergency Contact Name" Field to the Petition for Space Travel Form

  As a user,
  I want to provide the name of an emergency contact in the Petition for Space Travel form
  So that authorities can reach out to a designated person in case of an emergency during my space travel.

  Scenario: Check Emergency Contact Name field visibility in Contact Information section
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Contact Information" is present on "Petition to leave planet Earth" form
    Then Check field "Emergency Contact Name" is present on "Contact Information" section

  Scenario Outline: Fill Emergency Contact Name with valid values and verify output. With value <valid_name>
    Given Open web page url "https://ryasrdp.github.io/"
    And Select "<valid_name>" value in "Emergency Contact Name" field on "Contact Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Emergency Contact Name" on "2. Contact Information" section contain value "<valid_name>" on submitted Petition form

    Examples:
      | valid_name                                      |
      | Luke Skywalker                                  |
      | Leia Organa                                     |
      | Obi-Wan Kenobi                                  |
      | Yoda & Co.                                      |
      | Chewbacca-42                                    |
      | R2-D2 - Astro & Tech Ltd. (your droid's startup)|

@skip
  Scenario Outline: Validate Emergency Contact Name with invalid characters. With value <invalid_name>
    Given Open web page url "https://ryasrdp.github.io/"
    And Select "<invalid_name>" value in "Emergency Contact Name" field on "Contact Information" section
    Then Verify tooltip "Field must contain Latin letters only." is displayed for "Emergency Contact Name" field

    Examples:
      | invalid_name      |
      | Darth Vader ★☆   |
      | Палпатин          |
      | Сноук(((:         |
      | Кайло Рен!★☆      |
