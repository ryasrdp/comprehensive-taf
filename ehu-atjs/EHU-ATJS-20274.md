## EHU-ATJS-20274

### Title: Add "Previous Job Title" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the title of my previous job in the Petition for Space Travel form  
**So that** authorities can verify my employment history and understand my professional background if I have worked at my current employer for less than two years.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's previous job title. Adding a **Previous Job Title** field will allow users to provide this information, which is essential for verifying their professional experience and role in their previous employment.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section, **conditionally visible** when the user selects the checkbox indicating they have worked at their current employer for less than two years.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain valid characters."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Previous Job Title** field, if provided.

