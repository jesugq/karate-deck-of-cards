Feature: Shuffle

  Background:
    * url deckOfCardsUrl
    * path '/api/deck/new/shuffle/'
    * def expected = read('Shuffle.json')

  Scenario: Shuffle one card deck
    Given param deck_count = 1
    When method GET
    Then status 200
    Then match response == expected