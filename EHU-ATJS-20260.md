# EHU-ATJS-20260 — Автотест формы «Petition to leave planet Earth»

## Estimation: 5 story points.

- The task includes adding the "Previous Street Address" field, conditional visibility based on residency, non-mandatory status, output table display, and testing various input cases
- Coding (2 points for field, visibility, and output),
- testing (2 points for four scenarios),
- debugging (1 point due to potential validation inconsistencies).
- Similar tasks with multiple scenarios and visibility are 5-8 points; the lack of validation enforcement keeps it at 5.

---

## Checklist

### Positive Cases:
- [ ] Valid Address Input (Description: Enter "123 Main St" in the "Previous Street Address" field.
  Expected Result: The form is submitted successfully, and the address is displayed in the results table.)
- [ ] Empty Field of the "Previous Street Address" (Description: Leave the "Previous Street Address" field empty and submit the form.
  Expected Result: The form is submitted successfully without errors.)

### Негативные кейсы:
- [ ] Input with Special Characters (Description: Enter "123!@#" in the "Previous Street Address" field and submit the form.
  Expected Result: The form is submitted successfully without errors (no check for non-Latin characters).)
- [ ] Input with a String of more than 6k Characters (Description: Enter a string of more than 6k characters in the "Previous Street Address" field and submit the form.
  Expected Result: The form is submitted successfully, provided the limit is not exceeded.)
- [ ] Form Submission Fails with Empty Email Address (Description: Leave the "Email Address" field empty and submit the form.
  Expected Result: The form submission fails, and an error message "Please fill out this field." is displayed for the "Email Address" field.)

---

## BDD-сценарий (Gherkin)

```gherkin
Feature: Fill Petition to leave planet Earth

  Scenario: Successful form submission with Previous Street Address @form
    Given Open web page url "https://ryasrdp.github.io/"
    Given Create "user" "001" using storage
    When Fill Mandatory Petition Form for "user" "001"
    When Select "Rent" in "Residence Type" field
    When Enter "123 Main St" in "Previous Street Address" field
    When Click on "Submit" button
    Then Check success message "Form submitted successfully! Thank you for your application" is displayed
    Then Check Field "Previous Street Address" contain value "123 Main St" on submitted Petition form

  Scenario: Form submission fails with empty Email Address @form
    Given Open web page url "https://ryasrdp.github.io/"
    Given Create "user" "002" using storage
    When Fill Mandatory Petition Form for "user" "002"
    When Insert "" in "Email Address" field
    When Click on "Submit" button
    Then Verify error message "Please fill out this field." is displayed for "Email Address" field

  Scenario: Verify Empty Previous Street Address @form
    Given Open web page url "https://ryasrdp.github.io/"
    Given Create "user" "003" using storage
    When Fill Mandatory Petition Form for "user" "003"
    When Enter "1" in "Years at Current Address" field
    When Enter "6" in "Months at Current Address" field
    When Enter "" in "Previous Street Address" field
    When Click on "Submit" button
    Then Check success message "Form submitted successfully! Thank you for your application" is displayed

  Scenario: Verify Previous Street Address without latin letters @form
    Given Open web page url "https://ryasrdp.github.io/"
    Given Create "user" "004" using storage
    When Fill Mandatory Petition Form for "user" "004"
    When Enter "1" in "Years at Current Address" field
    When Enter "6" in "Months at Current Address" field
    When Enter "улица Максима" in "Previous Street Address" field
    When Click on "Submit" button
    Then Check success message "Form submitted successfully! Thank you for your application" is displayed

  Scenario: Verify Previous Street Address with 300 symbols @form
    Given Open web page url "https://ryasrdp.github.io/"
    Given Create "user" "005" using storage
    When Fill Mandatory Petition Form for "user" "005"
    When Enter "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww" in "Previous Street Address" field
    When Click on "Submit" button
    Then Check success message "Form submitted successfully! Thank you for your application" is displayed