Feature: Draw

  Background:
    * url deckOfCardsUrl
    * def shuffle = call read('Shuffle.feature')
    * def deck_id = shuffle.response.deck_id
    * path '/api/deck/' + deck_id + '/draw/'
    * def expected = read('Draw.json')

  Scenario: Draw one card from the deck
    Given param count = 1
    When method GET
    Then status 200
    Then match response == expected
    Then match response.deck_id == deck_id
