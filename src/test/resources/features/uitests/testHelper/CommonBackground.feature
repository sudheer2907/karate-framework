Feature: Common background code 

Background: 
    Given configure driver = { type: 'chrome', executable:'C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome'} 
    And def waitfor = function(frequency, time_ms, element){ retry(frequency, time_ms).waitFor(element) } 
    And def waitforclick = function(frequency, time_ms, element){ retry(frequency, time_ms).waitFor(element).click() } 
    And def waitforinput = function(frequency, time_ms, element, value){ retry(frequency, time_ms).input(element, value) } 
    And def waituntiltextmatch = function(frequency, time_ms, element,text){ retry(frequency, time_ms).waitForText(element,text) } 
    * configure retry = { count: 10, interval: 5000 } 
    
    @name=Background 
    Scenario: Common background code 
    Given  call read 'seleniumEasy.json' 
    
    @name=NavigateToSeleniumEasyURL 
    Scenario: Navigate to SeleniumEasy URL 
    Given  driver environment.seleniumEasyBaseUrl 
    And  driver.waitUntil("document.readyState == 'complete'") 
    And  maximize() 
    Then  waitforclick(frequency, time_ms, SeleniumEasy.homePage.popUpNoThanks)