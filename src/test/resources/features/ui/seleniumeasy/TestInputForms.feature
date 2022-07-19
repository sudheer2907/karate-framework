@parallel=true @TestInputForms
Feature: Test Selenium Easy dummy website.

Background: 
    Given call read('classpath:features/ui/seleniumeasy/CommonBackground.feature@name=Background') 
    Given call read('classpath:features/ui/seleniumeasy/CommonBackground.feature@name=NavigateToSeleniumEasyURL') 

Scenario: Test SeleniumEasy Page is loaded after lauching an URL 
    Given waitfor(frequency, time_ms, SeleniumEasy.homePage.seleniumEasyLableText) 
    And waitfor(frequency, time_ms, SeleniumEasy.homePage.seleniumEasySiteSlogan) 

Scenario: Test Simple form demo - Single Input Field 
    Given waitforclick(frequency, time_ms, SeleniumEasy.inputForms.tabInputForms) 
    Given waitforclick(frequency, time_ms, SeleniumEasy.inputForms.subTabSimpleFormDemo) 
    Given waitfor(frequency, time_ms, SeleniumEasy.simpleFormDemo.simpleFormDemoHomePage) 
    And waitforinput(frequency, time_ms, SeleniumEasy.simpleFormDemo.txtBoxSingleInput,'Sample Text') 
    When waitforclick(frequency, time_ms, SeleniumEasy.simpleFormDemo.btnShowMessage) 
    Then match text(SeleniumEasy.simpleFormDemo.lableYourMessageSingleInput) contains 'Sample Text' 

Scenario: Test Simple form demo - Two Input Field 
    Given waitforclick(frequency, time_ms, SeleniumEasy.inputForms.tabInputForms) 
    Given waitforclick(frequency, time_ms, SeleniumEasy.inputForms.subTabSimpleFormDemo) 
    Given waitfor(frequency, time_ms, SeleniumEasy.simpleFormDemo.simpleFormDemoHomePage)
    Given waitforclick(frequency, time_ms, SeleniumEasy.simpleFormDemo.txtBoxEnterA) 
    And waitforinput(frequency, time_ms, SeleniumEasy.simpleFormDemo.txtBoxEnterA,'10')
    Given waitforclick(frequency, time_ms, SeleniumEasy.simpleFormDemo.txtBoxEnterB)
    And waitforinput(frequency, time_ms, SeleniumEasy.simpleFormDemo.txtBoxEnterB,'20') 
    When waitforclick(frequency, time_ms, SeleniumEasy.simpleFormDemo.btnGetTotal) 
    Then waituntiltextmatch(frequency, time_ms,SeleniumEasy.simpleFormDemo.lableTextGetTotalValue,'30') 

Scenario: Test Simple form demo - Checkbox demo 
    Given waitforclick(frequency, time_ms, SeleniumEasy.inputForms.tabInputForms) 
    Given waitforclick(frequency, time_ms, SeleniumEasy.inputForms.subTabCheckBoxDemo) 
    Then waitfor(frequency, time_ms, SeleniumEasy.checkboxDemo.checkboxDemoHomePage) 
    When waitforclick(frequency, time_ms, SeleniumEasy.checkboxDemo.chkBoxClickOnThisCheckbox) 
    Then waitfor(frequency, time_ms, SeleniumEasy.checkboxDemo.lableTextAfterClickingSingleChkBox) 
    When waitforclick(frequency, time_ms, SeleniumEasy.checkboxDemo.chkboxOption1) 
    When waitforclick(frequency, time_ms, SeleniumEasy.checkboxDemo.chkboxOption2) 

Scenario: Test Simple form demo - Radio Button 
    Given waitforclick(frequency, time_ms, SeleniumEasy.inputForms.tabInputForms)
    Given waitforclick(frequency, time_ms, SeleniumEasy.inputForms.subTabRadioButtonDemo)
    When waitforclick(frequency, time_ms, SeleniumEasy.radioButtonDemo.singleMaleRadioButton)
    And waitforclick(frequency, time_ms, SeleniumEasy.radioButtonDemo.btnGetCheckedValues)
    Then match text(SeleniumEasy.radioButtonDemo.labelTextRadioIsChecked) contains 'is checked'

Scenario: Test Others tab
    Given waitforclick(frequency, time_ms, SeleniumEasy.others.tabOthers)
    Then waitforclick(frequency, time_ms, SeleniumEasy.others.subTabDynamicDataLoading)
    Then waitforclick(frequency, time_ms, SeleniumEasy.others.btnGetNewUser)
    Then waitfor(frequency, time_ms, SeleniumEasy.others.dynamicUserImage)
    Given waitforclick(frequency, time_ms, SeleniumEasy.others.tabOthers)
    Then waitforclick(frequency, time_ms, SeleniumEasy.others.subTabChartsDemo)
    And waitForEnabled(SeleniumEasy.others.videoFiles)

    