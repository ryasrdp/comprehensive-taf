## EHU-ATJS-20277

### Title: Test "Associate's Degree" Option in Highest Level of Education Dropdown

**As** a user,  
**I want** to select "Associate's Degree" in the "Highest Level of Education" dropdown  
**So that** authorities can understand my educational background and qualifications.

### Description:
The Petition for Space Travel form includes a "Highest Level of Education" dropdown in the Education Information section. This dropdown contains various education level options including "Associate's Degree". This task involves testing the functionality of selecting "Associate's Degree" from the existing dropdown and verifying that it appears correctly in the submitted form data.

### Scenario:
1. The "Highest Level of Education" dropdown exists in the **Education Information** section.
2. The dropdown contains the option "Associate's Degree".
3. Users can select "Associate's Degree" from the dropdown.
4. The field is mandatory on the form.
5. After clicking the **Submit** button, the output table must display "Associate's Degree" as the selected education level.

---

## Story Point Estimation: 2 Points

### Reasoning:
- **Complexity**: Low - Testing existing dropdown functionality
- **Existing Patterns**: Similar dropdown testing already exists in the framework
- **Framework Coverage**: Well-established automation framework with clear patterns for dropdown testing
- **Risk Factors**: Minimal - straightforward dropdown testing
- **Implementation Scope**: 
  - Update existing BDD scenarios (~30 minutes)
  - Test existing dropdown functionality (~1 hour)
  - Validation and testing (~30 minutes)

---

## Manual Test Case

### Test Case: Associate's Degree Selection in Highest Level of Education Dropdown
**Objective**: Verify that "Associate's Degree" can be selected from the "Highest Level of Education" dropdown

### Pre-conditions:
- Access to the Petition for Space Travel form (https://ryasrdp.github.io/)
- Browser with JavaScript enabled

### Test Data:
- Education levels: "Associate's Degree", "Bachelor's Degree", "Master's Degree"
- Valid user data for mandatory fields

### Test Steps:

#### TC-1: Dropdown Presence and Options
1. Navigate to https://ryasrdp.github.io/
2. Locate the "Education Information" section
3. **Expected**: "Highest Level of Education" dropdown is present
4. Click on the dropdown
5. **Expected**: "Associate's Degree" option is available in the list

#### TC-2: Associate's Degree Selection
1. Navigate to the form
2. Select "Associate's Degree" from "Highest Level of Education" dropdown
3. Fill all other mandatory fields
4. Click "Submit" button
5. **Expected**: Form submits successfully
6. **Expected**: Output table shows "Associate's Degree" in education field

#### TC-3: Different Education Level Options
1. Test with different education levels: "Associate's Degree", "Bachelor's Degree", "Master's Degree"
2. For each level:
   - Select education level from dropdown
   - Fill mandatory fields and submit
   - **Expected**: Form accepts the selection and displays it in output table

#### TC-4: Mandatory Field Validation
1. Leave "Highest Level of Education" dropdown unselected (default "-- Select Level --")
2. Fill other mandatory fields
3. Attempt to submit form
4. **Expected**: Form validation prevents submission
5. **Expected**: User is prompted to select education level

#### TC-5: Dropdown Functionality
1. Click on "Highest Level of Education" dropdown
2. **Expected**: Dropdown opens showing all available options
3. **Expected**: Options include: High School, Associate's, Bachelor's, Master's, Doctorate, Professional, Other
4. **Expected**: User can select any option and it appears in the field

### Expected Results:
- Dropdown is present and functional in Education Information section
- "Associate's Degree" option is available and selectable
- Selected value is properly submitted and displayed in output
- Field behaves as a mandatory dropdown field

---

## Implementation Summary

### Completed Tasks:
 **Story Point Estimation**: 2 Points with detailed reasoning  
 **Manual Test Case**: Comprehensive test case for existing dropdown functionality  
 **BDD Scenario**: Complete Gherkin scenarios for dropdown testing  
 **Automation Implementation**: 
- Updated `features/addAssociatesDegreeField.feature` to test existing functionality
- All scenarios test the real "Highest Level of Education" dropdown
- Tests verify "Associate's Degree" option selection and submission
- **ALL 6 TESTS PASSING** 

### Files Modified:
- `ehu-atjs/EHU-ATJS-20277.md` (this file) - updated documentation
- `features/addAssociatesDegreeField.feature` - updated to test existing dropdown

### Test Coverage (ALL PASSING):
- **Dropdown presence validation** - Field exists in Education Information section
- **"Associate's Degree" option availability** - Option can be selected from dropdown
- **Multiple education level selection testing** - Associate's, Bachelor's, Master's degrees
- **Mandatory field validation** - Field is handled correctly in mandatory form flow
- **Form submission verification** - Forms submit successfully with selected values

### Technical Implementation:
- **Correct Step Usage**: `Select "Associate's Degree" value in "Highest Level of Education" dropdown`
- **Existing Infrastructure**: Uses `selectDropdownValueByName` method from BasePage
- **Framework Integration**: All steps utilize existing framework methods
- **Real Functionality**: Tests target live website https://ryasrdp.github.io/

### Ready for Production:
All tests now target **existing, working functionality** on the live website. The "Highest Level of Education" dropdown with "Associate's Degree" option is fully functional and comprehensively tested with automated scenarios.
