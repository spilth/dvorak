Feature: New Deck

  Scenario: Create a new deck
    Given I create a new deck named "test_game"
    When I list the directories in my project
    Then I should see the directory "cards"
    And I should see the file "rules.md"
    And I should see the file "cards/things.yml"
    And I should see the file "cards/actions.yml"


