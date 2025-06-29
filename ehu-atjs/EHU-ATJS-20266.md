## EHU-ATJS-20266

### Title: Add "Employer Address" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my employer's address in the Petition for Space Travel form  
**So that** authorities can verify my workplace location and ensure accurate record-keeping.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the employer's address. Adding an **Employer Address** field will allow users to provide this information, which is essential for verifying employment details.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **single-line text field** that accepts ASCII symbols only (allowed: letters, numbers, `-`, `'`, `.`, space, `&`, `()`).
6. Validation errors shall display the message: *"Field must contain valid characters."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Employer Address** field, if provided.

---

## 2 Story points

### Estimation Reasoning:
- UI-only field addition — no backend involved.
- Requires input validation for ASCII-only characters.
- Involves 1 new field in form + output table rendering.
- Complexity is moderate: needs visual testing + validation testing.


---

### Test Case ID: EHU-ATJS-20266_1  
### Title: Validate "Employer Address" Field (Visibility, Input, Validation, and Output)

**Preconditions:**
- User is on the Petition for Space Travel form
- Form has Employment Information section
- Employment Information section is present in the form

### Positive Test Cases:

#### TC-001: Field Visibility
- **Steps:** Navigate to form → Locate Employment Information section
- **Expected:** "Employer Address" field is visible and accessible

#### TC-002: Default State and Placeholder
- **Steps:** Check the field before typing
- **Expected:** Field is empty and displays placeholder `"Enter your employer's address"`

#### TC-003: Valid Input – Basic Address
- **Steps:** Enter `123 Main St`
- **Expected:** Input accepted, no validation error shown

#### TC-004: Valid Input – Address with Symbols
- **Steps:** Enter `NASA HQ - Unit 5 (Admin)`
- **Expected:** Input accepted (allowed characters: letters, numbers, `-`, `'`, `.`, space, `&`, `()`)

#### TC-005: Long Valid Input
- **Steps:** Enter a long string of 255 valid characters (ASCII only)
- **Expected:** Input accepted, field doesn't break

#### TC-006: Form Submission With Employer Address
- **Steps:** Fill in all required fields + employer address → Submit
- **Expected:** Form submits successfully, and value appears in the output table and view section

#### TC-007: Form Submission Without Employer Address
- **Steps:** Fill only mandatory fields, leave employer address empty → Submit
- **Expected:** Form submits successfully (field is not required)

---

### Negative Test Cases:

#### TC-008: Input with Emoji
- **Steps:** Enter `🏢 Office`
- **Expected:** Validation error shown: `"Field must contain valid characters."`

#### TC-009: Input with Disallowed Symbols
- **Steps:** Enter `Office@123 #HQ`
- **Expected:** Validation error shown: `"Field must contain valid characters."`

#### TC-010: Input with Unicode/Non-ASCII
- **Steps:** Enter `住所`
- **Expected:** Validation error shown: `"Field must contain valid characters."`

---

### Expected Results:
1. "Employer Address" field is visible and placed under the Employment Information section
2. Field accepts only valid ASCII characters: letters, digits, space, `-`, `'`, `.`, `&`, `()`
3. Validation errors appear for disallowed characters
4. Field is not mandatory — form submits even when left empty
5. Valid input is displayed correctly in the output and view sections

---

