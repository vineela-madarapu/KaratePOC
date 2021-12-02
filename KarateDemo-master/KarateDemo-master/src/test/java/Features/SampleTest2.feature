@tag
Feature: Title of your feature

  Background:
    * url 'https://reqres.in'
    * header Accept = 'application/json'

  @testme
  Scenario: List all countries
    Given path '/api/users'
    And param page = 2
    When method get
    Then status 200
#    * def res = response.data[0].email
#    * print 'Rest--' +res
#    * match res == 'michael.lawson@reqres.in'