## EHU-ATJS-20286

### Title: Add "Minor (if applicable)" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my minor field of study in the Petition for Space Travel form  
**So that** authorities can understand my additional academic focus and evaluate my educational background comprehensively.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's minor field of study. Adding a **Minor (if applicable)** field will allow users to provide this information, which is essential for verifying their academic focus beyond their major and ensuring accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Education Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain valid characters."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Minor (if applicable)** field, if provided.

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

## Test Case ID: EHU-ATJS-20286_001

## Test Case Title: Validate "Minor (if applicable)" Field functionality

### Preconditions:

1. User has access to the Petition for Space Travel Form
2. The form loads successfully

### Positive Test Cases:

#### TC-001: Field Visibility

- **Steps:** Navigate to form → Locate Education Information section
- **Expected:** Minor (if applicable) field is visible and accessible

#### TC-002: Valid Input - Basic Text

- **Steps:** Enter "Astrophysics"
- **Expected:** Input accepted, no validation error

#### TC-003: Valid Input - With Spaces and Symbols

- **Steps:** Enter "Bio-Engineering & Robotics"
- **Expected:** Input accepted (letters, space, hyphen, ampersand allowed)

#### TC-004: Valid Input - With Parentheses and Period

- **Steps:** Enter "Computer Science (AI M.Sc.)"
- **Expected:** Input accepted

#### TC-005: Form Submission with Minor (if applicable) field

- **Steps:** Fill required fields + Minor (if applicable) → Submit
- **Expected:** Submitted data appears in output table

#### TC-006: Form Submission without Minor (if applicable) field
- **Steps:** Fill only mandatory fields -> Submit
- **Expected:** Form submits successfully (field not mandatory)

### Negative Test Cases:

#### TC-007: Invalid Characters - Special/Unicode

- **Steps:** Enter "Astro@!学"
- **Expected:** Validation error: _"Field must contain valid characters."_

#### TC-008: Invalid Characters - Emojis

- **Steps:** Enter "Physics 🥼🧪"
- **Expected:** Validation error: _"Field must contain valid characters."_

---

### Expected Results:

1. Minor (if applicable) field visible in Education Information section
2. Accepts valid input with letters, numbers, and common formatting characters
3. Field remains optional without blocking submission
4. Submitted data, if provided, is displayed in the output table
5. Invalid input triggers correct validation error

---

### Postconditions:

- Minor (if applicable) field behaves per specifications
- No regression or impact on existing form features
- Educational data integrity is maintained in submission output

---

## BDD Scenarios Implemented:

### Scenario 1: Field Visibility Testing

- Ensures field appears in correct form section
- Covers TC-001

### Scenario 2: Positive Testing with Valid Inputs (3 test cases)

- Inputs include academic disciplines with allowed formatting
- Confirms successful submission and proper data display
- Covers TC-002, TC-005

### Scenario 3: Edge Case Testing (5 test cases)

- Tests boundary values (single character, numbers, allowed symbols)
- Verifies edge cases are handled correctly
- Covers TC-003, TC-004

### Scenario 4: Negative Input Validation (4 test cases)

- Tests invalid inputs and validation error feedback
- Covers TC-007, TC-008

---

**Total: 13 automated test cases covering positive, negative, and edge scenarios.**

---

## Automation Limitations:

None. All implemented steps reused standard functions from the Page Object Model and existing step definitions.
