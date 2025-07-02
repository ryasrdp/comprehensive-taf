## EHU-ATJS-20271

### Title: Add "Annual Income" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my annual income in the Petition for Space Travel form  
**So that** authorities can assess my financial stability and ability to fund interstellar travel.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's annual income. Adding an **Annual Income** field will allow users to provide this information, which is essential for evaluating their financial resources and eligibility for space travel.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **numeric field** that accepts values that are multiples of 1000 and at least 0.
6. Validation errors shall display the message: *"Please enter a valid income (e.g., 1000, 2000, etc.)."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Annual Income** field, if provided.

### Story Point Estimation: **5**

Estimation technique: **Fibonacci sequence**

- UI changes in an existing and complex form
- Custom validation for positive numbers and 1000-multiples
- Placeholder and optional behavior
- Data rendering logic in output table
- Consideration of edge cases (non-numeric input, negatives, empty field)

 **Final estimate: 5 Story Points**

---

### Manual Test Checklist

| Step | Action | Test Data | Expected Result |
|------|--------|-----------|------------------|
| 1 | Open the form | – | Form loads successfully |
| 2 | Go to the Employment Information section | – | Section is visible |
| 3 | Verify the presence of the "Annual Income" field | – | Field is visible with placeholder |
| 4 | Enter a valid income | 3000 | Input is accepted |
| 5 | Enter an invalid income | 2500 | Validation error is shown |
| 6 | Enter a negative value | -1000 | Validation error is shown |
| 7 | Enter non-numeric text | abc | Validation error is shown |
| 8 | Leave the field empty | – | No validation error, form can be submitted |
| 9 | Submit form with valid income | 3000 | Output table displays "Annual Income: 3000" |
| 10 | Submit form with empty income | – | Output table does not show the field |

---

###  BDD Scenario (Gherkin)

```gherkin
@form
Feature: EHU-ATJS-20271. Add "Annual Income" Field to the Petition for Space Travel Form

  As a user,
  I want to provide my annual income in the Petition for Space Travel form
  So that authorities can assess my financial stability and ability to fund interstellar travel

  Scenario: Annual Income field accepts valid input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "3000" value in "Annual Income" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form
    And Check Field "Annual Income" contain value "3000" on submitted Petition form

  Scenario: Annual Income field is empty (optional field)
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Annual Income" contain value "" on submitted Petition form

  @skip
  Scenario: Annual Income field shows error for invalid input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Select "2500" value in "Annual Income" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button