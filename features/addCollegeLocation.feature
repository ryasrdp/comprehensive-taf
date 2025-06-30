@form
Feature: EHU-ATJS-20283. Add "College Location" field to the Petition for Space Travel Form

  As a user,
  I want to indicate the location of my college or university,
  So that the authorities can verify my educational background more accurately.

  Background:
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Education Information" is present on "Petition to leave planet Earth" form

  Scenario: College Location field accepts valid input
    Then Check field "College Location (City, State/Country)" is present on "Education Information" section
    And Select "Cambridge, MA, USA" value in "College Location (City, State/Country)" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form
    And Check Field "College Location" contain value "Cambridge, MA, USA" on submitted Petition form

  Scenario: College Location field allows empty value
    Then Check field "College Location (City, State/Country)" is present on "Education Information" section
    And Select "" value in "College Location (City, State/Country)" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "College Location" contain value "" on submitted Petition form

  Scenario Outline: College Location field accepts edge case values
    Then Check field "College Location (City, State/Country)" is present on "Education Information" section
    And Select "<value>" value in "College Location (City, State/Country)" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "College Location" contain value "<value>" on submitted Petition form

    Examples:
      | value                      |
      | A                          |
      | Zurich, CH (ETH)          |
      | 123 Moon Base 7           |

@skip
  Scenario Outline: College Location field shows error for invalid input
    Then Check field "College Location (City, State/Country)" is present on "Education Information" section
    And Select "<invalid>" value in "College Location (City, State/Country)" field on "Education Information" section
    And Click on "Submit" button
    Then Verify tooltip "Field must contain valid characters" is displayed for "College Location (City, State/Country)" field

    Examples:
      | invalid     |
      | @@@@        |
      | 🚀🔥        |
      | Литва      |
      | <>*%$#      |