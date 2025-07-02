@from
Feature: EHU-ATJS-20282. Add "College University Name" Field to the Petition for Space Travel Form

  As a user,
  I want to enter the name of my college or university in the Petition for Space Travel form
  So that authorities can verify my educational background accurately.

  Scenario: Check College/University Name field visibility on Petition form
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "2" using storage
    Then Check section "Education Information" is present on "Petition to leave planet Earth" form
    Then Check field "College/University Name" is present on "Education Information" section



  Scenario Outline: Check College/University Name field with valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "2" using storage
    Then Check field "College/University Name" is present on "Education Information" section
   When Fill "College/University Name" field with "<college_name>" on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "2"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "2" "First Name" on submitted Petition form
    And Check Field "College University Name" on "6. Education Information" section contain value "<college_name>" on submitted Petition form

    Examples:
      | college_name                 |
      | Stellar Academy of Science   |
      | Intergalactic University     |
      | Space Tech Institute         |


  Scenario: Check College/University Name field is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "2" using storage
    Then Check field "College/University Name" is present on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "2"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "2" "First Name" on submitted Petition form
    And Check Field "College University Name" on "6. Education Information" section contain value "" on submitted Petition form

  Scenario Outline: Check College/University Name field with edge case values
  Given Open web page url "https://ryasrdp.github.io/"
  And Create "USER" "2" using storage
  Then Check field "College/University Name" is present on "Education Information" section
  When Fill "College/University Name" field with "<edge_value>" on "Education Information" section
  And Fill Mandatory Petition Form for "USER" "2"
  And Click on "Submit" button
  And Check Field "College University Name" on "6. Education Information" section contain value "<edge_value>" on submitted Petition form



    Examples:
      | edge_value                |
      | A                         |
      | Stellar Academy #10       |
      | Space & Science Institute |

@skip
  Scenario Outline: Validation errors shall display the message
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "2" using storage
    Then Check field "College/University Name" is present on "Education Information" section
    And Select "<invalid_value>" value in "College/University Name" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "2"
    And Click on "Submit" button
    Then Verify tooltip "Field must contain valid characters." is displayed for "College/University Name" field on "Education Information" section

    Examples:
      | invalid_value  |
      | @!#%           |
      | @@@            |




