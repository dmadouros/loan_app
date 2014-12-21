Feature: Protect my data

  Scenario: Requires authentication to see items that I own
    Given I have an account
    And I am not logged in
    When I try to look at items that I own
    Then I should be asked for my authentication credentials