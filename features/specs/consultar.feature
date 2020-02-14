#language: pt

Funcionalidade: Consultar os dados de um endereço a partir de um CEP
  Como um usuário do sistema
  Eu quero realizar requisições na API
  Para que possa consultar os dados do endereço

  Cenário: Consulta CEP válido
    Dado o endereço da API para consultar o CEP "02321170"
    Quando realizar a requisição GET
    Então a API irá retornar os dados da consulta com o código do IBGE "3550308"

  Cenário: Consulta CEP inválido
    Dado o endereço da API para consultar o CEP "00000001"
    Quando realizar a requisição GET
    Então a API irá retornar erro no corpo da resposta