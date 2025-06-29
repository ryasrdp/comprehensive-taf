## EHU-ATJS-20254

### Title: Add "Where, when and under what circumstances did he end up on planet Earth?" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide detailed information about where, when, and under what circumstances I arrived on planet Earth  
**So that** authorities can better understand my background and the context of my presence on Earth.

### Description:
Currently, the Petition for Space Travel form does not include a field to capture information about the applicant's arrival on Earth. Adding a **Where, when and under what circumstances did he end up on planet Earth?** field will allow users to share detailed information about their arrival, which is essential for context and record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Race Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **multi-line text field** with a maximum length of 200 words.
6. Validation errors shall display the message: *"Field must not exceed 200 words."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Where, when and under what circumstances did he end up on planet Earth?** field, if provided.

---

## 1 Story point

---

## Test case: Validation and Functionality of the "Where, when and under what circumstances did he end up on planet Earth?" Field

**Preconditions:**
- User has access to the "Create Form" and "View section" modes.
- The form contains the field "Where, when and under what circumstances did he end up on planet Earth?" in the "Race Information" section.

**Test Steps:**
1. Navigate to the Petition for Space Travel Form and ensure the field is visible and empty by default.
2. Enter up to 200 words, verify the field accepts the input and can be submitted.
3. Enter more than 200 words and submit; verify the error "Field must not exceed 200 words." is shown.
4. Leave the field empty and submit; verify the form is submitted successfully.

**Expected Result:**
- The field is visible and empty by default.
- The field accepts up to 200 words.
- More than 200 words triggers an error message.
- The form can be submitted with the field empty.
- The output table displays the entered value if provided.

---
