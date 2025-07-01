## EHU-ATJS-20261

### Title: Add "Previous City" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the name of my previous city in the Petition for Space Travel form  
**So that** authorities can verify my residential history if I have lived at my current address for less than two years.

### Description:
Currently, the Petition for Space Travel form captures the current city but does not include fields for previous city details unless explicitly required. Adding a **Previous City** field will allow users to provide their prior residential city information when applicable, ensuring accurate record-keeping and verification.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Address Information** section, **conditionally visible** when the user selects the checkbox indicating they have lived at their current address for less than two years.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. After clicking the **Submit** button, the output table must display the submitted data, including the **Previous City** field, if provided.
