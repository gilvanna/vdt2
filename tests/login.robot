*** Settings ***
Documentation        Login tests

Library    Browser

*** Test Cases ***
Deve logar com sucesso
    Go To Login Page
    Submit Credentials    papito@gmail.com    vaibrasil
    User Logged In

Não deve logar com senha incorreta
    Go To Login Page
    Submit Credentials        papito@gmail.com    abc123
    Toast Message Should Be    Credenciais inválidas, tente novamente!

    

*** Keywords ***

Go To Login Page
    New Browser        headless=False
    New Page           https://trade-sticker-dev.vercel.app

Submit Credentials
    [Arguments]        ${email}    ${password}
    Fill Text        css=input[name=email]    ${email}
    Fill Text        css=input[name=password]    ${password}
    Click            css=button >> text=Entrar

User Logged In
    ${header_title}
    ...                Set Variable
    ...                Aquela figurinha incrível a um clique de distância.

    Get Text        css=.header-content strong    equal    ${header_title}

Toast Message Should Be
    [Arguments]        ${expected_message}

    ${locator}
    ...            Set Variable
    ...            css=.Toastify__toast-body div >> text=${expected_message}

    Wait For Elements State        ${locator}        visible    3