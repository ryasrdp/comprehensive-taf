## EHU-ATJS-20256

### Title: Add "What else would you like to tell us about yourself?" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide additional information about myself in the Petition for Space Travel form  
**So that** authorities can gain deeper insights into my background, personality, or any unique circumstances relevant to my application.

### Description:
Currently, the Petition for Space Travel form does not include a field for applicants to share additional details about themselves. Adding a **What else would you like to tell us about yourself?** field will allow users to provide extra information that might not fit into other predefined sections, offering flexibility and personalization in the application process.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Race Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **multi-line text field** with a maximum length of 200 words.
6. Validation errors shall display the message: *"Field must not exceed 200 words."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **What else would you like to tell us about yourself?** field, if provided.

### Story Point Estimation: 2 Story Points

#### Estimation Rationale

| Task Component           | Complexity | Notes                                          |
|--------------------------|------------|------------------------------------------------|
| UI form update           | Low        | Multi-line field and label addition            |
| Placeholder logic        | Low        | Basic HTML attribute                           |
| Validation (word count)  | Medium     | Slightly more complex than character counting  |
| Output rendering         | Low        | Simple update to display entered data          |

---

### Test Case Coverage

| TC ID        | Title                                                             |
|--------------|-------------------------------------------------------------------|
| TC-20256-01  | Field is visible in Race Information section                      |
| TC-20256-02  | Placeholder is shown when field is empty                          |
| TC-20256-03  | Field is not mandatory                                            |
| TC-20256-04  | Field accepts and submits exactly 200 words                       |
| TC-20256-05  | Field rejects input over 200 words with correct validation message|
| TC-20256-06  | Submitted text appears in the output table                        |
| TC-20256-07  | Field handles special characters and newlines                     |

---

### Pre-conditions

- The user is on the Petition for Space Travel form page  
- The form is fully loaded in the browser  
- No existing validation errors are displayed  

---

### Positive Test Scenarios

**TC-20256-01 — Field is visible**  
**Steps:**  
1. Open the form  
2. Scroll to the Race Information section  
**Expected Result:**  
The field "What else would you like to tell us about yourself?" is visible.

**TC-20256-02 — Placeholder is shown**  
**Steps:**  
1. Open the form  
2. Locate the new text area  
**Expected Result:**  
Placeholder is displayed when the field is empty.

**TC-20256-03 — Field is optional**  
**Steps:**  
1. Leave the field empty  
2. Fill out all required fields  
3. Click Submit  
**Expected Result:**  
Form is submitted successfully without any validation error.

**TC-20256-04 — Input with exactly 200 words**  
**Steps:**  
1. Input exactly 200 words into the field  
2. Click Submit  
**Expected Result:**  
Form is submitted successfully, and the input appears in the output table.

**TC-20256-06 — Data is shown in output table**  
**Steps:**  
1. Enter valid text in the field  
2. Submit the form  
**Expected Result:**  
Entered text is correctly displayed in the output summary or table.

---

### Negative Test Scenario

**TC-20256-05 — Input exceeds 200 words**  
**Steps:**  
1. Enter more than 200 words in the field  
2. Click Submit  
**Expected Result:**  
Form is not submitted. A validation error appears:  
"Field must not exceed 200 words."

---

### Special Case

**TC-20256-07 — Special characters and newlines**  
**Steps:**  
1. Enter text with line breaks and special characters (e.g., punctuation, symbols)  
2. Click Submit  
**Expected Result:**  
Form accepts the input and displays it with formatting preserved.

---

### BDD Scenario (Gherkin)

```gherkin
Feature: Add "What else would you like to tell us about yourself?" field to the Petition for Space Travel Form

  As a user
  I want to provide additional information about myself
  So that authorities can gain deeper insights into my background

  Background:
    Given I am on the Petition for Space Travel form page

  Scenario: Display the field
    Then I should see a multi-line text field labeled "What else would you like to tell us about yourself?" in the Race Information section
    And the field should not be marked as mandatory
    And the field should display a placeholder when empty

  Scenario: Submit valid information
    When I enter valid text under 200 words
    And I click Submit
    Then the output table should include the entered text

  Scenario: Submit empty field
    When I leave the field empty
    And I click Submit
    Then the submission should succeed

  Scenario: Submit over 200 words
    When I enter more than 200 words
    And I click Submit
    Then I should see an error "Field must not exceed 200 words."
    
