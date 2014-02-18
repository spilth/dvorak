Feature: PDF Generation

  Scenario: Generating a PDF
    Given I create a new deck named "test_game"
    When I generate the deck
    And I list the directories in my project
    Then I should see the directory "output"
    #And I should see the file "output/cards.pdf"

