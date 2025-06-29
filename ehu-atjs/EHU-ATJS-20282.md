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

**Final Estimate**: `2 Story Points`  
**Estimation Method**: Fibonacci Sequence  

---

## Estimation Breakdown & Justification 

### 1. Write BDD Scenario in Gherkin Syntax – `0.5 Story Points`
Create a readable **Gherkin** scenario that describes the expected behavior of the new field in the form.  
This includes both positive and negative test cases (e.g., entering invalid characters).

### 2. Automate the BDD Test – `1 Story Point`
Automate the Gherkin scenario using the existing test automation framework.  
This involves setting up selectors, step definitions, and result validation.  
Requires understanding of the DOM structure and use of the **Page Object Model**.

---

## Overall Justification 

The task involves **writing a BDD scenario and automating it**.  
No business logic or UI implementation is required — only testing of existing functionality.

The estimate is based on the **Fibonacci sequence**, considering the **moderate complexity** of the automation effort.

### Final Estimate: `2 Story Points`
