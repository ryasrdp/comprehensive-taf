## EHU-ATJS-20259

### Title: Add "Address Line 2" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide additional address details in the Petition for Space Travel form  
**So that** authorities can capture more specific information about my location if needed.

### Description:
Currently, the Petition for Space Travel form includes fields for the primary address but does not have an option for additional address details. Adding an **Address Line 2** field will allow users to provide supplementary information, such as apartment numbers, building names, or other location specifics.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Address Information** section, below the **Street Address** field.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain Latin letters only."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Address Line 2** field, if provided.

