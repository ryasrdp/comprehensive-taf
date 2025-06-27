@form
Feature: EHU-ATJS-20282. Add "College University Name" Field to the Petition for Space Travel Form

  As a user,
  I want to enter the name of my college or university in the Petition for Space Travel form
  So that authorities can verify my educational background accurately.

  Scenario: Check College University Name field on Petition to leave planet Earth
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "2" using storage
    Then Check section "Education Information" is present on "Petition to leave planet Earth" form
    And Fill "College/University Name" field on "Education Information" section with value "Stellar Academy of Science"
    And Fill Mandatory Petition Form for "USER" "2"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "2" "First Name" on submitted Petition form
    And Check Field "Last Name" contain value "USER" "2" "Last Name" on submitted Petition form
    And Check Field "College University Name" on "Education Information" section contain value "Stellar Academy of Science" on submitted Petition form




