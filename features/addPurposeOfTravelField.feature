@form
Feature: EHU-ATJS-20294. Add "Purpose of Travel" Field to the Petition for Space Travel Form

  As a user,
  I want to specify the purpose of my travel in the Petition for Space Travel form.
  So that authorities can understand the reason for my journey and ensure proper documentation and approvals.

  Scenario: Check Purpose of Travel field on Petition to leave planet Earth
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Planned Travel Information" is present on "Petition to leave planet Earth" form
    And Select "Na zakupy" value in "Purpose of Travel" field on "Planned Travel Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form
    And Check Field "Purpose of Travel" on "10. Planned Travel Information" section contain value "Na zakupy" on submitted Petition form
  @skip
  Scenario: Check Purpose of Travel field on Petition to leave planet Earth. Negative Scenario
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Planned Travel Information" is present on "Petition to leave planet Earth" form
    And Select "住所" value in "Purpose of Travel" field on "Planned Travel Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Verify tooltip "Field must contain valid characters." is displayed for "Purpose of Travel" field
