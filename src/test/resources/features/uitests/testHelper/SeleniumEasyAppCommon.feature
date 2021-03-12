Feature: ItBoost Common feature. 

Background: 
    Given call read('classpath:features/uitests/testHelper/CommonBackground.feature@name=Background') 
    
@name=Login 
Scenario: SeleniumEasy login 
    Given call read('classpath:features/uitests/testHelper/CommonBackground.feature@name=NavigateToSeleniumEasyURL') 
    Then print 'Selenium Easy URL is launched'