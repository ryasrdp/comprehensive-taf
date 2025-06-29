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
