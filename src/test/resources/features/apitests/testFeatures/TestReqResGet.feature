Feature: Feedback actions API feature 

@name=GetListOfUsers
Scenario: Get List of users details and verify basic details
    Given call read('classpath:features/apitests/testHelper/TestReqResGetHelper.feature@name=GetListOfUsers')
    Then match response contains {"page":2,"per_page":6,"total":12,"total_pages":2,}
    When def dataResponse = $response.data
    Then match each dataResponse contains {"last_name":'#notnull',"id":'#notnull',"avatar":'#notnull',"first_name":'#notnull',"email":'#notnull'}

@name=GetSingleUserDetails
Scenario: Get single user details and verify the details
    Given call read('classpath:features/apitests/testHelper/TestReqResGetHelper.feature@name=GetSingleUserDetails')
    Then match $response.data contains {"id":2,"email":'janet.weaver@reqres.in',"first_name":'Janet',"last_name":'Weaver',"avatar":'#notnull'}