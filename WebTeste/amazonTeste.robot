*** Settings ***
Documentation    Suite para testar site da Alura.
Resource         amazonResources.robot
Test Setup       abrir o navagador
Test Teardown    fechar o navegador

*** Variables ***
${produto}    Formação Front End T6 - ONE

*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletronicos do site
    ...                e verifica a categoria Computadores e Informática.
    [Tags]             menus    Alura
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Escola de Programação | Alura Cursos Online"
    Verificar se aparece a categoria "Começando"
    Verificar se aparece a categoria "Experiente"

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica uma busca de produto.
    [Tags]             busca_produtos    Alura
    Acessar a home page do site Amazon.com.br
    Pesquisar o produto "${produto}" no campo de pesquisa
    Verificar o resultado da pesquisa, listando o "${produto}"
