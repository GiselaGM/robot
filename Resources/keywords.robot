*** Keywords ***
Begin Web Test
    Open Browser                about:blank  ${BROWSER}

Go to Web Page
    Load page
    Verify page loaded

Load page
    Go To                       ${URL}

Verify page loaded
    ${link_text} = 		        Get Text  id:nav-your-amazon
    Should Be Equal		        ${link_text}

Search for Product
    [Arguments]                 ${search_term}
    Enter search term           ${search_term}
    Submit search
    Verify search completed     ${search_term}

Enter search term
    [Arguments]                 ${search_term}
    Input Text                  id:twotabsearchtextbox  ${search_term}

Submit search
    Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input

Verify search completed
    [Arguments]                     ${search_term}
    ${actual_term}                  Get Text  xpath://*[@id="search"]/span/span/h1/div/[1]/div/div/span[3]
    Should Be Equal                 "${search_term}" @{actual_term}

End Web Test
    Close Browser
