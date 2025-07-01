## EHU-ATJS-20252

### Title: Add "Emergency Contact Name" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the name of an emergency contact in the Petition for Space Travel form  
**So that** authorities can reach out to a designated person in case of an emergency during my space travel.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying an emergency contact name. Adding an **Emergency Contact Name** field will allow users to provide the name of a trusted individual who can be contacted in case of an emergency. This ensures safety and preparedness during space travel.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed on the Petition for Space Travel Form near the **Emergency Contact Phone** field.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. After clicking the **Submit** button, the form must display the submitted data, including the **Emergency Contact Name** field, if provided.

---

## Estimation:
2 story points

## Test Case ID: EHU-ATJS-20252.001
## Test Case Title: Validate "Emergency Contact Name" Field functionality.

### Preconditions:
1. The user has access to the Petition for Space Travel form.
2. The form is loaded successfully.

## Test Cases
### Positive Test Cases:

#### **P-TC-001: Field Visibility**
- **Steps:** 
1. Open the Petition for Space Travel form.
2. Locate the "Emergency Contact Name" field near the "Emergency Contact Phone" field.

- **Expected Result:**
The "Emergency Contact Name" field is visible and accessible.


#### **P-TC-002: Placeholder Check**
- **Steps:**
1. Leave the "Emergency Contact Name" field empty.

- **Expected Result:**
The placeholder text "Enter emergency contact name" is displayed.

#### **P-TC-003: Valid Input - Latin Characters Only**
- **Steps:**
1. Enter "Han Solo" in the "Emergency Contact Name" field.

- **Expected Result:**
1. The field accepts the value.
2. No validation errors are displayed.

#### **P-TC-004: Valid Input - Alphanumeric Characters**
- **Steps:**
1. Enter "Clone 99" in the "Emergency Contact Name" field.

- **Expected Result:**
The field accepts the value.

#### **P-TC-005: Valid Input - Allowed Special Characters**
- **Steps:**
1. Enter "R2-D2 - Astro & Tech Ltd. (your droid's startup)" in the "Emergency Contact Name" field.

- **Expected Result:**
1. The field accepts the value.
2. Allowed characters include: -, ', ., space, &, ()

#### **P-TC-006: Form Submission with Provided Emergency Contact Name**
- **Steps:**
1. Fill in all mandatory fields.
2. Provide a valid value in the "Emergency Contact Name" field.
3. Click Submit.

- **Expected Result:**
1. The form submits successfully.
2. The submitted "Emergency Contact Name" appears in the output table.

#### **P-TC-007: Form Submission without  Provided Emergency Contact Name**
- **Steps:**
1. Fill in only the mandatory fields.
2. Leave the "Emergency Contact Name" field empty.
3. Click Submit.

- **Expected Result:**
1. The form submits successfully.
2. The field is optional.



### Negative Test Cases:

#### **N-TC-001: Invalid Input - Unicode Special Characters**
- **Steps:**
1. Enter "Darth Vader ★☆." in the "Emergency Contact Name" field.

- **Expected Result:**
1. Validation error is displayed: "Field must contain Latin letters only."

#### **N-TC-002: Invalid Input - Non-ASCII Characters (Cyrillic)**
- **Steps:**
1. Enter "Дарт Вейдер" in the "Emergency Contact Name" field.

- **Expected Result:**
1. Validation error is displayed: "Field must contain Latin letters only."


### Expected Results Summary:
1. The "Emergency Contact Name" field is visible and displayed near the "Emergency Contact Phone" field.
2. The placeholder "Enter emergency contact name" is visible when the field is empty.
3. Validation for ASCII characters works correctly.
4. The field is optional, form submission works without it.
5. If provided, the entered value is displayed in the output table after submission.

###  Postconditions:
1. Solar System field functions according to specifications. 
2. No impact on existing form functionality.
3. Data integrity maintained in submission results.

---
### Implemented BDD scenarios: 

#### **Scenario 1: Field Visibility Testing**
- Verifies Emergency Contact Name field is present near Emergency Contact Phone in the Contact Information section.
- Covers P-TC-001.  

#### **Scenario 2: Positive Testing with Valid Values (6 test cases)**
- Tests valid input values such as "Luke Skywalker", "Leia Organa", "Obi-Wan Kenobi", "Yoda & Co.", "Chewbacca-42", "R2-D2 - Astro & Tech Ltd. (your droid's startup)".
- Confirms data appears correctly in the output table after form submission.
- Covers P-TC-003, P-TC-004, P-TC-005, P-TC-006.

#### **Scenario 3: Non-Mandatory Field Testing**
- Verifies form submits successfully without the Emergency Contact Name field filled.
- Confirms field is optional as per requirements.
- Covers P-TC-007.

#### **Scenario 4: Invalid Input Testing (Negative Cases)**
- Validates that entering invalid characters such as Unicode symbols or Cyrillic triggers validation errors.
- Covers N-TC-001, N-TC-002 (currently marked for manual testing or limited automation).

#### **Scenario 5: Placeholder Testing**
- Verifies the placeholder text "Enter emergency contact name" is displayed when the field is empty.
- Should cover P-TC-002 (currently marked for manual testing).

### **Automation Limitations:**
Validation testing for invalid characters (N-TC-001, N-TC-002) cannot be fully automated due to the current step definitions' limitation in precisely targeting tooltip validation messages for the Emergency Contact Name field within the Contact Information section. 
The existing generic locator for field validation operates without section context, leading to element ambiguity if similar fields exist in different form sections.

Additionally, placeholder verification for the Emergency Contact Name field is currently not automated due to the absence of a corresponding step definition capable of extracting and asserting placeholder values.

## **Alternative Approach:**
These scenarios are documented for manual execution or will be automated in future test cycles, once section-specific selectors and enhanced step definitions are implemented to support unambiguous field-level validation and placeholder checks.
The current automated suite focuses on functional, UI-positive, and field interaction scenarios with reliable section-based steps.

### **Additional information**
Boundary value checking (e.g., input length limits) was not included because the specification does not define any length restrictions for the "Emergency Contact Name" field.

The validation focuses solely on allowed ASCII characters (letters, numbers, -, ', ., space, &, ()). The error message "Field must contain Latin letters only" applies when forbidden characters are used.

Thus, the test coverage prioritizes positive and negative scenarios around character validation rather than length or boundary values.