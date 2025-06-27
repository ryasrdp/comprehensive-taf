## EHU-ATJS-20296

### Title: Add "Universe" Field to the Previous Travel Information Section in the Petition for Space Travel Form

**As** a user,  
**I want** to provide the name of the universe I previously traveled to in the Petition for Space Travel form  
**So that** authorities can document my intergalactic travel history and understand the scope of my past journeys.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the universe the applicant previously traveled to. Adding a **Universe** field to the **Previous Travel Information** section will allow users to provide this information, which is essential for maintaining accurate records of intergalactic travel.

### Scenario:
1. A new field shall be added to the **Previous Travel Information** section of the Petition for Space Travel Form.
2. The field shall not be mandatory on UI.
3. The field must display its placeholder when empty.
4. Validation errors shall display the message: *"Field must contain valid characters."*
5. After clicking the **Submit** button, the output table must display the submitted data, including the **Universe** field, if provided.

---

## 1 Story Points

# Test case: Validation and Functionality of the "Universe" Field

---

## Test Case ID: EHU-ATJS-20296_001
## Test Case Title: Validate Universe" Field for input restrictions, default value, and visibility.

### Preconditions
1. User has access to the Petition for Space Travel Form.

### *Test steps*

#### Step 1. Verify visibility
- Navigate to the Petition for Space Travel Form. Ensure the section is visible
- Ensure the "Universe" Field is visible

#### Step 2. Verify default value (field empty)

#### Step 3. Validate Input restrictions
*Positive test Cases:*
*Negative test Cases:*

#### Step 4 Boundary testing:
- Enter maximum allowed characters

#### Expected Results:
1. The "Universe" field is visible in 'Create Form' and 'View Section'
2. Default value of the Universe field is empty.
3. Field accept valid inputs and rejects invalid inputs with the error message *Field must contain valid characters*
4. Bounduary testing reults align with the fields character limits.

#### Postconditions:
 - The "Universe" field functions correctly according to the specified requirements.
