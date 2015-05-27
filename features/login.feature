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
