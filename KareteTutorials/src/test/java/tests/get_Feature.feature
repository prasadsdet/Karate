Feature: 

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  #Sample get Request
  Scenario: Get Demo 1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #Sample get with ackground
  Scenario: Get Demo 2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  #Sample get with Path and parameters
  Scenario: Get Demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  #Sample get with Assertions
  Scenario: Get Demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And match $.data[3].name != null
    And assert response.data.length == 6
    And match $.data[3].id == 10
    And match $.data[3].name == 'mimosa'
