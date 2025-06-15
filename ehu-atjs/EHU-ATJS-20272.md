## EHU-ATJS-20272

### Title: Add "Income Type" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to specify the type of income I receive in the Petition for Space Travel form  
**So that** authorities can understand the nature of my earnings and assess my financial situation accurately.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the type of income the applicant earns. Adding an **Income Type** field will allow users to select from predefined options, providing clarity on the structure of their income.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section, below the **Annual Income** field.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **dropdown menu** with the following predefined options:
    - Salary
    - Hourly wage
    - Commission
    - Mixed
6. Validation errors shall display the message: *"Please select an income type."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Income Type** field, if provided.

