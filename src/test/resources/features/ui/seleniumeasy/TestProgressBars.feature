@parallel=true @TestProgressBars
Feature: Test Selenium Easy dummy website.

Background: 
    Given call read('classpath:features/ui/seleniumeasy/CommonBackground.feature@name=Background') 
    Given call read('classpath:features/ui/seleniumeasy/CommonBackground.feature@name=NavigateToSeleniumEasyURL') 

Scenario: Test Progress Bars tab basic feature
    Given waitfor(frequency, time_ms, SeleniumEasy.homePage.seleniumEasyLableText)
    And waitfor(frequency, time_ms, SeleniumEasy.homePage.seleniumEasySiteSlogan)
    And waitforclick(frequency, time_ms, SeleniumEasy.progressBars.tabProgressBars)
    Then waitfor(frequency, time_ms, SeleniumEasy.progressBars.subtabjqueryDownloadProgressBars)
    Then waitfor(frequency, time_ms, SeleniumEasy.progressBars.subtabbootstrapProgressbar)
    Then waitfor(frequency, time_ms, SeleniumEasy.progressBars.subtabdragAndDrop)

@Mytestcase
Scenario: Test drag and drop feature
    Given waitfor(frequency, time_ms, SeleniumEasy.homePage.seleniumEasyLableText)
    And waitfor(frequency, time_ms, SeleniumEasy.homePage.seleniumEasySiteSlogan)
    And waitforclick(frequency, time_ms, SeleniumEasy.progressBars.tabProgressBars)
    Then waitforclick(frequency, time_ms, SeleniumEasy.progressBars.subTabDragAndDropSlider)
    Then waitfor(frequency, time_ms, SeleniumEasy.progressBars.dragAndDropSlider.homePagelabelText)
    
