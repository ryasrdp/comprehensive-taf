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

---
## 3 Story points

---
## Test Case: Conditional Visibility and Functionality of "Previous City" Field
### Test Case ID: EHU-ATJS-20261_1
### Test Case Title: Verify the functionality, optionality, and conditional visibility of the "Previous City" field.

### Preconditions:
1. The user has access to the "Petition for Space Travel" form. 
2. The "Address Information" section contains a checkbox labeled "I have lived at my current address for 2+ years".

## Automated Test Scenarios:

### Scenario 1: Conditional Logic Verification (Documented Bug)

#### Steps:

1. Navigate to the form.
2. (Expected Behavior) The "Previous City" field should be hidden by default.
3. (Expected Behavior) Click the "I have lived at my current address for 2+ years" checkbox.
4. (Expected Behavior) The "Previous City" field should become visible.

##### Actual Result: The logic is inverted. The field is visible by default and hides upon clicking the checkbox.

### Scenario 2: Positive Path (Data Submission)

#### Steps:

1. Navigate to the "Petition for Space Travel" form. 
2. Observe that the "Previous City" field is visible by default (due to an existing bug). 
3. Enter "Tokyo" into the "Previous City" field. 
4. Fill in all other mandatory fields on the form. 
5. Click the "Submit" button.

##### Expected Result: The final data table is displayed, and the "Previous City" column correctly shows the value "Tokyo".

### Scenario 3: Optional Field Verification

#### Steps:

1. Navigate to the "Petition for Space Travel" form. 
2. Leave the "Previous City" field empty. 
3. Fill in all other mandatory fields on the form. 
4. Click the "Submit" button.

##### Expected Result: The form submits successfully. The "Previous City" column in the final data table is empty.

### Scenario 4: Negative Path (Invalid Data Validation)

#### Steps:

1. Navigate to the "Petition for Space Travel" form.
2. Enter "City123!@#" into the "Previous City" field.
3. Click the "Submit" button.

##### Expected Result: A tooltip with the error message "Field must contain valid characters." is displayed for the "Previous City" field.
