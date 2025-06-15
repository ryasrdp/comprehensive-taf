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
