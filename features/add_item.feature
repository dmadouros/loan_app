Feature: Add item
  Scenario: Item owned by me
    Given I am logged in
    And I am looking at my owned items
    When I add an item with the following details:
      | name | BDD in Action |
    Then I should see BDD in Action in my owned items

  Scenario: Item with invalid parameters
    Given I am logged in
    And I am looking at my owned items
    When I add an item with invalid details
    Then I should see an error