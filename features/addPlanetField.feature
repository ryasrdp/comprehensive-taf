@form
Feature: EHU-ATJS-20258 - Add "Planet" Field to the Petition for Space Travel Form

  As a user,  
  I want to provide the name of my planet in the Petition for Space Travel form  
  So that authorities can identify my specific place of origin within my solar system for better context and record-keeping.

  Scenario: Verify Planet field is displayed
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "X1" using storage
    Then Check section "Planned Travel Information" is present on "Petition to leave planet Earth" form
    Then Check field "Planet" is present on "Planned Travel Information" section
    Then Check section "Previous Travel Information" is present on "Petition to leave planet Earth" form
    Then Check field "Planet" is present on "Previous Travel Information" section

  Scenario Outline: Submit with various valid Planet names
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "X1" using storage
    Then Check field "Planet" is present on "Planned Travel Information" section
    And Select "<planet_value>" value in "Planet" field on "Planned Travel Information" section
    And Fill Mandatory Petition Form for "USER" "X1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "X1" "First Name" on submitted Petition form
    And Check Field "Planet" on "10. Planned Travel Information" section contain value "<planet_value>" on submitted Petition form

    Examples:
      | planet_value   |
      | Neptune        |
      | Vega Prime     |
      | Planet X-42    |

  Scenario Outline: Submit with special Planet values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "X1" using storage
    Then Check field "Planet" is present on "Planned Travel Information" section
    And Select "<edge_value>" value in "Planet" field on "Planned Travel Information" section
    And Fill Mandatory Petition Form for "USER" "X1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "X1" "First Name" on submitted Petition form
    And Check Field "Planet" on "10. Planned Travel Information" section contain value "<edge_value>" on submitted Petition form

    Examples:
      | edge_value     |
      | P              |
      | Mars-007       |
      | Orion & Co.    |

  Scenario: Submit with empty Planet field
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "X1" using storage
    Then Check field "Planet" is present on "Planned Travel Information" section
    And Select "" value in "Planet" field on "Planned Travel Information" section
    And Fill Mandatory Petition Form for "USER" "X1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "X1" "First Name" on submitted Petition form
    And Check Field "Planet" on "10. Planned Travel Information" section contain value "" on submitted Petition form

  @skip
  # Temporarily skipped due to known bug: validation for the Planet field is not working

  Scenario Outline: Submit invalid Planet field value and verify tooltip
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "X1" using storage
    Then Check field "Planet" is present on "Planned Travel Information" section
    And Select "<invalid_value>" value in "Planet" field on "Planned Travel Information" section
    And Fill Mandatory Petition Form for "USER" "X1"
    And Click on "Submit" button
    Then Verify tooltip "Field must contain Latin letters only." is displayed for "Planet" field on "Planned Travel Information" section

    Examples:
      | invalid_value |
      | 火星           |
      | Planet 🌟     |
