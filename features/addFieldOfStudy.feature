@form

Feature: EHU-ATJS-20285. Add "Major/Field of Study" Field in "Education Information" section to the Petition for Space Travel Form

As a user,
I want to provide my major or field of study in the Petition for Space Travel form
So that authorities can understand my academic specialization and evaluate my educational background.

  Scenario: Check field "Major/Field of Study" is present on "Education Information" section
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Education Information" is present on "Petition to leave planet Earth" form
    Then Check field "Major/Field of Study" is present on "Education Information" section

  Scenario Outline: Check field "Major/Field of Study" with valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Major/Field of Study" is present on "Education Information" section
    And Select "<major_field_value>" value in "Major/Field of Study" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Major Field of Study" on "6. Education Information" section contain value "<major_field_value>" on submitted Petition form

    Examples:
      | major_field_value  |
      | Physics            |
      | Engineering        |
      | Literature         |

  Scenario: Check field "Major/Field of Study" is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Major/Field of Study" is present on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario Outline: Check field "Major/Field of Study" with edge case values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Major/Field of Study" is present on "Education Information" section
    And Select "<edge_value>" value in "Major/Field of Study" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Major Field of Study" on "6. Education Information" section contain value "<edge_value>" on submitted Petition form

    Examples:
      | edge_value             |
      | A                     |
      | Design-42             |
      | Quantum & Society     |

  Scenario: Check field "Major/Field of Study" accepts empty value
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Major/Field of Study" is present on "Education Information" section
    And Select "" value in "Major/Field of Study" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form