@Issue
Feature: Data driven tests

#  Scenario: Adding multiple items to cart
#    Given url 'https://qa2-api.fishersci.com/fishersci-cart/addtocart?language=en&countryCode=US'
#    And request { partNumber: '06666C', quantity: '5', uom='' }
#    When method post
#    Then status 200

  Scenario: get[0] is not working in intellij
    * def response = { "items": { '41651625424': { itemCore: { partNumber: '1234567', productTitle: 'Karate API Testing' }}}}
    * def itemCore = get[0] response.items
    * print 'itemcore --'+itemCore
#    * match itemCore == { partNumber: '1234567', productTitle: 'Karate API Testing' }