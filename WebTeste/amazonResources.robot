*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Variáveis Globais
${URL}    https://www.alura.com.br/
${menuEletronicos}    //a[contains(@aria-label,'Clique aqui e acesse a página da escola Programação')]
${textoHeader}  O mercado de Programação em números

*** Keywords ***
abrir o navagador
    Open Browser    browser=gc
    Maximize Browser Window

fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    ${menuEletronicos}

Entrar no menu "Eletrônicos"
    Click Element    ${menuEletronicos}


Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    ${textoHeader}  

Verificar se o título da página fica "${titulo}"
#Variáveis local
    Title Should Be    ${titulo}

Verificar se aparece a categoria "${Categoria}"
    Element Should Be Visible    //h4[@class='school-title--card'][contains(.,'${Categoria}')]

Pesquisar o produto "${produto}" no campo de pesquisa
    Input Text    header-barraBusca-form-campoBusca    ${produto}
    Click Element   //button[contains(@class,'header__nav--busca-submit')]

Verificar o resultado da pesquisa, listando o "${produto}"
    Wait Until Element Is Visible    //h4[@class='busca-resultado-nome'][contains(.,'${produto}')]

    ##gherkin Steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a categoria "Começando"