Feature: New

  Background:
    * url deckOfCardsUrl
    * path '/api/deck/new/'
    * def expected = read('New.json')

  Scenario: Generate a new card deck
    When method GET
    Then status 200
    And match response == expected