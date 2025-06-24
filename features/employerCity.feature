@form
Feature: EHU-ATJS-20267. Add "Employer City" Field to the Petition for Space Travel Form

  As a user,
  I want to provide my employer's city in the Petition for Space Travel form
  So that authorities can verify the location of my workplace and ensure accurate record-keeping.

  Scenario: Employer City field should appear and behave correctly
    Given I open the Petition for Space Travel form
    Then I should see the "Employer City" field in the Employment Information section
    And the field should not be marked as mandatory
    And the placeholder should be visible when the field is empty

  Scenario: Validation error on invalid characters
    Given I type invalid characters into the "Employer City" field
    When I click the Submit button
    Then I should see the validation error "Field must contain valid characters."

  Scenario: Field appears in the output table if filled
    Given I fill in the "Employer City" field with "New York"
    When I click the Submit button
    Then I should see "New York" in the output table
