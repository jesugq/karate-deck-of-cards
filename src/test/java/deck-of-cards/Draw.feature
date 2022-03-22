Feature: Draw

  Background:
    * url deckOfCardsUrl
    * def new_deck = call read('New.feature')
    * def deck_id = new_deck.response.deck_id
    * path '/api/deck/' + deck_id + '/draw/'
    * def expected = read('Draw.json')

  Scenario: Draw one card from the deck
    Given param count = 1
    When method GET
    Then status 200
    And match response == expected
    And match response.deck_id == deck_id
