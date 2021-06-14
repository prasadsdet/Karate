Feature:  PUT API Demo

Scenario: Testing PUT Requests
Given url 'https://reqres.in/api/users/2'
And request {"name": "NUNNA","job": "zion resident"}
When method put
Then status 200
And print response

