## EHU-ATJS-20267

### Title: Add "Employer City" Field to the Petition for Space Travel Form

**As** a user,  
**I want** to provide my employer's city in the Petition for Space Travel form  
**So that** authorities can verify the location of my workplace and ensure accurate record-keeping.

### Description:
Currently, the Petition for Space Travel form does not include a field for specifying the city where the employer is located. Adding an **Employer City** field will allow users to provide this information, which is essential for verifying employment details and location.

### Scenario:
1. A new field shall be added to the Petition for Space Travel Form.
2. The field shall be displayed in the **Employment Information** section.
3. The field shall not be mandatory on UI.
4. The field must display its placeholder when empty.
5. Validation errors shall display the message: *"Field must contain valid characters."*
6. After clicking the **Submit** button, the output table must display the submitted data, including the **Employer City** field, if provided.

Estimation using Fibonacci Sequence (Story Points):

Total:3.5 Story Points(Fibonacci)

Understanding the Framework-0.5 SP
Reasoning:
Familiarize yourself with the codebase and folder structure.
Understand the architecture of the Page Object Model (POM).

Writing TestCase - 1 SP
Reasoning:
Understand the functionality described in the user story.
Analyze both UI and functional requirements from the attached form.
Write detailed TestCase
Provide examples of data and expected results

Implementing BDD scenario 
Reasoning:
Create Gherkin-based BDD scenario
Link my scenario to existing step definitions in my codebase

Test Case:EHU-ATJS-20267
Title:Full Validation of "Employer City" Field
Preconditions:The user is on the "Petition for Space Travel" form page

Test Steps:
1.Scroll to the "Employment Information" section
2.Verify that the "Employer City" field is valid
3.Verify that the placeholder text is shown:"Enter city"
4.Leave the field empty and click the Submit button
5.Verify that the form submits successfully without errors
6.Enter invalid input:"@4561!"
7.Verify that you got validation message"Field must contain valid characters" is shown
8.Enter valid input:"New York"
9.Verify that no validation error appears
10.Check that your input exists in output table

Test Data:
Empty:""
Invalid:"@4561!"
Valid:"New York"

Expected Result:
1.The field is present and optional,it contains placeholder.
2.Invalid input triggers error
3.Valid input is accepted
4.Data is shown in the output table after form submission
