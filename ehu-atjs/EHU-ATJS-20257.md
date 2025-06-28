## EHU-ATJS-20257

### Title: Add "Solar System" Field in "Address Information" section to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the name of my solar system in the Petition for Space Travel form  
**So that** authorities can identify my origin and better understand my interstellar background.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's solar system. Adding a **Solar System** field will allow users to provide this critical information, which is important for context and record-keeping during the application process.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Address Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain Latin letters only."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Solar System** field, if provided.

---

## Story Points Estimation: 2

### Rationale:
- **Simple field addition** following existing patterns in codebase
- **Basic validation** using standard ASCII character validation
- **No complex logic** - field is always visible, not conditional
- **Existing framework support** - all required step definitions already exist
- **Low complexity** - straightforward implementation and testing

---

# Comprehensive Test Case Coverage

## Test Case ID: EHU-ATJS-20257_001
## Test Case Title: Validate "Solar System" Field functionality

### Preconditions:
1. User has access to the Petition for Space Travel Form
2. Form is loaded successfully

### Positive Test Cases:

#### TC-001: Field Visibility
- **Steps:** Navigate to form -> Locate Address Information section
- **Expected:** Solar System field is visible and accessible

#### TC-002: Valid Input - Basic Text
- **Steps:** Enter "Milky Way"
- **Expected:** Input accepted, no validation errors

#### TC-003: Valid Input - With Numbers
- **Steps:** Enter "Galaxy 42"
- **Expected:** Input accepted

#### TC-004: Valid Input - With Allowed Symbols
- **Steps:** Enter "Alpha-Centauri & Co."
- **Expected:** Input accepted (-, ', ., space, &, () allowed)

#### TC-005: Form Submission with Solar System
- **Steps:** Fill mandatory fields + Solar System -> Submit
- **Expected:** Data appears in output table

#### TC-006: Form Submission without Solar System
- **Steps:** Fill only mandatory fields -> Submit
- **Expected:** Form submits successfully (field not mandatory)

### Negative Test Cases:

#### TC-007: Invalid Characters - Non-ASCII
- **Steps:** Enter "Млечный@#$" (Cyrillic + special chars)
- **Expected:** Validation error: "Field must contain Latin letters only."

#### TC-008: Invalid Characters - Unicode
- **Steps:** Enter "Galaxy★☆"
- **Expected:** Validation error: "Field must contain Latin letters only."

### Expected Results:
1. Solar System field visible in Address Information section
2. Proper validation for ASCII-only characters
3. Non-mandatory field behavior works correctly
4. Submitted data appears in output table when provided
5. Form submits successfully when field is empty

### Postconditions:
- Solar System field functions according to specifications
- No impact on existing form functionality
- Data integrity maintained in submission results

---

## BDD Scenarios Implemented:

### Scenario 1: Field Visibility Testing
- Verifies Solar System field is present in Address Information section
- Covers TC-001

### Scenario 2: Positive Testing with Valid Values (3 test cases)
- Tests valid input values (Milky Way, Andromeda, Alpha Centauri)
- Confirms data appears correctly in output table
- Covers TC-002, TC-005

### Scenario 3: Non-Mandatory Field Testing
- Verifies form submits successfully without Solar System field
- Confirms field is optional as per requirements
- Covers TC-006

### Scenario 4: Edge Case Testing (3 test cases)
- Tests boundary values (single character, numbers, allowed symbols)
- Verifies edge cases are handled correctly
- Covers TC-003, TC-004

### Scenario 5: Empty Value Testing
- Tests that empty value is accepted (non-mandatory field)
- Additional coverage for TC-006

**Total: 9 automated test cases covering positive, edge case, and boundary testing scenarios.**

---

## Automation Limitations:

Validation testing for invalid characters (TC-007, TC-008) could not be automated due to current step definition constraints. The framework's tooltip verification step definition uses a generic field locator that cannot differentiate between multiple "Solar system" fields across different form sections (Address Information, Planned Travel Information, Previous Travel Information), resulting in element ambiguity errors.

**Alternative Approach:**
These validation scenarios are documented for manual testing or future automation when section-specific step definitions become available. The current automated test suite focuses on functional testing using available step definitions that support section-specific field interactions.
