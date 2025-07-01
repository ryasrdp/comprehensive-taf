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

  Scenario: Verify Previous Street Address with more than 300 symbols @form
    Given Open web page url "https://ryasrdp.github.io/"
    Given Create "user" "005" using storage
    When Fill Mandatory Petition Form for "user" "005"
    When Enter "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww" in "Previous Street Address" field
    When Click on "Submit" button
    Then Check success message "Form submitted successfully! Thank you for your application" is displayed