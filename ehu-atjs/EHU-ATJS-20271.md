## EHU-ATJS-20271

### Title: Add "Annual Income" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my annual income in the Petition for Space Travel form  
**So that** authorities can assess my financial stability and ability to fund interstellar travel.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's annual income. Adding an **Annual Income** field will allow users to provide this information, which is essential for evaluating their financial resources and eligibility for space travel.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **numeric field** that accepts values that are multiples of 1000 and at least 0.
6. Validation errors shall display the message: *"Please enter a valid income (e.g., 1000, 2000, etc.)."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Annual Income** field, if provided.

### Story Point Estimation: **5**

**Estimation technique:** Fibonacci sequence

**Rationale:**
- UI update in existing complex form
- Numeric field with strict validation logic
- Must handle optional field behavior correctly
- Placeholder and error message setup
- Data needs to be rendered in submission table
- Negative/edge cases increase complexity

---

## Test Case: Validation and Functionality of the "Annual Income" Field

### Test Case ID: EHU-ATJS-20271_1  
### Test Case Title: Validate "Annual Income" Field for input restrictions, default value, and visibility

### Preconditions:
1. User has access to the "Create Form" and "View Section" modes.
2. The form contains the "Annual Income" field under the "Employment Information" section.

### Test Steps:

Step 1. Navigate to the Petition for Space Travel Form and ensure the "Annual Income" field is visible.  
Step 2. Check that the "Annual Income" field is empty by default and shows its placeholder.  
Step 3. Validate input restrictions.

**Positive cases**
- Enter a valid value: `3000` → Input is accepted, no error shown.

**Negative cases**
- Enter a non-multiple of 1000: `2500` → Validation error: *"Please enter a valid income (e.g., 1000, 2000, etc.)."*
- Enter a negative number: `-1000` → Validation error is shown.
- Enter non-numeric input: `abc` → Validation error is shown.
- Enter special characters: `!@#` → Validation error is shown.

### Expected Result:
1. "Annual Income" field is visible in both "Create Form" and "View Section" modes.
2. The field is optional and empty by default.
3. Placeholder text is shown when the field is empty.
4. Valid values are accepted.
5. Invalid values trigger appropriate validation errors.
6. Upon submission, if value was entered, it is displayed in the output table.
7. If left empty, the field is omitted from the submission output.
