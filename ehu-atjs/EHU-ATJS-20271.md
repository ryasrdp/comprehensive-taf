## EHU-ATJS-20271

### Title: Add "Annual Income" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my annual income in the Petition for Space Travel form  
**So that** authorities can assess my financial stability and ability to fund interstellar travel.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's annual income. Adding an **Annual Income** field will allow users to provide this information, which is essential for evaluating their financial resources and eligibility for space travel.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **numeric field** that accepts values that are multiples of 1000 and at least 0.
6. Validation errors shall display the message: *"Please enter a valid income (e.g., 1000, 2000, etc.)."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Annual Income** field, if provided.
