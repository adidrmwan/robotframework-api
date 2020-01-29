*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     OperatingSystem
Library     String

*** Variables ***
${base_url}=                http://34.87.100.36/v1/api-admin
${uri}=                     auth/login


*** Test Cases ***
Login_Success
    create session      login_admin     ${base_url}
    ${json_object}=     JSONLibrary.Load JSON From File     jsonFiles/LoginSuccess.json
    ${headers}=         create dictionary                   Content-Type=application/json
    ${resp}=            post request                        login_admin      ${uri}     data=${json_object}    headers=${headers}

    #Get Token
    ${getAccessToken}=     get from dictionary    ${resp.json()['data']}       token
    create file     data/accessToken.txt      ${getAccessToken}

    #Validation

    Should Be Equal As Strings      ${resp.json()['stat_code']}          200
    Should Be Equal As Strings      ${resp.json()['stat_msg']}           Success
    Should Be Equal As Strings      ${resp.json()['pagination']}         ${null}
    Should Be Equal As Strings      ${resp.json()['data']['token']}      ${getAccessToken}

*** Keywords ***
