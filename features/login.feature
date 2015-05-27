Feature:
  In order to attract users
  As a site operator
  I wish for users to be able to enter the site

  Scenario:
    Given I visit the home page
    And I hit the "Sign Up" button
    Then I should see "Sign up"
    Given I fill in the form and hit submit
    Then I should see the home page

  Scenario:
    Given I visit the home page
    And I am a signed up user
    Then I should see "Sign in"
    Given I hit the "Log in" button
    And I fill in the sign in form and hit submit
    Then I should see the home page
