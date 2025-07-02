@form
Feature: Petition for Space Travel Form – Relationship 1 (Professional References)

  As a user,  
  I want to specify the relationship with my professional reference in the Petition for Space Travel form  
  So that authorities can understand the nature of my connection to the reference for proper validation and context.

  @run
  Scenario: Relationship 1 field is present on the form
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    Then Check field "Relationship 1" is present on "Professional References" section

  @skip
  Scenario: Relationship 1 field accepts valid ASCII input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Select "Manager" value in "Relationship 1" field on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    Then Check Field "Relationship 1" contain value "Manager" on submitted Petition form

  @skip
  Scenario Outline: Check field "Relationship 1" with other valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Select "<relationship_value>" value in "Relationship 1" field on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Relationship 1" contain value "<relationship_value>" on submitted Petition form

    Examples:
      | relationship_value |
      | Colleague          |
      | Supervisor         |

  @skip
  Scenario: Relationship 1 field shows required error when empty
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Leave "Relationship 1" field empty on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1" except "Relationship 1"
    And Click on "Submit" button
    Then Verify tooltip "This field is required" is displayed for "Relationship 1" field

  @skip
  Scenario Outline: Relationship 1 field shows error for invalid characters
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Professional References" is present on "Petition to leave planet Earth" form
    And Select "<invalid_input>" value in "Relationship 1" field on "Professional References" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Verify tooltip "Field must contain valid characters" is displayed for "Relationship 1" field

    Examples:
      | invalid_input              |
      | Boss@                      |
      | Colleague#1                |
      | <script>alert(1)</script>  |
      | 👨‍💼                         |
      | Office@123 #HQ             |
      | 住所                        |
      | Руководитель               |
