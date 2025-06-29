## EHU-ATJS-20264

### Title: Add "Current Employer" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the name of my current employer in the Petition for Space Travel form  
**So that** authorities can understand my professional affiliations and verify my employment details.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's current employer. Adding a **Current Employer** field will allow users to provide this information, which is essential for understanding their professional background and affiliations.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **single-line text field**.
6. Validation errors shall display the message: *"Field must contain valid characters."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Current Employer** field, if provided.

---

## Story Points Estimation: 2

### Rationale:
- **Simple field addition** following existing patterns in codebase
- **Basic validation** using standard character validation
- **No complex logic** - field is always visible, not conditional
- **Existing framework support** - all required step definitions already exist
- **Low complexity** - straightforward implementation and testing

---

# Comprehensive Test Case Coverage

## Test Case ID: EHU-ATJS-20264_001
## Test Case Title: Validate "Current Employer" Field functionality

### Preconditions:
1. User has access to the Petition for Space Travel Form
2. Form is loaded successfully

### Positive Test Cases:

#### TC-001: Field Visibility
- **Steps:** Navigate to form -> Locate Employment Information section
- **Expected:** Current Employer field is visible and accessible

#### TC-002: Valid Input - Basic Text
- **Steps:** Enter "SpaceX"
- **Expected:** Input accepted, no validation errors

#### TC-003: Valid Input - With Numbers
- **Steps:** Enter "Company 42"
- **Expected:** Input accepted

#### TC-004: Valid Input - With Allowed Symbols
- **Steps:** Enter "Stark-Industries & Co."
- **Expected:** Input accepted (-, ', ., space, &, () allowed)

#### TC-005: Form Submission with Current Employer
- **Steps:** Fill mandatory fields + Current Employer -> Submit
- **Expected:** Data appears in output table

#### TC-006: Form Submission without Current Employer
- **Steps:** Fill only mandatory fields -> Submit
- **Expected:** Form submits successfully (field not mandatory)

### Negative Test Cases:

#### TC-007: Invalid Characters - Non-ASCII
- **Steps:** Enter "Роскосмос@#$" (Cyrillic + special chars)
- **Expected:** Validation error: "Field must contain valid characters."

#### TC-008: Invalid Characters - Unicode
- **Steps:** Enter "Company★☆"
- **Expected:** Validation error: "Field must contain valid characters."

### Expected Results:
1. Current Employer field visible in Employment Information section
2. Proper validation for allowed characters
3. Non-mandatory field behavior works correctly
4. Submitted data appears in output table when provided
5. Form submits successfully when field is empty

### Postconditions:
- Current Employer field functions according to specifications
- No impact on existing form functionality
- Data integrity maintained in submission results

---

## Automation Limitations:

Validation testing for invalid characters (TC-007, TC-008) could be challenging due to current step definition constraints. The framework may use a generic field locator that cannot always differentiate between different fields across various form sections, which could result in element ambiguity errors.

**Alternative Approach:**
These validation scenarios are documented for manual testing or future automation when section-specific step definitions become available. The current automated test suite focuses on functional testing using available step definitions that support section-specific field interactions.

