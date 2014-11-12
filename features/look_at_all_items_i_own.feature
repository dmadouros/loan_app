Feature: Look at all items I own

  Scenario: Look at all items I own
    Given I am logged in
    And I have item Little Giant Ladder
    When I navigate to item list
    Then I am shown Little Giant Ladder in my owned items list