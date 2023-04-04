*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    JSONLibrary

*** Variables ***
${API_url}      https://run.mocky.io/

*** Test Cases ***
GET responce

    Create Session    mysession          ${API_url}      verify=True
    ${respoce}=     GET On Session       mysession     v3/7abe5741-7221-4f55-9a40-7bd0f3777ff0
    ${res_code}=    Convert To String    ${respoce.status_code}
    Should Be Equal    ${res_code}       200
    ${json}=    Set Variable             ${respoce.json()}
#    Log To Console    ${json}

    verify data                          ${json}

*** Keywords ***
verify data
    [Arguments]    ${json}

    Log    ${json}
    FOR    ${responce}  IN      ${json}
        FOR    ${error}     IN  @{responce["response"]["errors"]}
#            Log To Console    ${error["code"]}
            Run Keyword If        '${error["code"]}' == '200810'     Fail    ${error["message"]}
        END

#        Log To Console    ${responce["response"]["items"][0]["valueObject"]["subscriptionId"]["accountType"]}
    END

    Requirements     ${json}

Requirements

    [Arguments]   ${json}
    ${acType}=  Set Variable    ${json["response"]["operationContext"]["accountType"]}
    ${status}=  Set Variable    ${json["response"]["items"][0]["valueObject"]["eSim"]["data"][0]["activationStatus"]}
    ${acTypeText}=  Set Variable    ${json["response"]["items"][0]["valueObject"]["subscriptionId"]["accountType"]}[0]


    Should Be Equal As Strings      ${acType}        G

#    ${status}=  Set Variable        ${responce["response"]["items"][0]["valueObject"]["eSim"]["data"][0]["activationStatus"]}
    Should Be Equal As Strings      ${status}        Active

#    Should Be Equal As Strings      '${acType}'      '${acTypeText}'
