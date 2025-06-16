@form
Feature: EHU-ATJS-20296. Add "Universe" Field to the Previous Travel Information Section in the Petition for Space Travel Form

  As a user,
  I want to provide the name of the universe I previously traveled to in the Petition for Space Travel form
  So that authorities can document my intergalactic travel history and understand the scope of my past journeys.

    Scenario: Check Universe field on Petition to leave planet Earth
      Given Open web page url "https://ryasrdp.github.io/"
        And Create "USER" "1" using storage
      Then Check section "Personal Information" is present on "Petition to leave planet Earth" form
        And Select "Marvel" value in "Universe" Date field
        And Fill Mandatory Petition Form for "USER" "1"
        And Click on "Submit" button
      Then Check Field "First Name" contain value "USER" "1" "First Name" on submitted Petition form
        And Check Field "Universe" contain value "Marvel" on submitted Petition form
