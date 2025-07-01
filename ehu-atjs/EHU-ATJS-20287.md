## EHU-ATJS-20287

### Title: Add "GPA" (for College/University) Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my Grade Point Average (GPA) in the Petition for Space Travel form  
**So that** authorities can evaluate my academic performance and qualifications.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's GPA. Adding a **GPA** field will allow users to provide this information, which is essential for assessing their academic achievements and ensuring accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Education Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **numeric field** that accepts values between 0.1 and 4.0.
6. Validation errors shall display the message: *"Please enter a GPA between 0.1 and 4.0."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **GPA** field, if provided.
