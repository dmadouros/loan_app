Feature: Authentication

  Scenario: Logging in
    Given I have an account
    When I login
    Then I should see my dashboard

  Scenario: Logging out
    Given I have an account
    And I am logged in
    When I logout
    Then I should be asked for my authentication credentials