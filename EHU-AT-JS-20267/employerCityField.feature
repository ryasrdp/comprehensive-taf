Feature: Employer City field validation in Petition Form

Scenario:Validate Employer City input and submission
  Given the user is on the Petition for Space Travel form

  When they scroll to the Employment Information section
  Then the "Employer City" field is visible with placeholder "Enter city"

  When they leave the Employer City field empty and click Submit
  Then the form is submitted successfully

  When they enter "@4561!" in the Employer City field and click Submit
  Then a validation message "Field must contain valid characters" is shown

  When they enter "New York" in the Employer City field and click Submit
  Then the data is displayed in the output table
