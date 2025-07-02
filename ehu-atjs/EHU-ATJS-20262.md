## EHU-ATJS-20262

### Title: Add "Previous ZIP/Postal Code" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my previous ZIP/Postal Code in the Petition for Space Travel form  
**So that** authorities can verify my residential history if I have lived at my current address for less than two years.

### Description:
Currently, the Petition for Space Travel form captures the current ZIP/Postal Code but does not include fields for previous ZIP/Postal Code unless explicitly required. Adding a **Previous ZIP/Postal Code** field will allow users to provide their prior postal information when applicable, ensuring accurate record-keeping and verification.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Address Information** section, **conditionally visible** when the user selects the checkbox indicating they have lived at their current address for less than two years.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Please enter a valid ZIP/Postal Code."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Previous ZIP/Postal Code** field, if provided.

---

## Story Points Estimation: 3

### Rationale:
- Conditional visibility based on another field
- Custom validation rules (character and length checks)
- Placeholder and result table output need to be verified
- Slightly more complex than a static field
- Existing reusable methods support this logic, no additional infrastructure required

---

# Comprehensive Test Case Coverage

## Test Case ID: EHU-ATJS-20262_001
## Test Case Title: Validate "Previous ZIP/Postal Code" Field functionality

### Preconditions:
1. User has access to the Petition for Space Travel Form
2. Form is loaded successfully

### Positive Test Cases:

#### TC-001: Field Conditional Visibility
- **Steps:** Navigate to form -> Do not check "lived less than 2 years"
- **Expected:** Previous ZIP/Postal Code field is not visible

#### TC-002: Checkbox Enables Field
- **Steps:** Check "I have lived here less than 2 years"
- **Expected:** Field appears in Address Information section

#### TC-003: Valid Input - Simple ZIP
- **Steps:** Enter "12345"
- **Expected:** Input accepted, no validation error

#### TC-004: Valid Input - Alphanumeric with dash
- **Steps:** Enter "9876-AB"
- **Expected:** Input accepted

#### TC-005: Form Submission with Previous ZIP
- **Steps:** Fill mandatory fields + Previous ZIP -> Submit
- **Expected:** Field shown in output table

#### TC-006: Form Submission without Previous ZIP
- **Steps:** Do not check "lived less than 2 years" -> Submit
- **Expected:** Form submits successfully, no error

### Negative Test Cases:

#### TC-007: Invalid Characters
- **Steps:** Enter "!@#$$%"
- **Expected:** Validation error: "Please enter a valid ZIP/Postal Code."

#### TC-008: Too Short or Too Long ZIP
- **Steps:** Enter "12" or "1234567890123"
- **Expected:** Validation error: "Please enter a valid ZIP/Postal Code."

### Expected Results:
1. Field is conditionally visible based on checkbox state
2. Input is validated according to ZIP/Postal Code rules
3. Submitted values appear in the output table correctly
4. Form submits successfully if the field is empty or not displayed

### Postconditions:
- The Previous ZIP/Postal Code field behaves as defined
- No regression in other Address Information fields

---

## BDD Scenarios Implemented:

### Scenario 1: Field Visibility Testing
- Verifies the field is hidden initially and visible only after checkbox is selected
- Covers TC-001, TC-002

### Scenario 2: Positive Testing with Valid Values
- Tests valid values: "12345", "9876-AB"
- Ensures field data appears in output
- Covers TC-003, TC-004, TC-005

### Scenario 3: Non-Mandatory Field Testing
- Confirms the form submits with or without the field
- Covers TC-006

### Scenario 4: Edge Case and Validation Testing
- Inputs with symbols or invalid length
- Confirms proper error message is shown
- Covers TC-007, TC-008

**Total: 8 test cases covering conditional rendering, validation, submission, and output.**

---

## Automation Limitations:

Automated testing of dynamic visibility and validation relies on framework's support for conditional fields. Current step definitions using section/field anchors can support most cases. Some extreme boundary or visual validations may require manual checks if exact UI elements are not exposed via stable selectors.

**Alternative Approach:**
Test scenarios involving invalid values or rare edge formatting can be deferred to manual QA in case of flaky locators or unstable rendering conditions. The majority of business logic and behavior is still covered through automated tests.
