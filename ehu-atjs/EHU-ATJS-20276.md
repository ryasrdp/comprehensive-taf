## EHU-ATJS-20276

### Title: Add "Previous Employer City" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the city of my previous employer in the Petition for Space Travel form  
**So that** authorities can verify my employment history and location details if I have worked at my current employer for less than two years.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the city of the applicant's previous employer. Adding a **Previous Employer City** field will allow users to provide this information, which is essential for verifying their prior employment and ensuring accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section, **conditionally visible** when the user selects the checkbox indicating they have worked at their current employer for less than two years.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain valid characters."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Previous Employer City** field, if provided.
