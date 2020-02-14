Dado("o endereço da API para consultar o CEP {string}") do |cep|
  @headers = API_HEADERS
  @query = cep
end

Quando("realizar a requisição GET") do
  @response = @service.call(RequisicaoAPI).find_specific(@query)
end

Então("a API irá retornar os dados da consulta com o código do IBGE {string}") do |cod_ibge|
  @result = "#{@response["ibge"]}"
  p @result
  expect(@result).to eql cod_ibge
end

Então("a API irá retornar erro no corpo da resposta") do
  @result = "#{@response["erro"]}"
  p @result
  expect(@result).to eql "true"
end
