Feature: Reshuffle

  Background:
    * url deckOfCardsUrl
    * def new_deck = call read('New.feature')
    * def deck_id = new_deck.response.deck_id
    * path '/api/deck/' + deck_id + '/shuffle/'
    * def expected = read('Reshuffle.json')

  Scenario: Shuffle existing card deck
    Given param remaining = true
    When method GET
    Then status 200
    And match response == expected
    And match response.deck_id == deck_id