## EHU-ATJS-20288

### Title: Add "Professional Skills" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to list my professional skills in the Petition for Space Travel form  
**So that** authorities can evaluate my expertise and qualifications for space travel.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the applicant's professional skills. Adding a **Professional Skills** field will allow users to provide this information, which is essential for assessing their capabilities and ensuring accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Skills & Qualifications** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **multi-line text field** that accepts ASCII symbols only (allowed: letters, numbers, `-`, `'`, `.`, space, `&`, `()`).
6. Validation errors shall display the message: *"Field must contain valid characters."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Professional Skills** field, if provided.

---

### Story Point Estimation: 1 Story Point

#### Estimation Rationale

- One field extension using existing structure
- POM utilities available
- ASCII-only validation reused
- No backend impact
- Low complexity

---

### Test Case Coverage

| TC ID        | Title                                                             |
|--------------|-------------------------------------------------------------------|
| TC-20288-01  | Field is visible in Skills & Qualifications section               |
| TC-20288-02  | Placeholder is shown when field is empty                          |
| TC-20288-03  | Field is not mandatory                                            |
| TC-20288-04  | Field accepts valid ASCII input                                   |
| TC-20288-05  | Field rejects invalid (non-ASCII) input with correct message      |
| TC-20288-06  | Submitted text appears in the output table                        |
| TC-20288-07  | Field handles special allowed characters and newlines             |

---

### Pre-conditions

- The user is on the Petition for Space Travel form page  
- The form is fully loaded in the browser  
- No existing validation errors are displayed  

---

### Positive Test Scenarios

**TC-20288-01 — Field is visible**  
**Steps:**  
1. Open the form  
2. Scroll to the Skills & Qualifications section  
**Expected Result:**  
The field "Professional Skills" is visible.

**TC-20288-02 — Placeholder is shown**  
**Steps:**  
1. Open the form  
2. Locate the Professional Skills text area  
**Expected Result:**  
Placeholder is displayed when the field is empty.

**TC-20288-03 — Field is optional**  
**Steps:**  
1. Leave the field empty  
2. Fill out all required fields  
3. Click Submit  
**Expected Result:**  
Form is submitted successfully without any validation error.

**TC-20288-04 — Input with valid ASCII characters**  
**Test Data:**  
- Management, Multi-tasking, Expert SV2
- Robotics & AI  
- Spacecraft pilot  
- -'. &()  
- Management\nRobotics & AI\nSpacecraft pilot
**Steps:**  
1. Input a valid value from the test data into the field  
2. Click Submit  
**Expected Result:**  
Form is submitted successfully, and the input appears in the output table.

**TC-20288-06 — Data is shown in output table**  
**Steps:**  
1. Enter valid text in the field  
2. Submit the form  
**Expected Result:**  
Entered text is correctly displayed in the output summary or table.

---

### Negative Test Scenario

**TC-20288-05 — Input with invalid (non-ASCII) characters**  
**Test Data:**  
- 中文, @!#  
- 🚀 Astronaut  
- <script>alert(1)</script>  
**Steps:**  
1. Enter an invalid value from the test data in the field  
2. Click Submit  
**Expected Result:**  
Form is not submitted. A validation error appears:  
"Field must contain valid characters."

---

### Edge Test Scenario

**TC-20288-07 — Field handles multi-line input**  
**Test Data:**  
- Management\nRobotics & AI\nSpacecraft pilot

**Steps:**  
1. Input the multi-line value from the test data into the Professional Skills field  
2. Click Submit

**Expected Result:**  
Form is submitted successfully, and the input (with line breaks) appears correctly in the output table.

```