## EHU-ATJS-20294

### Title: Add "Purpose of Travel" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to specify the purpose of my travel in the Petition for Space Travel form  
**So that** authorities can understand the reason for my journey and ensure proper documentation and approvals.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the purpose of the applicant's travel. Adding a **Purpose of Travel** field will allow users to provide this information, which is essential for verifying the intent of the journey and maintaining accurate records.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall not be mandatory on UI.
3. The field must display its placeholder when empty.
4. Validation errors shall display the message: *"Field must contain valid characters."*
5. After clicking the **Submit** button, the output table must display the submitted data, including the **Purpose of Travel** field, if provided.

---
## 2 Story points

---

## Test case: Validation and Functionality of the "Purpose of Travel" Field.

### Test Case ID: EHU-ATJS-20294_1
### Test Case Title: Validate "Purpose of Travel" Field for input restrictions, default value and visibility

### Preconditions:
1. User has access to the "Create Form" and "View section" modes
2. The Form contain "Purpose of Travel" field.

### Test Steps:

Step 1. Navigate to the Petition for Space Travel Form and ensure field is visible.
Step 2. Check is "Purpose of Travel" field actionable and empty.
Step 3. Validate Input Restriction.
**Positive cases**
**Negative cases**

### Expected Result
1. "Purpose of Travel" field is visible in "Create Form" and "View section" modes.
2. "Purpose of Travel" field is empty by default.
3. The field accepts valid inputs and rejects invalid inputs with error message.

---
