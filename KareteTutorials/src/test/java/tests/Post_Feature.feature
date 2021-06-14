Feature: Post API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response.json")

  Scenario: Post Demo1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Prasad","job": "leader"}
    When method POST
    Then status 201
    And print response

  #Post with background
  Scenario: Post with background Demo 2
    Given path '/users'
    And request {"name": "Prasad","job": "leader"}
    When method POST
    Then status 201
    And print response

  #Post with Assertions
  Scenario: Post with background Demo 3
    Given path '/users'
    And request {"name": "Prasad","job": "leader"}
    When method POST
    Then status 201
    And match response =={"createdAt": "#ignore","name": "Prasad","id": "#string","job": "leader"}
    And print response

  #Read Response from file
  Scenario: Post with background Demo 4
    Given path '/users'
    And request {"name": "Prasad","job": "leader"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  #Read Request from file
  Scenario: Post with background Demo 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'/src/test/java/data/request.json'
    And print filePath
    And def requestBody = filePath
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response
    
     #Read Request from file and request values
  Scenario: Post with background Demo 6
    Given path '/users'
    And def requestBody = read("request.json")
    And set requestBody.job = 'Teacher'
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response
