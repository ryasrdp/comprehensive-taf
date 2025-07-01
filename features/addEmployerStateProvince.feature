@labubu

Feature: EHU-ATJS-20268. Add "Employer State/Province" Field in "Employment Information" section to the Petition for Space Travel Form

  Scenario: Field is visible
    Given Open web page url "https://ryasrdp.github.io/"
    Then Check field "Employer State/Province" is present on "Employment Information" section

  Scenario Outline: Valid values are accepted
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Employer State/Province" is present on "Employment Information" section
    And Select "<valid_value>" value in "Employer State/Province" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    # And Check Field "Employer State/Province" on "3. Employment Information" section contain value "<valid_value>" on submitted Petition form

    Examples:
      | valid_value   |
      | California    |
      | St. John's    |

  Scenario: Field is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "Employer State/Province" is present on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario Outline: Invalid values are rejected
    Given Open web page url "https://ryasrdp.github.io/"
    And Select "<invalid_value>" value in "Employer State/Province" field on "Employment Information" section
    And Click on "Submit" button
    # Then Check validation error "Field must contain valid characters." is displayed for "Employer State/Province" field

    Examples:
      | invalid_value |
      | Florida!!!    |
      | Texas 🚀      |