Feature: Add "Income Type" field to Petition for Space Travel Form

  As a user,
  I want to select the type of income I receive
  So that authorities can assess my financial situation accurately.

  Scenario: Successfully submit form with selected Income Type
    Given I am on the Petition for Space Travel form
    When I select "Salary" from the Income Type dropdown
    And I submit the form
    Then the output table should display "Salary" as Income Type

  Scenario: Successfully submit form without selecting Income Type
    Given I am on the Petition for Space Travel form
    When I do not select any option for Income Type
    And I submit the form
    Then the form should be submitted without validation errors
