## EHU-ATJS-20281

### Title: Add "Diploma Received" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to specify whether I received a high school diploma in the Petition for Space Travel form  
**So that** authorities can confirm my educational achievements and understand my academic qualifications.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying whether the applicant received a high school diploma. Adding a **Diploma Received** field will allow users to select their diploma status from predefined options, ensuring clarity and accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Education Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **dropdown menu** with the following predefined options:
    - Yes
    - No
    - GED
6. Validation errors shall display the message: *"Please select a valid option."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Diploma Received** field, if provided.
