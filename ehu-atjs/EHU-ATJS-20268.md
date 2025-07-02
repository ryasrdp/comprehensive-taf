# EHU-ATJS-20268

**As** a user,  
**I want** to provide my employer's state or province in the Petition for Space Travel form  
**So that** authorities can verify the regional location of my workplace and ensure accurate record-keeping.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the state or province where the employer is located. Adding an **Employer State/Province** field will allow users to provide this information, which is essential for verifying employment details and location.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.  
2. The field shall be displayed in the **Employment Information** section.  
3. The field shall not be mandatory on UI.  
4. The field must display its placeholder when empty.  
5. Validation errors shall display the message: *"Field must contain valid characters."*  
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Employer State/Province** field, if provided.

---

## Story Points Estimation: 2

### Rationale:
- **Straightforward form field addition** following existing form structure  
- **Basic validation logic** using character whitelist  
- **Low implementation complexity** – static visibility, not conditional  
- **UI/UX consistency** maintained with other Employment section fields  
- **Test coverage** easy to implement using standard test components

---

# Comprehensive Test Case Coverage

## Test Case ID: EHU-ATJS-20268_001  
## Test Case Title: Validate "Employer State/Province" Field functionality

### Preconditions:  
1. User has access to the Petition for Space Travel form  
2. The form loads successfully  

### Positive Test Cases:

#### TC-000: Field Visibility  
- **Steps:** Navigate to form → Locate Employment Information section  
- **Expected:** Employer State/Province field is visible and accessible  

#### TC-001: Placeholder Visibility  
- **Steps:** Navigate to form → Focus on Employer State/Province field  
- **Expected:** Placeholder text (e.g., "Enter state or province") is visible  

#### TC-002: Valid Input - Basic Text  
- **Steps:** Enter "California"  
- **Expected:** Input accepted without validation error  

#### TC-003: Valid Input - With Spaces and Symbols  
- **Steps:** Enter "St. John's"  
- **Expected:** Input accepted (letters, spaces, apostrophes, periods allowed)  

#### TC-004: Form Submission with field filled  
- **Steps:** Fill mandatory fields + Employer State/Province → Submit  
- **Expected:** Submitted data appears in output table  

#### TC-005: Optional field (empty input)  
- **Steps:** Leave Employer State/Province empty and submit form  
- **Expected:** Form submits successfully without validation errors  

### Negative Test Cases:

#### TC-006: Invalid Characters - Special symbols  
- **Steps:** Enter "Florida!!!"  
- **Expected:** Validation error: *"Field must contain valid characters."*  

#### TC-007: Invalid Characters - Emojis  
- **Steps:** Enter "Texas 🚀"  
- **Expected:** Validation error: *"Field must contain valid characters."*  

---

### Expected Results:
1. Employer State/Province field visible in Employment Information section  
2. Accepts valid input with letters, numbers, spaces, commas, hyphens, periods, apostrophes  
3. Field remains optional without blocking submission  
4. Submitted data, if provided, is displayed in the output table  
5. Invalid input triggers correct validation error  

---

### Postconditions:  
- Employer State/Province field behaves as specified  
- No regression or impact on existing form features  
- Employment data integrity is maintained in submission output  

---

## BDD Scenarios Implemented:

### Scenario 1: Field Visibility Testing  
- Ensures field appears in correct form section  
- Covers TC-000  

### Scenario 2: Placeholder Visibility Testing  
- Ensures placeholder text appears correctly  
- Covers TC-001  

### Scenario 3: Positive Testing with Valid Inputs (3 test cases)  
- Inputs include state/province names with allowed formatting  
- Confirms successful submission and proper data display  
- Covers TC-002, TC-004  

### Scenario 4: Optional Field Verification  
- Tests submission flow when field is left empty  
- Covers TC-005  

### Scenario 5: Negative Input Validation (2 test cases)  
- Tests invalid inputs and validation error feedback  
- Covers TC-006, TC-007  

---

**Total: 9 automated test cases covering positive, negative, and optional scenarios.**

---

## Automation Limitations:  
Currently, tooltip-based validation error capture is limited for overlapping field names in dynamic sections. Manual validation testing is recommended for:  
- TC-006: Special characters and non-Latin symbols  
- TC-007: Emoji validation  

