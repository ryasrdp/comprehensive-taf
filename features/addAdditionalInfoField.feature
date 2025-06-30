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
    Then Check Field "Additional Info" on "3. Additional Information" section contain value "<input_text>" on submitted Petition form

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

  # NOTE:
  # There is no test for validation errors on input exceeding 200 words
  # because the application does not display any validation error 
  # when the "What else would you like to tell us about yourself?" field exceeds 200 words.

  Scenario Outline: Accept input with exactly 200 words
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check field "* What else would you like to tell us about yourself??" is present on "Race Information" section
    And Select "<exact_200>" value in "* What else would you like to tell us about yourself??" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form

    Examples:
      | exact_200 |
      | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? |

  Scenario: Submitted custom info appears in result table
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    And Select "This is my personal space journey story." value in "* What else would you like to tell us about yourself??" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check section "Race Information" is present on "Petition to leave planet Earth" form
