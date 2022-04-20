Dado("que eu acesse a aplicação swapi dev") do
  log_util("Realizando acesso ao endereço swapi dev")
end

Quando("realizar a consulta GET para trazer os dados de {string}") do |pessoa|
  @people_client.get_people(pessoa)
end

Então("deverá retonar os dados solicitados para a pessoa {string}") do |pessoa|
  @people_client.verify_data_response(pessoa)
end

E("deverá retonar o código {int}") do |statusCode|
  @people_client.verify_status_code_response(statusCode)
end

E("realizar a validação do schema de resposta {string}") do |statusCode|
  @people_client.validate_schema_response(statusCode)
end