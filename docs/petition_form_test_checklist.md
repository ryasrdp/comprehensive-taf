# Test Checklist 

## Feature: Add "Income Type" Field to Petition for Space Travel Form

---

### Positive Test Case

**Title**: Submit form with valid Income Type selected  
**Preconditions**: User is on the Petition for Space Travel form  
**Steps**:
1. Scroll to Employment Information section
2. Select "Salary" from the "Income Type" dropdown
3. Click Submit

**Expected Result**:  
- Submission is successful  
- Selected "Income Type" appears in the output table

---

### Optional Field Test

**Title**: Submit form without selecting Income Type  
**Steps**:
1. Do not select any value in "Income Type"
2. Fill other required fields
3. Click Submit

**Expected Result**:  
- Form is submitted without errors  
- "Income Type" may be blank in the output, and no validation message is shown

---

### Edge Case (optional)

**Title**: Try submitting with invalid/empty value in dropdown  
**Steps**:
1. Manually clear the value in "Income Type" (if possible)
2. Click Submit

**Expected Result**:  
- (If validation is enforced) Message "Please select an income type." appears  
- Otherwise: Form still submits

