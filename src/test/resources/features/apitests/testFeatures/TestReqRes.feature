Feature: Feedback actions API feature 

Background: 
    Given url "https://reqres.in/" 
    And header Content-Type = "application/json" 
  
#@name=GetListOfUsers
#Scenario: Get user details and verify basic details
#    Given path '/api/users'
#    And param page = 2
#    When method GET 
#    Then status 200
#    Then match response contains {"page":2,"per_page":6,"total":12,"total_pages":2,}
#    When def dataResponse = $response.data
#    Then match each dataResponse contains {"last_name":'#notnull',"id":'#notnull',"avatar":'#notnull',"first_name":'#notnull',"email":'#notnull'}
#
#@name=GetSingleUserDetails
#Scenario: Get single user details and verify the details
#    Given path '/api/users/2'
#    When method GET 
#    Then status 200
#    Then match $response.data contains {"id":2,"email":'janet.weaver@reqres.in',"first_name":'Janet',"last_name":'Weaver',"avatar":'#notnull'}
#
#@name=CreateUser
#Scenario: Create User
#    Given path '/api/users'
#    And request {"name": "morpheus","job": "leader"}
#    When method post 
#    Then status 201
#    Then print response
#    Then match response contains {"createdAt":'#notnull',"name":'morpheus',"job":'leader',"id":'#notnull'}
#    
# Scenario Outline: Update user
#    Given path '/api/users'
#    And request {"name": "<nameValues>","job": "<jobValue>"}
#    When method put 
#    Then status <expectedStatusCode>
#    Then print response
#    Then match response contains <expResponse>
#    
#    Examples:
#    |nameValues |jobValue |expectedStatusCode |expResponse                                             |
#    |Sample1    |leader   |200                |{"updatedAt":'#notnull',"name":'Sample1',"job":'leader'}|
#    |SAMPLE     |leader   |200                |{"updatedAt":'#notnull',"name":'SAMPLE',"job":'leader'} |
#    |sample     |leader   |200                |{"updatedAt":'#notnull',"name":'sample',"job":'leader'} |
#    |123456     |tester   |200                |{"updatedAt":'#notnull',"name":'123456',"job":'tester'} |
#    |             |tester   |200                |{"updatedAt":'#notnull',"name":'',"job":'tester'} |
#
#Scenario: Register Successful
#Given path '/api/register'
#And request {"email":"eve.holt@reqres.in","password": "pistol"}
#When method post
#Then status 200
#Then match response contains {"id":'#notnull',"token":'#notnull'}

Scenario: Register unsuccessful
Given path '/api/login'
And request {"email":"eve.holt@reqres.in"}
When method post
Then status 400
Then match response contains {"error": "Missing password"}