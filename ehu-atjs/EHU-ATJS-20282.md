## EHU-ATJS-20282

### Title: Add "College/University Name" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide the name of my college or university in the Petition for Space Travel form  
**So that** authorities can verify my higher education background and confirm my academic history.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the name of the applicant's college or university. Adding a **College/University Name** field will allow users to provide this information, which is essential for verifying their educational qualifications and ensuring accurate record-keeping.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Education Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain valid characters."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **College/University Name** field, if provided.



## User Story Estimation

**User Story Number**: EHU-ATJS-20282  
**Title**: Add "College/University Name" Field to the Petition for Space Travel Form  

---

### Estimation Summary

**Final Estimate**: `3 Story Points`  
**Estimation Method**: Fibonacci Sequence  

---

### Estimation Breakdown & Justification

1. **Add the field to the Education Information section** – *0.5 Story Points*  
   This is a basic UI task that involves inserting a new input field in an existing form section.

2. **Add a placeholder to the field** – *0.5 Story Points*  
   A straightforward configuration task — adding placeholder text to guide the user.

3. **Make the field optional** – *0.5 Story Points*  
   The field should not be mandatory, so we must ensure that form submission works correctly without filling it. This requires minimal logic adjustments.

4. **Implement validation and error message** – *1 Story Point*  
   Includes input validation logic and displaying a custom error message (“Field must contain valid characters.”). Slightly more complex due to edge case handling.

5. **Display the value in the output table** – *0.5 Story Points*  
   Ensure the submitted value (if provided) appears correctly in the summary/output table. Involves a minor update to the rendering logic.

6. **Write BDD scenario in Gherkin syntax** – *0.5 Story Points*  
   Writing a readable Gherkin scenario to describe how the feature should behave. This is a typical BDD practice and part of the test planning.

7. **Automate the BDD test** – *0.5 Story Points*  
   Implement the Gherkin scenario in code using the existing automation framework and Page Object Model. Involves creating selectors and steps.

---

### Overall Justification

This user story includes basic UI changes, a validation step, output display logic, and one automated test.  
There is no complex business logic, asynchronous behavior, or external integration.

Hence, based on the **Fibonacci sequence** and the task's moderate complexity, the final estimation is:

### **3 Story Points**