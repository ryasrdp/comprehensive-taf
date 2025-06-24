@form
Feature: EHU-ATJS-20671. Fill Petition to leave planet Earth

  As a user,
  I want to fill in all mandatory fields in the form,
  I can successfully submit the form and verify that the data was saved correctly.

    Scenario: Fill mandatory field form
      Given Open web page url "https://ryasrdp.github.io/"
        And Create "USER" "1" using storage
      Then Check section "Personal Information" is present on "Petition to leave planet Earth" form
      When Fill Mandatory Petition Form for "USER" "1"
        And Click on "Submit" button
      Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
        And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form

    Scenario: Check mandatory fields on Petition to leave planet Earth
      Given Open web page url "https://ryasrdp.github.io/"
        And Create "USER" "1" using storage {"GraduateSchoolName": "Sausio 13"}
      Then Check section "Personal Information" is present on "Petition to leave planet Earth" form
      When Select "USER" "1" "First Name" value in "First Name" field
        And Click on "Submit" button
      Then Verify tooltip "Please fill out this field." is displayed for "Last Name" field
      When Select "USER" "1" "Last Name" value in "Last Name" field
        And Select "USER" "1" "GraduateSchoolName" value in "Graduate School Name" field
        And Select "2021-01-01" value in "Employment Start Date" Date field
        And Select "Solar system E" value in "Solar system" field on "Previous Travel Information" section
        And Select "Solar system D" value in "Solar system" field on "Planned Travel Information" section
        And Fill Mandatory Petition Form for "USER" "1"
        And Click on "Submit" button
      Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
        And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form
        And Check Field "Graduate School Name" contain value "Sausio 13" on submitted Petition form
        And Check Field "Employment Start Date" contain value "2021-01-01" on submitted Petition form
        And Check Field "Solar System" on "11. Previous Travel Information" section contain value "Solar system E" on submitted Petition form
        And Check Field "Solar System" on "10. Planned Travel Information" section contain value "Solar system D" on submitted Petition form
