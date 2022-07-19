Feature: Get employee details API

Background: 
    Given url environment.DummyRestApiExample.dummyRestApiExampleBaseUrl
    And header Content-Type = "application/json" 

@name=GetEmpDetails
Scenario: Get Employee Details
    Given path '/api/v1/employees'
    When method get 
    Then status 200

@name=CreateEmp
Scenario: Get Employee Details
    * def data = read('classpath:testData/payload/APIPayload.json')
    Given path '/api/v1/create'
    And request data.dummyAPIExample.createEmployee
    When method post 
    Then status 200