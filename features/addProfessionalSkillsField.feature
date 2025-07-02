@form @skills
Feature: EHU-ATJS-20288. Add "Professional Skills" Field in "Skills & Qualifications" section to the Petition for Space Travel Form

  As a user,
  I want to list my professional skills in the Petition for Space Travel form
  So that authorities can evaluate my expertise and qualifications for space travel.

  Scenario Outline: Check field "Professional Skills" with valid <skills_value> values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Professional Skills" is present on "Skills & Qualifications" section
    And Select "<skills_value>" value in "Professional Skills" field on "Skills & Qualifications" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Professional Skills" contain value "<skills_value>" on submitted Petition form

    Examples:
      | skills_value                         |
      | Management, Multi-tasking, Expert SV2 |
      | Robotics & AI                        |
      | Spacecraft pilot                     |
      | -'. &()                              |

@skip
# Temporarily skipped due to known bug: validation for the Professional Skills field is not working 

  Scenario Outline: Check field "Professional Skills" with invalid <invalid_value> values
    Given Open web page url "https://ryasrdp.github.io/"
    And Select "<invalid_value>" value in "Professional Skills" field on "Skills & Qualifications" section
    Then Verify tooltip "Field must contain valid characters." is displayed for "Professional Skills" field

    Examples:
      | invalid_value         |
      | 中文, @!#             |
      | 🚀 Astronaut          |
      | <script>alert(1)</script> |

  Scenario: Check field "Professional Skills" accepts empty value
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Professional Skills" is present on "Skills & Qualifications" section
    And Select "" value in "Professional Skills" field on "Skills & Qualifications" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form 

  Scenario Outline: Check field "Professional Skills" handles multi-line input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Professional Skills" is present on "Skills & Qualifications" section
    And Select "<skills_multiline_value>" value in "Professional Skills" field on "Skills & Qualifications" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Professional Skills" contain value "<skills_multiline_value>" on submitted Petition form

    Examples:
      | skills_multiline_value                  |
      | Management\nRobotics & AI\nSpacecraft pilot |