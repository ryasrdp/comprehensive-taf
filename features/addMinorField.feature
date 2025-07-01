@form
Feature: Petition for Space Travel Form - Minor Field

As a user,  
I want to provide my minor field of study in the Petition for Space Travel form
So that authorities can understand my additional academic focus and evaluate my educational background comprehensively.
  
  Scenario Outline: Check field "Minor (if applicable)" with valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Minor (if applicable)" is present on "Education Information" section
    And Select "<minor_field_value>" value in "Minor (if applicable)" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Minor" on "6. Education Information" section contain value "<minor_field_value>" on submitted Petition form

    Examples:
      | minor_field_value |
      | Astrophysics      |
      | Linguistics       |
      | Philosophy        |
    
  Scenario: Check field "Minor (if applicable)" is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Minor (if applicable)" is present on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check section "Education Information" is present on "Petition to leave planet Earth" form
    Then Check field "Minor (if applicable)" is present on "Education Information" section
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
  
  Scenario Outline: Check field "Minor (if applicable)" with edge case values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Minor (if applicable)" is present on "Education Information" section
    And Select "<edge_value>" value in "Minor (if applicable)" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Minor" on "6. Education Information" section contain value "<edge_value>" on submitted Petition form

    Examples:
      | edge_value              |
      | A                       |
      | Design-42               |
      | Bio-Tech & Innovation   |
      | Artificial Intelligence |

  Scenario: Check field "Minor (if applicable)" accepts empty value
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Minor (if applicable)" is present on "Education Information" section
    And Select "" value in "Minor (if applicable)" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario Outline: Check field "Minor (if applicable)" with invalid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Minor (if applicable)" is present on "Education Information" section
    And Select "<invalid_value>" value in "Minor (if applicable)" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Minor" on "6. Education Information" section contain value "<invalid_value>" on submitted Petition form

    Examples:
      | invalid_value |
      | Astro@!学     |
      | Physics 🥼🧪 |
