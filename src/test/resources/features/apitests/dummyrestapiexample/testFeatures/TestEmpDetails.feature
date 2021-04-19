Feature: Test empoyee details feature

@name=GetListOfUsers
Scenario: Get employee details and verify basic details
    Given call read('classpath:features/apitests/dummyrestapiexample/testHelper/EmpDetailsHelper.feature@name=GetEmpDetails')
    Then print response.status == 'success'
    Then match each response.data contains {employee_name:'#string'}
    Then match each response.data contains {employee_salary:'#number'}
    Then match each response.data contains {id:'#number'}
    Then match each response.data contains {employee_age:'#number'}
    Then match response contains {"status":'success',"message":"Successfully! All records has been fetched."}
    
@name=createEmp
Scenario: Create an employee and verify the details
    Given call read('classpath:features/apitests/dummyrestapiexample/testHelper/EmpDetailsHelper.feature@name=CreateEmp')
    Then match response contains {"status":'success'}