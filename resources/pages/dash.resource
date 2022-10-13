*** Settings ***
Documentation        Dashboard Page

Library    Browser

*** Keywords ***

User Logged In
    ${header_title}
    ...                Set Variable
    ...                Aquela figurinha incrível a um clique de distância.

    Get Text        css=.header-content strong    equal    ${header_title}