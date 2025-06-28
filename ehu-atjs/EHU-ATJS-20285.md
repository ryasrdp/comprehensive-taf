## EHU-ATJS-20285

### Title: Add "Major/Field of Study" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my major or field of study in the Petition for Space Travel form  
**So that** authorities can understand my academic specialization and evaluate my educational background.

### Description:

Currently, the Petition for Space Travel form does not include a field for specifying the applicant's major or field of study. Adding a **Major/Field of Study** field will allow users to provide this information, which is essential for verifying their academic focus and ensuring accurate record-keeping.

### Scenario:

1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Education Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: _"Field must contain valid characters."_
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Major/Field of Study** field, if provided.

---

## Story Points Estimation: 2

### Rationale:

- **Straightforward form field addition** following existing form structure
- **Basic validation logic** using character whitelist
- **Low implementation complexity** – static visibility, not conditional
- **UI/UX consistency** maintained with other Education section fields
- **Test coverage** easy to implement using standard test components

---

# Comprehensive Test Case Coverage

## Test Case ID: EHU-ATJS-20285_001

## Test Case Title: Validate "Major/Field of Study" Field functionality

### Preconditions:

1. User has access to the Petition for Space Travel Form
2. The form loads successfully

### Positive Test Cases:

#### TC-000: Field Visibility

- **Steps:** Navigate to form → Locate Education Information section
- **Expected:** Major/Field of Study field is visible and accessible

#### TC-001: Placeholder Visibility

- **Steps:** Navigate to form → Locate Education Information section
- **Expected:** A placeholder should be displayed

#### TC-002: Valid Input - Basic Text

- **Steps:** Enter "Astrophysics"
- **Expected:** Input accepted, no validation error

#### TC-003: Valid Input - With Spaces and Symbols

- **Steps:** Enter "Bio-Engineering & Robotics"
- **Expected:** Input accepted (letters, space, hyphen, ampersand allowed)

#### TC-004: Valid Input - With Parentheses and Period

- **Steps:** Enter "Computer Science (AI M.Sc.)"
- **Expected:** Input accepted

#### TC-005: Form Submission with Major/Field

- **Steps:** Fill required fields + Major/Field → Submit
- **Expected:** Submitted data appears in output table

### Negative Test Cases:

#### TC-006: Invalid Characters - Special/Unicode

- **Steps:** Enter "Astro@!学"
- **Expected:** Validation error: _"Field must contain valid characters."_

#### TC-007: Invalid Characters - Emojis

- **Steps:** Enter "Physics 🧪🚀"
- **Expected:** Validation error: _"Field must contain valid characters."_

---

### Expected Results:

1. Major/Field of Study field visible in Education Information section
2. Accepts valid input with letters, numbers, and common formatting characters
3. Field remains optional without blocking submission
4. Submitted data, if provided, is displayed in the output table
5. Invalid input triggers correct validation error

---

### Postconditions:

- Major/Field of Study field behaves per specifications
- No regression or impact on existing form features
- Educational data integrity is maintained in submission output

---

## BDD Scenarios Implemented:

### Scenario 1: Field Visibility Testing

- Ensures field appears in correct form section
- Covers TC-000

### Scenario 2: Field Visibility Testing

- Ensures placeholder appears in correct form input
- Covers TC-001

### Scenario 3: Positive Testing with Valid Inputs (3 test cases)

- Inputs include academic disciplines with allowed formatting
- Confirms successful submission and proper data display
- Covers TC-002, TC-005

### Scenario 4: Optional Field Verification

- Tests submission flow when field is left empty
- Covers TC-005

### Scenario 5: Edge Case Testing (3 test cases)

- Tests boundary values (single character, numbers, allowed symbols)
- Verifies edge cases are handled correctly
- Covers TC-003, TC-004

### Scenario 6: Negative Input Validation (2 test cases)

- Tests invalid inputs and validation error feedback
- Covers TC-006, TC-007

---

**Total: 11 automated test cases covering positive, negative, and edge scenarios.**

---

## Automation Limitations:

Currently, tooltip-based validation error capture is limited for overlapping field names in dynamic sections. Manual validation testing is recommended for:

- TC-006: Non-Latin characters with symbols
- TC-007: Emoji validation
