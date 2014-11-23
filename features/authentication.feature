Feature: Authentication - we need to keep our users data safe

  Scenario: Requires login to see items I own page
    Given I have an account with the following details:
      | email    | test_user@example.com |
      | password | password |
    When I bypass login and go to item list
    Then System takes me to log in page