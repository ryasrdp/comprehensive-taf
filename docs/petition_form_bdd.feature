Feature: Submit Petition for Space Travel

  Scenario: Successfully submit a valid petition
    Given I open the Petition for Space Travel form
    When I fill in all mandatory fields with valid data
    And I select options from dropdowns
    And I enter valid contact and address information
    And I click the Submit button
    Then I should see a confirmation message

  Scenario: Validation errors on missing mandatory fields
    Given I open the Petition for Space Travel form
    When I leave required fields empty
    And I click the Submit button
    Then I should see validation messages for each empty mandatory field

  Scenario: Validation error on invalid email format
    Given I open the Petition for Space Travel form
    When I enter an invalid email address
    And I click the Submit button
    Then I should see an error message about invalid email format

  Scenario: Mismatched email confirmation
    Given I open the Petition for Space Travel form
    When I enter different email addresses in Email and Confirm Email
    And I click the Submit button
    Then I should see a message saying emails must match
