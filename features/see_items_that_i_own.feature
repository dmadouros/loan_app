Feature: See items that I own

  Scenario: See items that I own
    Given I am logged in
    And I have item Little Giant Ladder
    When I look at items that I own
    Then I should see Little Giant Ladder in my owned items