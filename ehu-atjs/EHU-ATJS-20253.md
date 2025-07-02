## EHU-ATJS-20253

### Title: Add "Relationship" Field to the Petition for Space Travel Form

## 1. Relationship Field – Emergency Contact

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

---------------
# Story Points Estimation: 3

# Documentation: study the documentation and understand the logic of the framework.

# Cover positive and negative scenarios: test valid and invalid values (letters, allowed special characters, injection attempts, and non-ASCII input).

# Mandatory field: check the behavior when the field is empty and verify correct error messages for required fields.

# Boundary cases: test very long strings, minimum length (1 character), and inputs consisting only of spaces.

# UI and output: ensure the field is properly displayed on the form and in the resulting output table.

# Possible bugs: the documentation notes that there may be bugs, so it will be necessary to additionally log or reproduce found errors.
-----------------

## 2. Relationship Field – Professional References (Relationship 1)

**As** a user,  
**I want** to specify the relationship with my professional reference in the Petition for Space Travel form  
**So that** authorities can understand the nature of my connection to the reference for proper validation and context.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the relationship with a professional reference. Adding a **Relationship 1** field will allow users to indicate how they are connected to their reference (e.g., Manager, Colleague, Supervisor). This information is important for verifying references and understanding the context of the recommendation.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed **to the right of the Reference 1 - Full Name field** and **above the Reference 1 - Phone Number field** in the Professional References section.
3. The field **shall be mandatory** on the UI.
4. The field must display its placeholder `"Manager, Colleague, etc."` when empty.
5. The field shall be a single-line text field, accepting only the following ASCII symbols: letters, numbers, -, ', ., space, &, ()
6. If the user enters invalid characters, a validation error message *"Field must contain valid characters"* shall appear.
7. If the user leaves the field empty and submits, a "required field" validation message must appear.
8. After clicking the **Submit** button, the output table must display the submitted data, including the **Relationship 1** field.

## Test Case Title: Validate "Relationship 1" Field Functionality (Professional References)

### Preconditions:

1. User has access to the Petition for Space Travel Form.
2. The "Professional References" section is present in the form.
3. The user is authenticated and can create and submit the form.

### Test Steps

#### Step 1: Field Visibility & Placeholder

* Navigate to the Petition for Space Travel Form.
* Locate the "Professional References" section.
* **Expected:** The "Relationship 1" field is visible and located to the right of "Reference 1 - Full Name" and above "Reference 1 - Phone Number".
* **Expected:** The field displays the placeholder text: `Manager, Colleague, etc.`

#### Step 2: Default Value

* Without entering any value, inspect the "Relationship 1" field.
* **Expected:** The field is empty by default.

#### Step 3: Mandatory Field Validation

* Leave "Relationship 1" empty.
* Fill in all other required fields with valid data.
* Submit the form.
* **Expected:** The form displays a validation error for "Relationship 1" (e.g., "This field is required").
* **Expected:** Form is not submitted.

#### Step 4: Positive Input Validation

* Enter each of the following valid values into "Relationship 1", one at a time:

  * "Manager"
  * "QA-1"
  * "Team Lead"
  * "O'Reilly & Co."
  * "VP & Co-Founder"
  * "A"
* Submit the form for each input.
* **Expected:** No validation error occurs.
* **Expected:** The form is submitted successfully.
* **Expected:** The submitted value is displayed in the output table exactly as entered.

#### Step 5: Negative Input Validation (Invalid Characters)

* Enter invalid characters or combinations, such as:

  * "Boss@"
  * "Colleague#1"
  * "Friend!"
  * "<script>alert(1)</script>"
  * Emojis ("👨‍💼") or Cyrillic ("Директор")
* Submit the form for each input.
* **Expected:** The error message "Field must contain valid characters" is shown.
* **Expected:** Form is not submitted.

#### Step 6: Whitespace Handling

* Enter only spaces (e.g., `"    "`).
* Submit the form.
* **Expected:** The field is treated as empty; a required field error is shown.

#### Step 7: Boundary Testing

* Enter a very long value (e.g., 1000 characters of "A").
* Submit the form.
* **Expected:** The field accepts input up to the system’s limit 
(**TODO:** Specify the maximum allowed length for the "Relationship 1" field when this information becomes available).

* **Expected:** The value is displayed correctly in the output table if accepted.

#### Step 8: Post-submission Check

* After a successful submission with a valid value:

  * **Expected:** "Relationship 1" is displayed correctly in the output table on the View Section page.

### Expected Results

1. The "Relationship 1" field is visible and located as specified in the form.
2. The field displays the correct placeholder and is empty by default.
3. The field is mandatory; leaving it empty or entering only spaces triggers a required field error.
4. Only valid ASCII symbols (letters, numbers, -, ', ., space, &, ()) are accepted; invalid inputs trigger the error "Field must contain valid characters".
5. The field handles both minimum (1 character) and maximum (boundary) length inputs appropriately.
6. Upon valid submission, the value is correctly reflected in the output table.

### Postconditions

* The "Relationship 1" field functions according to the requirements: mandatory, correct input validation, proper error messages, and accurate output display.
