*** Settings ***
Documentation        Login tests

Resource        ../resources/main.resource

Test Setup        Start Test
Test Teardown     Finish Test

*** Test Cases ***
Deve logar com sucesso
    Go To Login Page
    Submit Credentials    papito@gmail.com    vaibrasil
    User Logged In

Não deve logar com senha incorreta
    Go To Login Page
    Submit Credentials         papito@gmail.com    abc123
    Toast Message Should Be    Credenciais inválidas, tente novamente!
    #Thinking time
    Sleep                      1

Deve exibir notificação toaster se a senha não for preenchida
    Go To Login Page
    Submit Credentials         papito@gmail.com    ${EMPTY}
    Toast Message Should Be    Por favor, informe a sua senha secreta!
    Sleep                      1

Deve exibir notificação toaster se o email não for preenchido
    Go To Login Page
    Submit Credentials         ${EMPTY}    vaibrasil
    Toast Message Should Be    Por favor, informe o seu email!
    Sleep                      1

Deve exibir notificação toaster se email e senha não forem preenchidos
    Go To Login Page
    Submit Credentials         ${EMPTY}    ${EMPTY}
    Toast Message Should Be    Por favor, informe suas credenciais!
    Sleep                      1