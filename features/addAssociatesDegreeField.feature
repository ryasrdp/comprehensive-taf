@form
Feature: EHU-ATJS-20277. Add "Associate's Degree" Field to the Petition for Space Travel Form

As a user,
I want to provide the name of my associate's degree in the Petition for Space Travel form
So that authorities can understand my educational background and qualifications.

  Scenario Outline: Check field "Associate's Degree" with valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Associate's Degree" is present on "Education Information" section
    And Select "<degree_value>" value in "Associate's Degree" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Associate's Degree" on "6. Education Information" section contain value "<degree_value>" on submitted Petition form

    Examples:
      | degree_value           |
      | Computer Science       |
      | Business Administration|
      | Liberal Arts           |

  Scenario: Check field "Associate's Degree" is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Associate's Degree" is present on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check section "Education Information" is present on "Petition to leave planet Earth" form
    Then Check field "Associate's Degree" is present on "Education Information" section
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario Outline: Check field "Associate's Degree" with edge case values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Associate's Degree" is present on "Education Information" section
    And Select "<edge_value>" value in "Associate's Degree" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Associate's Degree" on "6. Education Information" section contain value "<edge_value>" on submitted Petition form

    Examples:
      | edge_value             |
      | A                     |
      | Engineering-Technology |
      | Arts & Sciences       |

  Scenario: Check field "Associate's Degree" accepts empty value
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Associate's Degree" is present on "Education Information" section
    And Select "" value in "Associate's Degree" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form 