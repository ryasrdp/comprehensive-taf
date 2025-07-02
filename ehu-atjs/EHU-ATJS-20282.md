## EHU-ATJS-20282

### Title: Add "College/University Name" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the name of my college or university in the Petition for Space Travel form  
**So that** authorities can verify my higher education background and confirm my academic history.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the name of the applicant's college or university. Adding a **College/University Name** field will allow users to provide this information, which is essential for verifying their educational qualifications and ensuring accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Education Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain valid characters."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **College/University Name** field, if provided.



## User Story Estimation

**User Story Number**: EHU-ATJS-20282  
**Title**: Add "College/University Name" Field to the Petition for Space Travel Form  

---

### Estimation Summary

**Final Estimate**: `2 Story Points`  
**Estimation Method**: Fibonacci Sequence  

---

## Estimation Breakdown & Justification 

### 1. Write BDD Scenario in Gherkin Syntax – `0.5 Story Points`
Create a readable **Gherkin** scenario that describes the expected behavior of the new field in the form.  
This includes both positive and negative test cases (e.g., entering invalid characters).

### 2. Automate the BDD Test – `1 Story Point`
Automate the Gherkin scenario using the existing test automation framework.  
This involves setting up selectors, step definitions, and result validation.  
Requires understanding of the DOM structure and use of the **Page Object Model**.

---

## Overall Justification 

The task involves **writing a BDD scenario and automating it**.  
No business logic or UI implementation is required — only testing of existing functionality.

The estimate is based on the **Fibonacci sequence**, considering the **moderate complexity** of the automation effort.

### Final Estimate: `2 Story Points`



# Test Case: Verify "College/University Name" Field Functionality

**User Story**: EHU-ATJS-20282  
**Title**: Add "College/University Name" Field to the Petition for Space Travel Form  
**Priority**: High  
**Type**: Functional / UI  
**Module**: Petition for Space Travel Form → Education Information Section

---

## Objective

Verify that the "College/University Name" field behaves according to the specified requirements:
- Field appears correctly
- Validates user input
- Displays data after submission

---

##  Preconditions

- User is on the “Petition for Space Travel” form page.
- "Education Information" section is visible.

---

##  Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Locate the "College/University Name" field | Field is present in the Education Information section |
| 2 | Check the placeholder | Displays: `Enter your college/university name` |
| 3 | Leave the field empty and click Submit | Form submits successfully without errors |
| 4 | Enter valid input like `MIT`, `King's College`, `UCLA` | Input is accepted without validation error |
| 5 | Enter invalid characters (e.g., `@!#%`) | Validation error: `"Field must contain valid characters"` |
| 6 | Enter only whitespace (e.g., `"     "`) | Validation error: `"Field must contain valid characters"` |
| 7 | Enter a long valid name (e.g., 100+ characters) | Field accepts long input without UI break |
| 8 | Submit the form with valid input | Submitted name is displayed in the output table |

---

##  Test Data

| Input | Valid | Notes |
|-------|-------|-------|
| `MIT` | ✔ | Valid input |
| `King's College` | ✔ | Apostrophe accepted |
| `UCLA (Extension)` | ✔ | Parentheses accepted |
| `@University` | ✖ | Invalid symbol `@` |
| `    ` | ✖ | Whitespace only |
| `Long University Name That Might Be Quite Excessively Verbose But Technically Valid` | ✔ | Valid edge case |

---

## Expected Validation

- **Allowed characters**: A-Z, a-z, 0-9, space, `-`, `'`, `.`, `&`, `(`, `)`
- **Validation message** (if invalid): `"Field must contain valid characters"`

---

## Postconditions

- If input is valid and provided, the value is shown in the output data table.
- If input is omitted, form submission still succeeds (field is optional).

---

## Notes

- Ensure that the error message appears right under the field.
- No client-side trimming or transformation unless specified.
- Styling should be consistent with other fields in the same section.

