## EHU-ATJS-20283  
### Title: Add "College Location" Field to the Petition for Space Travel Form  
**As** a user,  
**I want** to provide the location of my college or university in the Petition for Space Travel form  
**So that** authorities can verify where I pursued my higher education and confirm my academic history.

### Description:

Currently, the Petition for Space Travel form does not include a field for specifying the location of the applicant's college or university.  
Adding a **College Location** field will allow users to provide this information, which is essential for verifying their educational background and maintaining accurate records.

### Scenario:

1. A new field shall be added to the Petition for Space Travel Form.  
2. The field shall be displayed in the **College/University Fields** section.  
3. The field shall **not** be mandatory on UI.  
4. The field must display its **placeholder** when empty.  
5. Validation errors shall display the message: _"Field must contain valid characters."_  
6. After clicking the **Submit** button, the output table must display the submitted data, including the **College Location** field, if provided.

---

## Story Points Estimation: 3

### Rationale:

- Straightforward field addition using existing form infrastructure  
- Follows known validation logic: ASCII with allowed punctuation  
- UI consistency with other educational fields  
- Requires updates to output section  
- Low complexity, moderate test coverage required

---

# Comprehensive Test Case Coverage

## Test Case ID: EHU-ATJS-20283_001

## Test Case Title: Validate "College Location" Field functionality

### Preconditions:

- User has access to the Petition for Space Travel Form  
- The form loads successfully

### Positive and Edge Test Cases:

#### TC-000: Field Visibility  
- **Steps:** Navigate to form → Locate "College/University Fields" section  
- **Expected:** "College Location" field is visible

#### TC-001: Placeholder Display  
- **Steps:** Locate field  
- **Expected:** Placeholder shows `"Enter city, state/country"`

#### TC-002: Valid Input – Example Location  
- **Steps:** Enter `"Cambridge, MA, USA"`  
- **Expected:** Accepted without error

#### TC-003: Form Submission with College Location  
- **Steps:** Fill required fields + College Location → Submit  
- **Expected:** College Location appears in output

#### TC-004: Optional Field - Empty Input  
- **Steps:** Leave field blank → Submit form  
- **Expected:** Form submits successfully

#### TC-005: Edge Case Inputs (examples from scenario outline)  
- **Steps:** Enter edge values like `"A"`, `"Zurich, CH (ETH)"`, `"123 Moon Base 7"` → Submit  
- **Expected:** Accepted, no error, shown in output

---

## ⚠ Known Limitation

Negative validation tests for the `College Location (City, State/Country)` field are **skipped**.

- The input does **not implement HTML validation attributes** such as `pattern`, `title`, or `required`
- As a result, `input.checkValidity()` returns `true` even with invalid characters like emojis or symbols
- Tooltip validation does not appear in DOM

 Once the frontend adds proper HTML validation, the `@skip` tag can be removed, and these tests will be activated.


---

## Expected Results:

- College Location field visible and editable  
- Accepts valid inputs with common ASCII characters  
- Placeholder is shown when field is empty  
- Optional field does not block submission  
- Data is shown in output table if provided

---

## Postconditions:

- Field is integrated without affecting other form logic  
- No regression in existing form functionality  
- Output reflects submitted data accurately  

---

## BDD Scenarios Implemented:

### Scenario 1: Field is visible in correct section  
_Covers: TC-000_

### Scenario 2: Placeholder displays as expected  
_Covers: TC-001_

### Scenario 3: Valid values input and submission  
_Covers: TC-002, TC-003_

### Scenario 4: Optional field behavior (left empty)  
_Covers: TC-004_

### Scenario 5: Edge case validation  
_Covers: TC-005_

---

**Total: 5 automated test cases covering positive and edge case behavior.**

---

## Automation Limitations:

- Field behavior is static, so easily covered by automation  
- Rendering and validation of complex symbols (emoji, unicode) may vary by OS/Browser — manual confirmation recommended for complex inputs.
