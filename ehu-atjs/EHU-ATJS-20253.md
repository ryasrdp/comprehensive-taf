## EHU-ATJS-20253

### Title: Add "Relationship" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to specify the relationship with my emergency contact in the Petition for Space Travel form  
**So that** authorities can understand the nature of my connection to the emergency contact for better context during communication.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the relationship with the emergency contact. Adding a **Relationship** field will allow users to indicate how they are connected to their emergency contact (e.g., family member, friend, colleague). This information is important for clarity and proper communication during emergencies.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed **to the right of the Emergency Contact Name field** and **above the Emergency Contact Phone field**.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a dropdown menu with the following predefined options:
    - Email
    - Phone
    - Text Message
6. Validation errors shall display the message: *"Please select a valid relationship type."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Relationship** field, if provided.
