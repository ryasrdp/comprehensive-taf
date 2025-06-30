## EHU-ATJS-20280

### Title: Add "Year of Graduation" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the year I graduated from high school in the Petition for Space Travel form  
**So that** authorities can verify my educational timeline and confirm when I completed my secondary education.

---

### Description:

Currently, the Petition for Space Travel form does not include a field for specifying the year the applicant graduated from high school.  
Adding a **Year of Graduation** field will allow users to provide this information, which is essential for verifying their academic history and ensuring accurate record-keeping.

---

### Scenario:

1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Education Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. The field shall be a **numeric field** that accepts only values between 1900 and the current year.
6. Validation errors shall display the message: *"Please enter a valid year between 1900 and [current year]."*
7. After clicking the **Submit** button, the output table must display the submitted data, including the **Year of Graduation** field, if provided.

---

### Story Points Estimation: 2

---

### Rationale:

- Straightforward numeric field addition following existing form structure  
- Basic numeric validation logic with current year cap  
- Low implementation complexity – static visibility, not conditional  
- UI/UX consistency maintained with other Education section fields  
- Test coverage easy to implement using standard test components  

---

### Comprehensive Test Case Coverage

**Test Case ID:** `EHU-ATJS-20280_001`  
**Test Case Title:** Validate "Year of Graduation" Field functionality

#### Preconditions:

- User has access to the Petition for Space Travel Form  
- The form loads successfully  

---

### Positive Test Cases:

**TC-000: Field Visibility**  
Steps: Navigate to form → Locate Education Information section  
Expected: "Year of Graduation" field is visible and accessible  

**TC-001: Valid Input - Year = 2000**  
Steps: Select 2000 in the field and submit form  
Expected: Value saved and shown in output table

**TC-002: Valid Input - Year = 1995**  
Steps: Select 1995 in the field and submit form  
Expected: Value saved and shown in output table

**TC-003: Valid Input - Year = 2025**  
Steps: Select 2025 in the field and submit form  
Expected: Value saved and shown in output table

---

### Negative Test Cases:

**TC-004: Invalid Input - Below Min**  
Steps: Select 1899  
Expected: Field input rejected or ignored, form does not break

**TC-005: Invalid Input - Above Max**  
Steps: Select 3000  
Expected: Field input rejected or ignored, form does not break

---

### Optional Input Case:

**TC-006: Empty Input**  
Steps: Do not fill Year of Graduation → Fill all mandatory fields → Submit  
Expected: Form submits successfully, field not shown in output table  

---

### Expected Results:

- "Year of Graduation" field is present in UI under Education Information section  
- Field accepts values between 1900 and current year (e.g., 2025)  
- Invalid values are not accepted  
- Field is optional — form can be submitted without it  
- Output table shows the value if filled, and omits it if empty  

---

### Postconditions:

- The form handles the new field without breaking existing behavior  
- Field data appears only if provided  
- No regression in submission or output layout  

---

### BDD Scenarios Implemented:

**Scenario 1: Check field visibility**  
*Covers TC-000*

**Scenario 2: Valid values (3 cases)**  
*Covers TC-001, TC-002, TC-003*

**Scenario 3: Invalid inputs (2 cases)**  
*Covers TC-004, TC-005*

**Scenario 4: Field optional (empty input)**  
*Covers TC-006*

---

### Total: 7 automated tests across 4 BDD scenarios (including Outline examples)

---

### Automation Limitations:

None. The field is simple and works within the existing test framework. All implemented steps reuse standard methods from the Page Object Model and existing step definitions.
