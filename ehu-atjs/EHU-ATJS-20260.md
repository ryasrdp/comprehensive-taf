## EHU-ATJS-20260

### Title: Add "Previous Street Address" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my previous street address in the Petition for Space Travel form  
**So that** authorities can verify my residential history if I have lived at my current address for less than two years.

### Description:
Currently, the Petition for Space Travel form captures the current address but does not include fields for previous address details unless explicitly required. Adding a **Previous Street Address** field will allow users to provide their prior residential information when applicable, ensuring accurate record-keeping and verification.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Address Information** section, **conditionally visible** when the user selects the checkbox indicating they have lived at their current address for less than two years.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain Latin letters only."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Previous Street Address** field, if provided.
