@TestReqRes
Feature: Feedback actions API feature

Scenario: Create User and verify details of created user
   Given call read('classpath:features/api/reqres/HelperReqRes.feature@name=CreateUser')
   Then match response contains {"createdAt":'#notnull',"name":'morpheus',"job":'leader',"id":'#notnull'}

Scenario Outline: Update user and verify user details.
    Given url environment.ReqRes.reqResBaseUrl
    And header Content-Type = "application/json"
    Given path '/api/users'
    And request {"name": "<nameValues>","job": "<jobValue>"}
    When method put 
    Then status <expectedStatusCode>
    Then print response
    Then match response contains <expResponse>
    
    Examples:
    |nameValues |jobValue |expectedStatusCode |expResponse                                             |
    |Sample1    |leader   |200                |{"updatedAt":'#notnull',"name":'Sample1',"job":'leader'}|
    |SAMPLE     |leader   |200                |{"updatedAt":'#notnull',"name":'SAMPLE',"job":'leader'} |
    |sample     |leader   |200                |{"updatedAt":'#notnull',"name":'sample',"job":'leader'} |
    |123456     |tester   |200                |{"updatedAt":'#notnull',"name":'123456',"job":'tester'} |
    |           |tester   |200                |{"updatedAt":'#notnull',"name":'',"job":'tester'}       |

Scenario: Register Successful
Given call read('classpath:features/api/reqres/HelperReqRes.feature@name=RegisterSuccessful')
Then match response contains {"id":'#notnull',"token":'#notnull'}

Scenario: Register unsuccessful
Given call read('classpath:features/api/reqres/HelperReqRes.feature@name=RegisterUnsuccessful')
Then match response contains {"error": "Missing password"}