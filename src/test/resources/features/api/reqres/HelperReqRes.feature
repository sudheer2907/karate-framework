Feature: Feedback actions API feature

Background: 
    Given url environment.ReqRes.reqResBaseUrl
    And header Content-Type = "application/json" 
    * configure ssl = true

@name=GetListOfUsers
Scenario: Get List of users details and verify basic details
    Given path '/api/users'
    And param page = 2
    When method GET 
    Then status 200

@name=GetSingleUserDetails
Scenario: Get single user details and verify the details
    Given path '/api/users/2'
    When method GET 
    Then status 200
    @name=CreateUser

    Scenario: Create User
        Given path '/api/users'
        And request {"name": "morpheus","job": "leader"}
        When method post
        Then status 201

    @name=RegisterSuccessful
    Scenario: Register Successful
        Given path '/api/register'
        And request {"email":"eve.holt@reqres.in","password": "pistol"}
        When method post
        Then status 200

    @name=RegisterUnsuccessful
    Scenario: Register unsuccessful
        Given path '/api/login'
        And request {"email":"eve.holt@reqres.in"}
        When method post
        Then status 400