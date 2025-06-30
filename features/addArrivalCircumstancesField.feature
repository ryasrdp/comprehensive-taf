@form
Feature: EHU-ATJS-20254. Add "Where, when and under what circumstances did he end up on planet Earth?" Field to the Petition for Space Travel Form

  As a user,
  I want to provide detailed information about where, when, and under what circumstances I arrived on planet Earth,
  So that authorities can better understand my background and the context of my presence on Earth.

  Scenario: Arrival Circumstances field accepts valid input
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Race Information" is present on "Petition to leave planet Earth" form
    And Select "Landed near Warsaw in 2024 during space mission." value in "Where, when and under what circumstances did he end up on planet Earth?" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
    And Check Field "Last Name" contain value "USER" "1" "Last Name" on submitted Petition form
    And Check Field "Circumstances" contain value "Landed near Warsaw in 2024 during space mission." on submitted Petition form

  Scenario: Arrival Circumstances field allows empty value
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Race Information" is present on "Petition to leave planet Earth" form
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Check Field "Circumstances" contain value "" on submitted Petition form
  @skip
  Scenario: Arrival Circumstances field shows error for more than 200 words
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Race Information" is present on "Petition to leave planet Earth" form
    And Select "lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum integer nec odio praesent libero sed cursus ante dapibus diam sed nisi nulla quis sem at nibh elementum imperdiet duis sagittis ipsum praesent mauris fusce nec tellus sed augue semper porta mauris massa vestibulum lacinia arcu eget nulla class aptent taciti sociosqu ad litora torquent per conubia nostra per inceptos himenaeos curabitur sodales ligula in libero sed dignissim lacinia nunc curabitur tortor pellentesque nibh aenean quam in scelerisque sem at dolor mauris blandit aliquam erat volutpat ut wisi enim ad minim veniam quis nostrud exercitation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat dui" value in "Where, when and under what circumstances did he end up on planet Earth?" field on "Race Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    And Click on "Submit" button
    Then Verify tooltip "Field must not exceed 200 words." is displayed for "Where, when and under what circumstances did he end up on planet Earth?" field
