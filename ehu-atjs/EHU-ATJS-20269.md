## EHU-ATJS-20269

### Title: Add "Employer Country" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my employer's country in the Petition for Space Travel form  
**So that** authorities can verify the country where my workplace is located and ensure accurate record-keeping.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the country where the employer is located. Adding an **Employer Country** field will allow users to provide this information, which is essential for verifying employment details and location.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain valid characters."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Employer Country** field, if provided.

1. User Story Estimation
Story Points: 3
Estimation Reasoning:

Complexity: Low-Medium (adding a single field to an existing form)
Effort: Small (straightforward implementation)
Risk: Low (standard form field addition)
Dependencies: None (independent change)

Fibonacci Estimation Factors:

Field addition: 1 point
Validation implementation: 1 point
UI integration and testing: 1 point
Total: 3 Story Points

2. Test Case/Checklist
Test Case ID: TC_EHU-ATJS-20269_01
Title: Verify "Employer Country" field functionality in Employment Information section
Preconditions:

User has access to the Petition for Space Travel form
Form is loaded successfully
Employment Information section is visible

Test Steps:
Positive Test Cases:

TC_01_Field_Visibility

Navigate to the Petition for Space Travel form
Scroll to Employment Information section
Expected Result: "Employer Country" field is visible and not mandatory


TC_02_Placeholder_Display

Locate the "Employer Country" field
Expected Result: Placeholder text "Enter your employer's country" is displayed when field is empty


TC_03_Valid_Data_Input

Enter valid country name (e.g., "United States")
Expected Result: Text is accepted and displayed correctly


TC_04_Special_Characters_Allowed

Enter country with allowed special characters (e.g., "United Kingdom", "St. Vincent & the Grenadines")
Expected Result: Input is accepted (letters, numbers, -, ', ., space, &, () are allowed)


TC_05_Form_Submission_With_Data

Fill mandatory fields and "Employer Country" field
Click Submit button
Expected Result: Form submits successfully, output table displays "Employer Country" value


TC_06_Form_Submission_Without_Data

Fill only mandatory fields, leave "Employer Country" empty
Click Submit button
Expected Result: Form submits successfully, "Employer Country" field is not displayed in output table



Negative Test Cases:

TC_07_Invalid_Characters

Enter invalid characters (e.g., "@#$%^*")
Expected Result: Validation error "Field must contain valid characters" is displayed


TC_08_Only_Numbers

Enter only numbers (e.g., "12345")
Expected Result: Input is accepted (numbers are allowed according to validation rules)



Edge Cases:

TC_09_Maximum_Length

Enter very long country name (test field length limits)
Expected Result: Field handles long input appropriately


TC_10_Empty_Spaces

Enter only spaces
Expected Result: Field validation handles empty spaces correctly



Test Data:

| Input Value         | Expected Result                                      |
|---------------------|-----------------------------------------------------|
| United States       | Value appears in the results table                  |
| United Kingdom      | Value appears in the results table                  |
| Russian Federation  | Value appears in the results table                  |
| St. Vincent & the Grenadines | Value appears in the results table         |
| @#$%                | Error "Field must contain valid characters."        |
| 测试                | Error "Field must contain valid characters."        |
| 🇺🇸                  | Error "Field must contain valid characters."        |
| A                   | Value appears in the results table                  |
| Very Long Country Name That Exceeds Normal Expectations | Field handles long input appropriately |
| 12345               | Value appears in the results table                  |
| (spaces only)       | Error "Field must contain valid characters."        |

---

3. BDD Scenario
gherkinFeature: Employer Country Field in Petition for Space Travel Form
  As a user
  I want to provide my employer's country in the Petition for Space Travel form
  So that authorities can verify the country where my workplace is located

  Background:
    Given I navigate to the Petition for Space Travel form
    And the form is loaded successfully
    And I can see the Employment Information section

  Scenario: Employer Country field is visible and optional
    When I look at the Employment Information section
    Then I should see the "Employer Country" field
    And the field should not be marked as mandatory
    And the field should display placeholder "Enter your employer's country"

  Scenario: Valid country name input
    When I enter "United States" in the "Employer Country" field
    Then the input should be accepted
    And no validation error should be displayed

  Scenario: Country name with special characters
    When I enter "St. Vincent & the Grenadines" in the "Employer Country" field
    Then the input should be accepted
    And no validation error should be displayed

  Scenario: Invalid characters validation
    When I enter "@#$%^" in the "Employer Country" field
    Then I should see validation error "Field must contain valid characters"

  Scenario: Form submission with employer country
    Given I fill all mandatory fields
    When I enter "Germany" in the "Employer Country" field
    And I click the Submit button
    Then the form should submit successfully
    And the output table should display "Employer Country: Germany"

  Scenario: Form submission without employer country
    Given I fill all mandatory fields
    And I leave the "Employer Country" field empty
    When I click the Submit button
    Then the form should submit successfully
    And the "Employer Country" field should not appear in the output table

  Scenario Outline: Multiple valid country formats
    When I enter "<country>" in the "Employer Country" field
    Then the input should be accepted
    And no validation error should be displayed
    
    Examples:
      | country                    |
      | France                     |
      | United Kingdom             |
      | Russian Federation         |
      | St. Vincent & the Grenadines |
      | Bosnia & Herzegovina       |
      | São Tomé & Príncipe        |