Feature: Authentication

  Scenario: Logging in

    Given user:
      | email            | password |
      | test@example.com | password |
    When user "test.example.com" logs in
    Then system takes them to landing page

  Scenario: Logging out

    Given user:
      | email            | password |
      | test@example.com | password |
    And user "test.example.com" is logged in
    When user "test.example.com" logs out
    Then system takes them to log in page