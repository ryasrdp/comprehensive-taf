@SomeTagOrScenarioName

Feature: Employer State/Province Field in Petition for Space Travel Form

  As a user,
  I want to provide my employer's state or province
  So that authorities can verify my workplace location and keep accurate records.

  Background:
    Given I am on the Petition for Space Travel Form page

  Scenario: Employer State/Province field is visible in Employment Information section
    Then I should see the "Employer State/Province" field in the Employment Information section

  Scenario: Employer State/Province field shows placeholder when empty
    When I focus on the "Employer State/Province" field
    Then I should see the placeholder text "Enter state or province"

  Scenario Outline: Valid Employer State/Province input
    When I enter "<input>" into the "Employer State/Province" field
    And I submit the form
    Then I should see the submitted "<input>" displayed in the output table
    And I should not see any validation error

    Examples:
      | input           |
      | California      |
      | St. John's      |
      | New York        |
      | Quebec          |

  Scenario: Employer State/Province field is optional
    When I leave the "Employer State/Province" field empty
    And I submit the form
    Then the form should submit successfully
    And the output table should display the submitted data without Employer State/Province

  Scenario Outline: Invalid Employer State/Province input triggers validation error
    When I enter "<input>" into the "Employer State/Province" field
    And I submit the form
    Then I should see the validation error "Field must contain valid characters."

    Examples:
      | input          |
      | Florida!!!     |
      | Texas 🚀       |
      | @California    |
