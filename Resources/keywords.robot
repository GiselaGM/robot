*** Keywords ***
Begin Web Test
    Open Browser                about:blank  ${BROWSER}

Go to Web Page
    Load page
    Verify page loaded

Load page
    Go To                       ${URL}

Verify page loaded
    Wait Until Page Contains    Your Amazon.com

Search for Product
    [Arguments]                 ${search_term}  ${search_result}
    Enter search term           ${search_term}
    Submit search
    Verify search completed     ${search_result}

Enter search term
    [Arguments]                 ${search_term}
    Input Text                  id:twotabsearchtextbox  ${search_term}

Submit search
    Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input

Verify search completed
    [Arguments]                     ${search_term}
    ${actual_term}                  Get Text  xpath://*[@id="search"]/span/span/h1/div/[1]/div/div/span[3]
    Shoult Be Equal                 "${search_term}" @{actual_term}

End Web Test
    Close Browser
