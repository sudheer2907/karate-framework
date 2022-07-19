@tag
Feature: Developing input forms page

Background: 
    Given call read('classpath:features/ui/seleniumeasy/CommonBackground.feature@name=Background') 
    Given call read('classpath:features/ui/seleniumeasy/CommonBackground.feature@name=NavigateToSeleniumEasyURL') 

Scenario: Test SeleniumEasy Page is loaded after lauching an URL
Given waitfor(frequency, time_ms,SeleniumEasy.homePage.seleniumEasySiteSlogan) 

Scenario: Test input forms tab is visible\
Given waitfor(frequency, time_ms,SeleniumEasy.inputForms.tabInputForms) 

Scenario: Click on input forms tab
Given waitfor(frequency, time_ms,SeleniumEasy.inputForms.tabInputForms)
Given waitforclick(frequency, time_ms,SeleniumEasy.inputForms.tabInputForms)

Scenario: Open Simple form demo page and do some operation
Given waitfor(frequency, time_ms,SeleniumEasy.inputForms.tabInputForms)
Given waitforclick(frequency, time_ms,SeleniumEasy.inputForms.tabInputForms)
Given waitforclick(frequency, time_ms,SeleniumEasy.inputForms.subTabSimpleFormDemo)
Then sleep(5000)
Then waitforinput(frequency, time_ms,SeleniumEasy.simpleFormDemo.txtBoxSingleInput,'ABC')
Then sleep(5000)
Given waitforclick(frequency, time_ms,SeleniumEasy.inputForms.btnShowMessage)
Then waituntiltextmatch(frequency, time_ms,SeleniumEasy.simpleFormDemo.lableYourMessageSingleInput, 'ABC)'
Then sleep(5000)

Scenario: Verify single checkbox and multiple checkbox is working fine
Given waitfor(frequency, time_ms,SeleniumEasy.inputForms.tabInputForms)
Given waitforclick(frequency, time_ms,SeleniumEasy.inputForms.tabInputForms)
Given waitforclick(frequency, time_ms,SeleniumEasy.inputForms.subTabCheckBoxDemo)
Given waitforclick(frequency, time_ms,SeleniumEasy.checkboxDemo.chkBoxClickOnThisCheckbox)
Given waituntiltextmatch(frequency, time_ms,SeleniumEasy.checkboxDemo.lableTextAfterClickingSingleChkBox, 'Success - Check box is checked')
Given waitforclick(frequency, time_ms,SeleniumEasy.checkboxDemo.chkboxOption1)
Given waitforclick(frequency, time_ms,SeleniumEasy.checkboxDemo.chkboxOption2)
Given waitforclick(frequency, time_ms,SeleniumEasy.checkboxDemo.chkboxOption3)
Given waitforclick(frequency, time_ms,SeleniumEasy.checkboxDemo.chkboxOption4)


