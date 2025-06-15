## EHU-ATJS-20288

### Title: Add "Professional Skills" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to list my professional skills in the Petition for Space Travel form  
**So that** authorities can evaluate my expertise and qualifications for space travel.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's professional skills. Adding a **Professional Skills** field will allow users to provide this information, which is essential for assessing their capabilities and ensuring accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Skills & Qualifications** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **multi-line text field** that accepts ASCII symbols only (allowed: letters, numbers, `-`, `'`, `.`, space, `&`, `()`).
6. Validation errors shall display the message: *"Field must contain valid characters."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Professional Skills** field, if provided.
