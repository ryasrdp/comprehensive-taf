## EHU-ATJS-20258

### Title: Add "Planet" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the name of my planet in the Petition for Space Travel form  
**So that** authorities can identify my specific place of origin within my solar system for better context and record-keeping.

### Description:

Currently, the Petition for Space Travel form does not include a field for specifying the applicant's planet. Adding a **Planet** field will allow users to provide this information, which is essential for understanding the applicant's origin and interstellar background.

### Scenario:

1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Travel Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: _"Field must contain Latin letters only."_
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Planet** field, if provided.

### Story Points Estimation: 2

**Rationale:**

- Small field extension using existing structure
- ASCII-only validation reused
- No backend impact
- POM utilities available
- Low complexity

---

### Comprehensive Test Case Coverage

**ID:** EHU-ATJS-20258_001
**Title:** Validate Planet Field (Travel & Address Sections)

**Preconditions:**

1. Petition form accessible
2. Form loads fully

### Positive Test Cases

| ID     | Title                 | Steps                               | Expected                       |
| ------ | --------------------- | ----------------------------------- | ------------------------------ |
| TC-001 | Field Visibility      | Open form → Locate Travel & Address | Field visible with placeholder |
| TC-002 | Valid Input           | Enter "Mars"                        | Accepted                       |
| TC-003 | Allowed Symbols       | Enter "Alpha-Centauri & Co."        | Accepted                       |
| TC-004 | Numbers               | Enter "Planet 42"                   | Accepted                       |
| TC-005 | Submit with Planet    | Fill required + Planet → Submit     | Data visible in output         |
| TC-006 | Submit without Planet | Fill required only → Submit         | Success                        |

### Negative Test Cases

| ID     | Title     | Steps             | Expected                                      |
| ------ | --------- | ----------------- | --------------------------------------------- |
| TC-007 | Non-ASCII | Enter "火星"      | Error: Field must contain Latin letters only. |
| TC-008 | Unicode   | Enter "Planet 🌟" | Error: Field must contain Latin letters only. |

**Expected Results:**

- Field visible with placeholder
- Non-mandatory field accepted empty
- Valid inputs accepted
- Invalid inputs rejected with error
- Data shown in output if given

**Postconditions:**

- Planet field works as required
- No impact on other data

---

### BDD Scenarios Implemented

| Scenario Title                    | Description                                                                                  | Test Cases Covered            |
|--------------------------|----------------------------------------------------------------------------------------------|------------------------------|
| Field Visibility Testing | Verify the **Planet** field is present with placeholder in both Travel Information sections. | TC-001                       |
| Positive Input Testing    | Submit valid planet names (normal cases) and verify acceptance and display on output.        | TC-002, TC-005               |
| Edge Input Testing       | Submit special planet names with numbers, symbols, single characters, verify acceptance/display.  | TC-003, TC-004               |
| Empty Value Testing      | Submit form with the **Planet** field empty and verify successful submission.                 | TC-006                       |

## Automation Limitations

Validation testing for invalid characters **(TC-007, TC-008)** could not be automated due to current step definition constraints. The test framework’s tooltip validation step uses generic locators which cannot uniquely identify validation errors for the **Planet** field in different dynamic sections (Address Information, Planned Travel Information, Previous Travel Information). This causes ambiguity errors when multiple fields with the same name exist, preventing automated verification of error messages for non-Latin characters or emojis.

Due to these limitations, negative validation tests for invalid characters should be verified manually to ensure the correct error message ("Field must contain Latin letters only.") is displayed and the input is rejected.
