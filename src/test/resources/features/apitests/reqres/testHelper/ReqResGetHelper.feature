Feature: Feedback actions API feature

Background: 
    Given url environment.ReqRes.reqResBaseUrl
    And header Content-Type = "application/json" 

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