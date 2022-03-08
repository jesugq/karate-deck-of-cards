Feature: Shuffle the cards

  Background:
    * url deckOfCardsUrl
    * path '/api/deck/new/shuffle/'

  Scenario: Shuffle one card deck
    * param deck_count = 1
    * method GET
    * status 200
    * match response == {success: true, deck_id: #string, remaining: #number, shuffled: true}