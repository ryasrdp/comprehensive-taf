@form
Feature: EHU-ATJS-20276. Add "Previous Employer City" Field to the Petition for Space Travel Form

  As a user,
  I want to provide the city of my previous employer in the Petition for Space Travel form
  So that authorities can verify my employment history and location details if I have worked at my current employer for less than two years.

  Scenario: Check Previous Employer City field conditional visibility on Petition to leave planet Earth
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Check field "Previous Employer City" is absent on "Employment Information" section
    And Uncheck checkbox "I have worked at my current employer for 2+ years" on "Employment Information" section
    Then Check field "Previous Employer City" is present on "Employment Information" section
    And Fill "Previous Employer City" field with "Boston" on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form
    And Check Field "Previous Employer City" on "5. Employment Information" section contain value "Boston" on submitted Petition form

  @skip 
  Scenario: Check Previous Employer City field validation on Petition to leave planet Earth
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Uncheck checkbox "I have worked at my current employer for 2+ years" on "Employment Information" section
    And Fill "Previous Employer City" field with "City123!@#" on "Employment Information" section
    Then Check validation error "Field must contain valid characters." is displayed for "Previous Employer City" field

  Scenario: Submit form without Previous Employer City field (optional field behavior)
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Uncheck checkbox "I have worked at my current employer for 2+ years" on "Employment Information" section
    # Previous Employer City field is visible but not filled (testing optional behavior)
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form
    # Form should submit successfully without Previous Employer City