Feature: EHU-ATJS-20256. Add "* What else would you like to tell us about yourself??" field in "Race Information" section to the Petition for Space Travel Form

  As a user,
  I want to provide additional information about myself in the Petition for Space Travel form
  So that authorities can gain deeper insights into my background

  Scenario: Check custom info field visibility and placeholder
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Race Information" is present on "Petition to leave planet Earth" form
    Then Check field "* What else would you like to tell us about yourself??" is present on "Race Information" section

  Scenario: Check custom info field is not mandatory
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "* What else would you like to tell us about yourself??" is present on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario Outline: Check custom info field accepts valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "* What else would you like to tell us about yourself??" is present on "Race Information" section
    And Select "<input_text>" value in "* What else would you like to tell us about yourself??" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check section "Race Information" is present on "Petition to leave planet Earth" form

    Examples:
      | input_text                                                                                      |
      | I love exploring stars and black holes.                                                         |
      | Hello from another world! This input contains emojis & special symbols. —Your Future Traveler   |

  Scenario: Check custom info field accepts empty value
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "* What else would you like to tell us about yourself??" is present on "Race Information" section
    And Select "" value in "* What else would you like to tell us about yourself??" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

  Scenario: Reject input over 200 words with validation error
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "* What else would you like to tell us about yourself??" is present on "Race Information" section
    And Select "<long_text>" value in "* What else would you like to tell us about yourself??" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check section "Race Information" is present on "Petition to leave planet Earth" form

    Examples:
      | long_text                                                                |
      | Lorem ipsum dolor sit amet, consectetur adipiscing elit... [201+ words]  |

  Scenario: Accept input with exactly 200 words
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "* What else would you like to tell us about yourself??" is present on "Race Information" section
    And Select "<exact_200>" value in "* What else would you like to tell us about yourself??" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

    Examples:
      | exact_200 |
      | Lorem ipsum ...  (exact_200)|

  Scenario: Submitted custom info appears in result table
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Select "This is my personal space journey story." value in "* What else would you like to tell us about yourself??" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check section "Race Information" is present on "Petition to leave planet Earth" form
