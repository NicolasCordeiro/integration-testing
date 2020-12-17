#language: pt

Funcionalidade: CRUD de Processos

	Contexto:
		Dado que o usuário deseja salvar um novo processo
		E o usuário informar no campo "vara" o valor "3"
		E o usuário informar no campo "numero_processo" o valor "4"
		E o usuário informar no campo "natureza" o valor "Guarda"
		E o usuário informar no campo "partes" o valor "Jose x Maria"
		E o usuário informar no campo "urgente" o valor "N"
		E o usuário informar no campo "arbitramento" o valor "S"
		E o usuário informar no campo "assistente_social" o valor "Gisele"
		E o usuário informar no campo "data_entrada" o valor "20/10/2020"
		E o usuário informar no campo "data_saida" o valor ""
		E o usuário informar no campo "data_agendamento" o valor ""
		E o usuário informar no campo "status" o valor "Aguardando"
		E o usuário informar no campo "observacao" o valor ""

	@wip
	Cenário: Cadastro de Processo - POST
		Quando o usuário clicar em salvar
		Então o usuário deveria ver a mensagem "Processo cadastrado com sucesso"
	@wip
	Cenário: Consulta de Processo - GET
		E o usuário clicar no botão salvar
		Quando o usuário clicar no botão consultar do cadastro
		Entao o usuário deveria ver a mensagem "Processo consultado com sucesso"
		E o usuário deverá ver no campo "vara" o valor "3"
		E o usuário deverá ver no campo "numero_processo" o valor "4"
		E o usuário deverá ver no campo "natureza" o valor "Guarda"
		E o usuário deverá ver no campo "partes" o valor "Jose x Maria"
		E o usuário deverá ver no campo "urgente" o valor "N"
		E o usuário deverá ver no campo "arbitramento" o valor "S"
		E o usuário deverá ver no campo "assistente_social" o valor "Gisele"
		E o usuário deverá ver no campo "data_entrada" o valor "2020-10-20"
		E o usuário deverá ver no campo "status" o valor "Aguardando"
		E o usuário deverá ver no campo "observacao" o valor ""

	@ignore
	Cenário: Cadastro de Processo - POST
		Quando o usuário clicar em salvar
		Então o usuário deveria ver a mensagem "Processo cadastrado com sucesso"

	Cenário: Atualizar Processo - PUT
		Quando o usuário clicar no botão salvar
		E o usuário ver a mensagem "Processo cadastrado com sucesso"
		E o usuário alterou o campo "partes" para o valor "Fulano e Beltrano"
		E o usuário alterou o campo "urgente" para o valor "S"
		E o usuário clicar no botão editar
		Então o usuário ver a mensagem "Processo alterado com sucesso"


	Cenário: Exclusão de Processo - DELETE
		E o usuário clicar no botão salvar
		Quando o usuário clicar no botão apagar no cadastro
		E o usuário deveria ver a mensagem "Sem conteúdo"
		E o usuário clicar no botão consultar do cadastro
		Entao o usuário deveria ver a mensagem "Não Encontrado"


	Esquema do Cenario: Validação do cadastro de processo, com esquema de cenário (<id_processo>) - POST
		Dado que o usuário deseja salvar um novo processo
		E o usuário informar no campo "vara" o valor "<vara>"
		E o usuário informar no campo "numero_processo" o valor "<numero_processo>"
		E o usuário informar no campo "natureza" o valor "<natureza>"
		E o usuário informar no campo "partes" o valor "<partes>"
		E o usuário informar no campo "urgente" o valor "<urgente>"
		E o usuário informar no campo "arbitramento" o valor "<arbitramento>"
		E o usuário informar no campo "assistente_social" o valor "<assistente_social>"
		E o usuário informar no campo "data_entrada" o valor "<data_entrada>"
		E o usuário informar no campo "data_saida" o valor "<data_saida>"
		E o usuário informar no campo "data_agendamento" o valor "<data_agendamento>"
		E o usuário informar no campo "status" o valor "<status>"
		E o usuário informar no campo "observacao" o valor "<observacao>"
		Quando o usuário clicar em salvar
		Então o usuário deveria ver a mensagem "<mensagem>"

		Exemplos:
			|	id_processo	|	vara		|	numero_processo	|	natureza	|	partes				|	urgente	|	arbitramento	|	assistente_social	|	data_entrada|	data_saida	|data_agendamento|	status		|observacao	|	mensagem						|
			|	1			| São Paulo		|	00112456		|	criminal	|	Guilherme x Nicolas	|	S		|	N				|	Rosa				|	01/02/2020	|				|				|	Em Andamento|			|	Processo cadastrado com sucesso	|
			|	2			| São Paulo		|	00229877		|	civil		|	Guilherme x Nicolas	|	S		|	N				|	Maria				|	19/04/2020	|				|				|	Aguardando	|			|	Processo cadastrado com sucesso	|
			|	3			| Santo Andre	|	00219709		|	empresarial	|	Guilherme x Nicolas	|	N		|	N				|	Fernando			|	16/08/2020	|				|				|	Aguardando	|			|	Processo cadastrado com sucesso	|
			|	4			| Cotia			|	01237663		|	criminal	|	Guilherme x Nicolas	|	S		|	S				|	Joice				|	28/10/2020	|				|				|	Arquivado	|			|	Processo cadastrado com sucesso	|