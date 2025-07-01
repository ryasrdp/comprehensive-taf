## EHU-ATJS-20280

### Title: Add "Year of Graduation" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the year I graduated from high school in the Petition for Space Travel form  
**So that** authorities can verify my educational timeline and confirm when I completed my secondary education.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the year the applicant graduated from high school. Adding a **Year of Graduation** field will allow users to provide this information, which is essential for verifying their academic history and ensuring accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Education Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **numeric field** that accepts only values between 1900 and the current year.
6. Validation errors shall display the message: *"Please enter a valid year between 1900 and [current year]."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Year of Graduation** field, if provided.

