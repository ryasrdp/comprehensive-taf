@form
Feature: EHU-ATJS-20277. Test "Associate's Degree" Option in Highest Level of Education Dropdown

As a user,
I want to select "Associate's Degree" in the "Highest Level of Education" dropdown
So that authorities can understand my educational background and qualifications.

  Scenario: Check "Associate's Degree" option can be selected from dropdown
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Highest Level of Education" is present on "Education Information" section
    And Select "Associate's Degree" value in "Highest Level of Education" dropdown
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario: Check Highest Level of Education dropdown contains all expected values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Highest Level of Education" is present on "Education Information" section

  Scenario Outline: Check different education levels including Associate's Degree
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Highest Level of Education" is present on "Education Information" section
    And Select "<education_level>" value in "Highest Level of Education" dropdown
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

    Examples:
      | education_level      |
      | Associate's Degree   |
      | Bachelor's Degree    |
      | Master's Degree      |

  Scenario: Check Highest Level of Education field is mandatory
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Highest Level of Education" is present on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form 