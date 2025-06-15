## EHU-ATJS-20270

### Title: Add "Months at Current Employer" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the number of months I have been employed at my current workplace in the Petition for Space Travel form  
**So that** authorities can understand the duration of my employment and verify my professional stability.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the number of months the applicant has been employed at their current workplace. Adding a **Months at Current Employer** field will allow users to provide this information, which is essential for calculating their total employment duration.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section, below the **Years at Current Employer** field.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **numeric field** that accepts values between 0 and 11.
6. Validation errors shall display the message: *"Please enter a valid number between 0 and 11."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Months at Current Employer** field, if provided.
