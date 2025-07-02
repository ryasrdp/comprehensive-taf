@form
Feature: EHU-ATJS-20253. Add "Relationship 1" Field to the Petition for Space Travel Form.

  As a user,
  I want to specify the relationship with my professional reference in the Petition for Space Travel form
  So that authorities can understand the nature of my connection to the reference for proper validation and context.

  Scenario: Relationship 1 field accepts valid ASCII input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Type "Manager" in "Relationship 1" field on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Relationship 1" contain value "Manager" on submitted Petition form

  Scenario: Relationship 1 field shows required error when empty
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Leave "Relationship 1" field empty on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1" except "Relationship 1"
    And Click on "Submit" button
    Then Verify tooltip "This field is required" is displayed for "Relationship 1" field

  Scenario: Relationship 1 field accepts value with allowed special characters
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Type "VP & Co-Founder" in "Relationship 1" field on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Relationship 1" contain value "VP & Co-Founder" on submitted Petition form

  Scenario: Relationship 1 field accepts minimum length (1 character)
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Type "A" in "Relationship 1" field on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Relationship 1" contain value "A" on submitted Petition form

  @run
  Scenario Outline: Relationship 1 field shows error for invalid characters
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Type "<invalid_input>" in "Relationship 1" field on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Verify tooltip "Field must contain valid characters" is displayed for "Relationship 1" field

    Examples:
      | invalid_input              |
      | Boss@                      |
      | Colleague#1                |
      | Friend!                    |
      | <script>alert(1)</script>  |
      | 👨‍💼        |
      | Office@123 #HQ             |
      | 住所                       |
      | Руководитель               |