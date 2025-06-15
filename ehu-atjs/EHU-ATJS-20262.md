## EHU-ATJS-20262

### Title: Add "Previous ZIP/Postal Code" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my previous ZIP/Postal Code in the Petition for Space Travel form  
**So that** authorities can verify my residential history if I have lived at my current address for less than two years.

### Description:
Currently, the Petition for Space Travel form captures the current ZIP/Postal Code but does not include fields for previous ZIP/Postal Code unless explicitly required. Adding a **Previous ZIP/Postal Code** field will allow users to provide their prior postal information when applicable, ensuring accurate record-keeping and verification.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Address Information** section, **conditionally visible** when the user selects the checkbox indicating they have lived at their current address for less than two years.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Please enter a valid ZIP/Postal Code."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Previous ZIP/Postal Code** field, if provided.
