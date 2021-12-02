@FR
Feature: Cart Microservies validations

#  Scenario: generate random session id
#
#
#    * def random_string =
#    """
#    function(s) {
#      var text = "";
#      var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
#      for (var i = 0; i < s; i++)
#        text += possible.charAt(Math.floor(Math.random() * possible.length));
#      return text;
#
#
#    }
#    """
#    * def sessionId =  random_string(10)
#    * print 'random_string is '+sessionId


  Scenario: Add an item to cart

* print 'baseurl --'+baseURL

    Given url 'https://qa2-api.fishersci.com/fishersci-cart/addtocart?language=en&countryCode=US'
#    Given url baseURL

    * def item =
"""
{
    "addToCartFrom":"Product page",
    "itemList":[
        {"partNumber":"02681154","quantity":1,"uom":""}

      ]

}
"""
    And request item
    When method post
    Then status 200
    And match response.cartLineItems == 1
    And match response.cartletItems[*].partNumber == ["02-681-154"]

    * def cartID = response.cartId
    * print 'cartId is: ' + cartID


    Given url 'https://qa2-api.fishersci.com/fishersci-cart/cartlet?language=en&countryCode=US&cartId='+cartID
    When method get
    Then status 200
    And match response.cartletItems[*].partNumber == ["02-681-154"]
    And match response.cartId == cartID

    Given url 'https://qa2-api.fishersci.com/fishersci-cart/viewcart?language=en&countryCode=US&cartId='+cartID
    When method get
    Then status 200
    * print 'Response ---'+response
#    * def orderItemID = response.lineItems
    * def orderItemID = get[0] response..lineItems
    * print 'orderItemID is: ' + orderItemID




