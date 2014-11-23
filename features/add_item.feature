Feature: Add item
  Scenario: Item owned by me
    Given I am logged in
    And I am on my owned items list page
    When I add an item with the following details:
      | name | BDD in Action |
    Then I am shown BDD in Action in my owned items list

  Scenario: Invalid parameters
    Given I am logged in
    And I am on my owned items list page
    When I add an item with invalid details
    Then I am shown an error