Feature:
  In order to attract users
  As a site operator
  I wish for users to be able to enter the site

  Scenario:
    Given I visit the home page
    And I hit the "Sign Up" button
    Then I should see "Sign up"

  Scenario:
    Given I am a signed up user
    And I visit the home page
    And I hit the "Sign In" button
    Then I should see "Sign up"
