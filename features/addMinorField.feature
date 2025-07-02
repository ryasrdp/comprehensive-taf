@form
Feature: Petition for Space Travel Form - Minor Field

As a user,  
I want to provide my minor field of study in the Petition for Space Travel form
So that authorities can understand my additional academic focus and evaluate my educational background comprehensively.
  
  Scenario: Check "Minor (if applicable)" field visibility
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Education Information" is present on "Petition to leave planet Earth" form
    Then Check field "Minor (if applicable)" is present on "Education Information" section

  Scenario Outline: Check field "Minor (if applicable)" field with <minor_field_value> values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
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
    
  Scenario Outline: Check field "Minor (if applicable)" with <edge_value> values
    And Create "USER" "1" using storage
    And Select "<edge_value>" value in "Minor (if applicable)" field on "Education Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Minor" on "6. Education Information" section contain value "<edge_value>" on submitted Petition form

    Examples:
      | edge_value                  |
      | A                           |
      | Design-42                   |
      | Bio-Tech & Innovation       |
      | Artificial Intelligence     |
      | Computer Science (AI M.Sc.) |


  @skip
  Scenario Outline: Check field "Minor (if applicable)" with <invalid_value> values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Select "<invalid_value>" value in "Minor (if applicable)" field on "Education Information" section
    Then Verify tooltip "Field must contain valid characters." is displayed for "Minor (if applicable)" field

    Examples:
      | invalid_value  |
      | 🎈🎈🎈         |
      | Office@123 #HQ |
      | 住学所          |
      | ★☆★☆         |
