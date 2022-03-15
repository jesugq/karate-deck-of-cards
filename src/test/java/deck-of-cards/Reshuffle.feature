Feature: Reshuffle

  Background:
    * url deckOfCardsUrl
    * def shuffle = call read('Shuffle.feature')
    * def deck_id = shuffle.response.deck_id
    * path '/api/deck/' + deck_id + '/shuffle/'
    * def expected = read('Shuffle.json')

  Scenario: Shuffle existing card deck
    Given param remaining = true
    When method GET
    Then status 200
    And match response == expected
    And match response.deck_id == deck_id