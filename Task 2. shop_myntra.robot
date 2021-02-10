*** Settings ***
Documentation     Go to e-shop, navigate to some category and add two most expensive items to the shopping cart from this category.
Library           SeleniumLibrary

*** Variables ***
${Url}                        https://www.myntra.com
${Browser}                    Chrome
${Men's_department}           XPath://a[contains(text(), 'Men')]
${Tommy_Hilfiger_brand}       XPath://img[contains(@src,'Tommy-Hilfiger')]
${Sort_by_Select}             XPath://div[@class='sort-sortBy']
${Sort_by_Price_High_to_Low}  XPath://label[normalize-space()='Price: High to Low']
${Item_1}                     XPath://li[1]//a[1]//div[2]
${Item_1_Select_Size}         XPath://p[normalize-space()='XS']
${Item_1_Add_to_Bag_Button}   XPath://div[normalize-space()='ADD TO BAG']
${Item_2}                     XPath://li[2]//a[1]//div[2]
${Item_2_Select_Size}         XPath://p[normalize-space()='42']
${Item_2_Add_to_Bag_Button}   XPath://div[normalize-space()='ADD TO BAG']
${Bag}                        XPath://span[normalize-space()='Bag']
${Item_1_Price}               XPath://div[contains(text(),'11,999')]
${Item_2_Price}               XPath://div[contains(text(),'11,003')]

*** Test Cases ***
Adding Two Most Expensive Items of One Brand to Bag
    Open the main page of the shop
    Select Men's department
    Select Tommy Hilfiger brand
    Sort by Price: High to Low
    Add Item 1 to Bag
    Add Item 2 to Bag
    Check Bag and Prices

*** Keywords ***
Open the main page of the shop
    Open Browser  ${url}   ${browser}
    Maximize browser window

Select Men's department
    Wait Until Element Is Visible             ${Men's_department}
    Click Element                             ${Men's_department}

Select Tommy Hilfiger brand
    Wait Until Element Is Visible  ${Tommy_Hilfiger_brand}
    Scroll Element Into View       ${Tommy_Hilfiger_brand}
    Click Element                  ${Tommy_Hilfiger_brand}

Sort by Price: High to Low
    Wait Until Element Is Visible  ${Sort_by_Select}
    Click Element                  ${Sort_by_Select}
    Wait Until Element Is Visible  ${Sort_by_Price_High_to_Low}
    Click Element                  ${Sort_by_Price_High_to_Low}
    Reload Page

Add Item 1 to Bag
    Wait Until Element Is Visible             ${Item_1}
    Click Element                             ${Item_1}
    Switch Window  NEW
    Wait Until Element Is Visible  ${Item_1_Select_Size}
    Click Element                  ${Item_1_Select_Size}
    Wait Until Element Is Visible  ${Item_1_Add_to_Bag_Button}
    Click Element                  ${Item_1_Add_to_Bag_Button}
    Close Window

Add Item 2 to Bag
    Switch Window  MAIN
    #Wait Until Element Is Visible             ${Item_2}
    Click Element                             ${Item_2}
    Switch Window  NEW
    Wait Until Element Is Visible  ${Item_2_Select_Size}
    Click Element                  ${Item_2_Select_Size}
    Wait Until Element Is Visible  ${Item_2_Add_to_Bag_Button}
    Click Element                  ${Item_2_Add_to_Bag_Button}

Check Bag and Prices
    Click Element              ${Bag}
    Element Text Should Be     ${Item_1_Price}      11,999
    Element Text Should Be     ${Item_2_Price}      11,003
    Close Browser