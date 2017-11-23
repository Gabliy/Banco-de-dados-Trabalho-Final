CREATE DATABASE PROJE2016

USE PROJE2016


/*

Nome e RA dos integrantes do grupo:

Bruno Sampaio          RA: 140004
Christian Sanches dos Santos          RA: 140203
Everson Nascimento          RA: 152940 

*/

/*Cria a tabela escola*/
Create table escola
(
Nome varchar(100) not null,
Cidade varchar(50) not null,
Estado varchar(2) not null,
CEP varchar(10) not null,
Bairro varchar(100) not null,
Email varchar(100) not null,
Telefone numeric(18,0) not null,
CNPJ varchar(50) not null,
Endereco varchar(150) not null,
DataCadastro datetime not null
)


/*Cria a tabela Curso(Idiomas)*/
Create table cursoidioma
(
Curso varchar(100) not null,
Duracao int not null,
VagasDisponiveis int not null,
ValorMensalidade numeric(18,2) not null,
)


/*Cria a tabela Turma*/
Create table turma
(
Periodo varchar(50) not null,
Nivel varchar(50) not null,
DataInicio datetime not null,
DataTermino datetime not null,
)


/*Cria a tabela Aluno*/
Create table aluno
(
NomeAluno varchar(100) not null,
Cidade varchar(50) not null,
Endereco varchar(100) not null,
Bairro varchar(50) not null,
Estado varchar(2) not null,
CEP varchar(10) not null,
CPF varchar(20) not null,
Email varchar(100) not null,
Telefone varchar(30) not null,
DataNascimento datetime not null,
DataCadastro datetime not null,
PossuiDesconto varchar(2) not null
)


/*Cria a tabela Matrícula*/
Create table matricula
(
Nota numeric(18,2) not null,
DataMatricula datetime not null
)


/*Cria a tabela Frequência*/
Create table frequencia
(
Frequência varchar(2) not null,
DataAula Datetime not null
)

--Comandos para apagar as tabelas inteiramente se necessário
drop table escola
drop table cursoidioma
drop table turma
drop table aluno
drop table matricula
drop table frequencia


/*Seleciona todos os dados da tabela escola*/
select * from escola


/*Seleciona todos os dados da tabela cursoidioma*/
select * from cursoidioma


/*Seleciona todos os dados da tabela turma*/
select * from turma


/*Seleciona todos os dados da tabela aluno*/
select * from aluno


/*Seleciona todos os dados da tabela matricula*/
select * from matricula


/*Seleciona todos os dados da tabela frequencia*/
select * from frequencia


/*Adiciona a coluna CodEscola na tabela escola como chave primária*/
alter table escola ADD CodEscola numeric(18,0) identity primary key


/*Adiciona a coluna CodCurso como chave primária e a coluna CodEscola como chave estrangeira da tabela escola na tabela cursoidioma*/
alter table cursoidioma add CodCurso numeric(18,0) identity primary key
alter table cursoidioma add CodEscola numeric(18,0) references escola(CodEscola)


/*Adiciona a coluna CodTurma como chave primária e a coluna CodCurso como chave estrangeira da tabela cursoidioma na tabela turma*/
alter table turma add CodTurma numeric(18,0) identity primary key
alter table turma add CodCurso numeric(18,0) references cursoidioma(CodCurso)


/*Adiciona a coluna CodAluno como chave primária e a coluna CodTurma como chave estrangeira da tabela turma na tabela aluno*/
alter table aluno add CodAluno numeric(18,0) identity primary key
alter table aluno add Idade int

/*Adiciona a coluna CodTurma e a Coluna CodAluno comom chaves Primárias da tabela turma e aluno respectivamente natabela matricula*/
alter table matricula add CodTurma numeric(18,0) not null references turma(CodTurma)
alter table matricula add CodAluno numeric(18,0) not null references aluno(CodAluno)
alter table matricula add CONSTRAINT PKCodTurma Primary Key (CodTurma, CodAluno)


/*Adicina na tabela frequencia a Coluna DataAula,TurmaID e AlunoID como identificadores(Chave primária) e AlunoID,TurmaID também são chaves estrangeiras*/
alter table frequencia add CodAluno numeric(18,0) not null references aluno(CodAluno)
alter table frequencia add CodTurma numeric(18,0) not null references turma(CodTurma)
alter table frequencia add CONSTRAINT PKCodFrequencia Primary Key (CodAluno, CodTurma, DataAula)
 


/*Insere dados na tabela escola*/
insert into escola values('Facens', 'Sorocaba', 'SP','5245747896','Alto Boa Vista','facens@facens.br',325448796,'45786910237','Sorocaba','2015-04-02'),
						 ('Uniso', 'São Paulo','SP','5245767896','Alto','uniso@uniso.br',325648796,'45786910237','Sorocaba','2014-09-02'),
						 ('Fatec', 'Sorocaba', 'SP','5245787896','Boa Vista','fatec@fatec.br',329448796,'45786910237','Sorocaba','2005-07-02'),
						 ('Unip', 'Osasco','SP','5245747996','Vista','unip@unip.br',325408796,'45786910237','Sorocaba','2015-04-01'),
						 ('Anhanguera', 'Jundiaí', 'SP','5240747896','A Boa Vista','anhanguera@a.br',325448196,'45786910237','Sorocaba','2012-06-02')
						 

/*Insere dados na tabela cursoidioma*/
insert into cursoidioma values('Ingles',1,1,120.20,1),
							  ('Alemao',2,40,30.20,2),
							  ('Japones',3,40,500.10,3),
							  ('Mandarim',4,40,1200.40,4),
							  ('Espanhol',5,40,621.12,5)
/*Insere dados na tabela turma*/
insert into turma values('Manha','Básico','2014-08-09','2014-12-09', 1),
				        ('Tarde','Intermediário','2014-08-07','2015-01-07', 2),
				        ('Tarde','Básico','2014-05-09','2015-03-09', 3),
				        ('Noite','Básico','2011-08-10','2012-05-10', 4),
				        ('Manha','Avançado','2013-08-09','2013-09-09', 5)


/*Insere dados na tabela aluno*/
insert into aluno values('Bruno','Sorocaba','Rua 1','Boa Vista','SP','654646484','457879965214','bruno@nois.com','32554878','1996-02-02','2014-02-02','n',29),
					    ('Renato','Sorocaba','Rua 2','Boa Vista','SP','654646484','455875965214','renato@nois.com','34554878','1997-02-02','2011-02-02','N',25),
					    ('Everson','Sorocaba','Rua 3','Boa Vista','SP','654646484','455849995214','everson@nois.com','35554878','1998-02-02','2015-02-02','n',30),
					    ('Chris','Sorocaba','Rua 4','Boa Vista','SP','654646484','455279965614','chris@nois.com','37554878','1999-02-02','2014-02-02','n',42),
					    ('Rodrigo','Sorocaba','Rua 5','Boa Vista','SP','654646484','455379965214','rodrigo@nois.com','36554878','1979-02-02','2012-02-02','N',50)
						

/*Insere dados na tabela matricula*/
insert into matricula values(7.2,'2015-04-03',4,5),
							(7.3,'2015-04-03',2,2),
							(7.5,'2015-04-04',3,3),
							(7.8,'2015-04-05',4,4),
							(7.9,'2015-04-02',5,5)
							

/*Insere dados na tabela frequencia*/
insert into frequencia values('p','2015-01-01',1,1),
                             ('p','2015-01-01',2,2),
							 ('f','2015-01-01',3,3),
							 ('p','2015-01-01',4,4),
							 ('f','2015-01-01',5,5)


													/* ##### A - Subconsultas ##### */
	--PROBLEMA
/*1. Dê exemplo de um comando utilizando subconsultas que utilize o operador = ou <,>, <= etc. */

--DESCRIÇÃO DO QUE O COMANDO FAZ
/* O comando abaixo Seleciona a coluna NOTA da tabela matrícula em que os valores do campo NOTA forem maiores que 7 */
Select Nota From matricula where Nota > 7



	--PROBLEMA
/* 2. Dê exemplo de um comando utilizando subconsultas que utilize o operador in. */

--DESCRIÇÃO DO QUE O COMANDO FAZ
/* O comando abaixo utiliza a consulta mais interna (subconsulta, entre parenteses após o in) para selecionar a coluna CodCurso após a junção das três tabelas.
Após essa subconsulta ser feita a consulta mais externa (a que está antes do in) utiliza os dados retornados pela subconsulta para comparar se os valores do campo CodCurso
da tabela cursoidioma estão ou são iguais aos valores que foram selecionados pela subconsulta. Se sim, é selecionado o valor da coluna Duração da tabela
cursoidioma e mostrado na tela.
*/
Select Duracao from cursoidioma where CodCurso in ( Select t.CodCurso from turma t inner join matricula m
																				on
																				t.CodTurma = m.CodTurma
																				inner join frequencia f 
																				on
																				f.CodTurma = t.CodTurma and f.Frequência = 'p'
																				)

	--PROBLEMA
/*3. Dê exemplo de um comando utilizando subconsultas que utilize o operador not in.*/

--DESCRIÇÃO DO QUE O COMANDO FAZ
/* O comando abaixo seleciona o conteúdo do campo CodEscola, Nome, Cidade da tabela escola onde o conteúdo do campo Cidade da tabela escola não esteja
cadastrado na tabela aluno
*/

select CodEscola, Nome, Cidade from escola where Cidade not in (select Cidade from aluno)

--os selects abaixo server para simples conferência
select * from escola
select * from aluno


	--PROBLEMA
/* 4. Dê exemplo de um comando utilizando subconsultas que utilize o operador exists */

--DESCRIÇÃO DO QUE O COMANDO FAZ
/* O comando abaixo faz o seguinte:
Basta uma condição ser verdadeira na subconsulta que ele seleciona todos os valores da coluna Nível da tabela turma.

Para comprovar essa explicação, o mesmo comando foi refeito, agora ele será igual a apenas a um valor t.CodCurso = 4..
Agora, se for falsa ou seja se a subconsulta não selecionar nenhuma linha (Numero de linhas = 0) a consulta externa não é executada.

 */

select Nivel from turma where EXISTS ( select * from cursoidioma c inner join turma t on  t.CodCurso = c.CodCurso) --único comando válido, os demais foi apenas para exemplificação do que o comando faz

select Nivel from turma where EXISTS ( select * from cursoidioma c inner join turma t on  t.CodCurso = 4) --Comando válido, terá o mesmo efeito do comando acima

select Nivel from turma where EXISTS ( select * from cursoidioma c inner join turma t on  t.CodCurso = -10) --Condição falsa, a consulta externa não chega a ser executada

	--PROBLEMA
/* 5. Dê exemplo de um comando utilizando subconsultas que utilize o operador not  exists. */

--DESCRIÇÃO DO QUE O COMANDO FAZ
/* o comando abaixo faz o seguinte:
Ele é o oposto do comando EXISTS, pois basta que uma condição seja falsa para ele trazer todos os campos selecionados na colsulta externa.
Assim como no problema 4, foi colocado alguns exemplos para auxiliar na explicação.

*/
select Nivel from turma where NOT EXISTS( select * from cursoidioma c inner join turma t on  t.CodCurso = -90) -- único comando válido, os demais foi apenas para exemplificação do que o comando faz

select Nivel from turma where NOT EXISTS( select * from cursoidioma c inner join turma t on  t.CodCurso = c.CodCurso) --Condição verdadeira, a consulta externa não chega a ser executada

select Nivel from turma where NOT EXISTS( select * from cursoidioma c inner join turma t on  t.CodCurso = 1) --Condição verdadeira, a consulta externa não chega a ser executada



	--PROBLEMA
/* 6. Dê exemplo de uma subconsulta utilizada dentro de um comando Update. */

--DESCRIÇÃO DO QUE O COMANDO FAZ
/* O comando abaixo na condição where utiliza uma subconsulta a qual tem a finalidade de selecionar a menor NOTA da tabela matrícula e compara com o campo NOTA da
mesma tabela (matrícula) se a condição for satisfeita, isto é, se for verdadeira, então o campo Nota é atualizado (UPDATE) com um aumento de 10% no valor atual desse campo.
*/

--seleciona toda a informação da tabela matricula antes que o comando abaixo seja executado
select * from matricula

update matricula set Nota = Nota * 1.1 where  Nota = (select min(Nota) from matricula)

--seleciona a tabela matricula após o comando acima para verificar o efeito do comando
select * from matricula



	--PROBLEMA
/* 7. Dê exemplo de uma subconsulta utilizada dentro de um comando Delete. */

--DESCRIÇÃO DO QUE O COMANDO FAZ
/* O comando abaixo seleciona a Data de Matrícula mais recente da tabela matricula.
Compara com com cada campo DataMatricula da mesma tabela (matrícula), se a condição da comparação for stisfeita, isto é, se for verdadeira, a linha inteira que contém essa
informação é deletada da tabela.
*/

--seleciona toda a informação da tabela matrícula antes do comando abaixo seja executado
select * from matricula

delete from matricula where DataMatricula = (select max(DataMatricula) from matricula)

--seleciona a tabela matrícula apos o comando acima para verificar o efeito do comando
select * from matricula



													/* ##### B - Transact SQL ##### */


	--PROBLEMA
/* 8. Escreva uma função que seja útil para a lógica de negócios de seu sistema e indique o contexto de sua utilização. */

--DESCRIÇÃO DO QUE O COMANDO FAZ

/*	----- 
Esse metodo de negocio é usado function table que retorna o nome dos alunos na consulta mais externa, e na consulta mas interna ( subcosulta) retorna
a nota do aluno e a nota que for maior ou igual a passada por parâmetro ganhará uma viagem para o pais de origem do curso de lingua em que se está 
matriculado.

Obs.: Pode haver mais de um ganhador, podendo inclusive todos os alunos ganhar a viagem. 

*/



CREATE FUNCTION fnReturnMelhorAluno(@nota numeric(18,2))
		RETURNS TABLE
AS
	RETURN
			(SELECT a.NomeAluno  as Nome_Aluno_Vencedor_da_Viagem
	
			FROM 
					aluno a INNER JOIN matricula m
					ON a.CodAluno = m.CodAluno
			
			WHERE m.CodTurma IN (SELECT CodTurma
							
							FROM
									matricula m

							WHERE m.Nota >= @nota))

--seleciona todos os dados da tabela matricula para que possa ver a nota e utilizar na função
select * from matricula

SELECT * FROM DBO.fnReturnMelhorAluno(7.3)
							

	--PROBLEMA
/* 9. Escreva uma Stored Procedure que implemente uma regra de negócio de sua aplicação.Explique qual é e o porque desta regra ser implementada no SGBD. */

--DESCRIÇÃO DO QUE O COMANDO FAZ

/* O comando pega o nome do aluno matriculado na escola e sua idade, aquele cujo a idade é maior ou igual a 40 tem um desconto
na mensalidade para incentivar pessoas a estudarem outro idioma.O desconto será de 45%.

Esta regra foi implementado no SGBD para facilitar as tarefas internas que serão realizadas pelos funcionários da escola e também para dar segurança a informação,
não podendo o aluno que já recebeu desconto mentir e isso vale para aqueles que também não atendem o requisito necessário para receber o desconto que é a idade.

 */


create procedure spImpleNegocio
		@Idaluno int
AS
BEGIN
		DECLARE @ret varchar(50),
				@Idade int

		SELECT	@ret = NomeAluno, @Idade = Idade

		FROM	aluno

		WHERE	CodAluno = @Idaluno  

		

		IF (@Idade >= 40 and ((select PossuiDesconto from aluno where CodAluno = @Idaluno) = 'N' or (select PossuiDesconto from aluno where CodAluno = @Idaluno) = 'n'))
		BEGIN
				print @ret + ' Recebe desconto para alunos com idade maior ou igual a 40. O valor de Desconto recebido na mensalidade é de 45%'
				update cursoidioma set ValorMensalidade = ValorMensalidade * 0.55 where CodCurso in (Select ci.CodCurso from 
																										aluno a inner join matricula m
																										on
																										a.CodAluno = m.CodAluno and a.CodAluno = @Idaluno
																										inner join turma t
																										on
																										t.CodTurma = m.CodTurma
																										inner join cursoidioma ci
																										on
																										ci.CodCurso = t.CodCurso
																										
																										)

				update aluno set PossuiDesconto = 's' where CodAluno = @Idaluno
		END

		ELSE
			BEGIN
					print @ret +' não recebe desconto. Por não ter idade compativel ou por já possuir desconto.'
			END
END

exec spImpleNegocio 4

--comando abaixo serve para verificar o resultado da procedure acima

select * from aluno
select * from cursoidioma
/* 10. De acordo com o tema escolhido, escreva um procedimento armazenado (Stored Procedure)  para calcular totalizações do sistema. Esta totalização deve ser exibida como resultado do procedimento ou gravada em alguma tabela.
	Exemplo:
Valor total da locação de automóvel (diárias + seguro + danos, se houver) => para  tema da Locadora de veículos
Total de freqüência do aluno no curso => calculado a partir do registro diário de frequência do aluno no curso => para tema da Escola de Idiomas */

--DESCRIÇÃO DO QUE O COMANDO FAZ

/* O comando abaixo recebe o código do aluno como parâmetro, baseado nisso mostra quantas aulas (total) o aluno teve até
o momento da consulta e verifica quantas faltas e presença o mesmo possuí em relação ao total de aulas*/

SELECT * from frequencia
--comando utilizado para ver o efeito da procedure
insert into frequencia values('p','2015-01-02',4,4)
insert into frequencia values('f','2015-01-03',4,4)
insert into frequencia values('p','2015-01-04',4,4)
insert into frequencia values('f','2015-01-05',4,4)
insert into frequencia values('p','2015-01-06',4,4)
insert into frequencia values('f','2015-01-07',4,4)
insert into frequencia values('p','2015-01-08',4,4)
insert into frequencia values('p','2015-01-09',4,4)
insert into frequencia values('f','2015-01-10',4,4) 

create procedure spcalcula 
		@CodAluno numeric(18,0)
as
begin

declare @Frequencia varchar(2), @CodAluno2 numeric(18,0)
		declare curp cursor
		for
		select Frequência, CodAluno from frequencia
		
		open curp

		fetch next from curp into @Frequencia, @CodAluno2

		declare @contador int
		declare @contf int
		declare @soma int
		set @contador = 0
		set @contf = 0
		set @soma = 0

		while @@FETCH_STATUS = 0
	begin
		
		if(@Frequencia = 'p' and @CodAluno = @CodAluno2)
		begin
		set @contador = @contador + 1
		set @soma = @soma + 1
		end


		else if(@Frequencia = 'f' and @CodAluno = @CodAluno2)
		begin
		set @contf = @contf + 1
		set @soma = @soma + 1
		end

		fetch next from curp into @Frequencia, @CodAluno2
	end

		close curp
		deallocate curp
print'Total de Aulas que o aluno teve até agora:'
print +@soma
print 'Quantidade de Presenca: '
print  @contador

print'Quantidade de Ausencia: '
print +@contf

end


select * from frequencia
Exec spcalcula 4

	--PROBLEMA
/* 11. Escreva um trigger para suportar auditoria quanto à exclusão, alteração e inclusão de registros da seguinte forma:

Toda vez que um registro for incluído, excluído ou alterado da tabela principal de seu sistema, o trigger deverá gravar uma tabela de log com: 
Para exclusão: data e hora da operação, chave do registro excluído, nome da tabela e o usuário que disparou a exclusão.
Para inclusão: data e hora da operação, chave do registro incluído, nome da tabela e o usuário que disparou a inclusão.
Para alteração: data e hora da operação, chave do registro alterado, nome da tabela e o usuário que disparou a alteração, valor anterior e atual do campo alterado. */

--DESCRIÇÃO DO QUE O COMANDO FAZ

-- Criar tabela Logs que irá conter o histórico das alterações

create table Logs
(
LogID			int	identity not null,
TipoAlteração	varchar(255) not null,
DataAlteração	datetime not null,
TabelaAlterada	varchar(255)not null,
ChaveRegisro	varchar (255)not null,
Usuario			varchar(255)not null,
ValorAnterior	varchar(255)null,
ValorAtual		varchar(255)null
)

 --Criar e inserir valores na tabela Usuario 

create table Usuario
(
CodUsuario int identity primary key not null,
Nome varchar (255) not null,
Cargo varchar(255) not null,
Estatus varchar (255) not null
)

insert into Usuario values
('Rafael','Professor','Ativo'),
('Patricia','Professor','Ativo'),
('Thomas','Gerente','Ativo'),
('Amanda','Secretaria','Ativo'),
('Milena','Secretaria','Ativo')

select *from usuario

--O Codigo cria a Trigger para fazer o Log das informações na tabela "Logs" após alguma linha da tabela Escola (Tabela Principal) ser deletada.
--Após a exclusçaõ, a trigger declara uma variavel que representa o usuario logado que deletou o dado, e faz o adiciona a informação na tabela Logs.
--Dará um erro devido as depemdencias com outras tabelas, tentamos deletar as linhas das tabelas afetadas mas deixamos como comentario na Trigger 

create trigger trAuditoriaI on Escola
after delete
as
	begin
		declare @UsuarioLogado int
		set @UsuarioLogado=4 --O usuario logado é de CodUsuario igual a 4 (Amanda)

			--delete from matricula where codturma =4
			--delete from frequencia where codturma=4
			--delete from turma where codcurso = 4
			--delete from cursoidioma where CodEscola = 4 --(select codescola from deleted)
		
		insert into Logs values
		('Exclusão',getdate(),'Escola',(select CodEscola from deleted),(select Nome from usuario where codusuario=@UsuarioLogado),'-','-')
	End

--Validando trigger deletando uma linha da tabela escola

select*from escola

Delete from escola where CodEscola = 3

select*from escola
select*from logs


-- Após uma adição de dado feito na tabela Escola, o codigo abaixo simula um usuario logado declarando um variavel, e insere o acrecimo feito na tabela log.

create trigger trAuditoriaII on escola
after insert
as
	begin
		declare @UsuarioLogado int
		set @UsuarioLogado=5 --O usuario logado é de CodUsuario igual a 5 (Milena)

		insert into logs values
		('Inclusão',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario=5),'-','-')

	end

--Validando trigger, inserindo valores na tabala Escola

insert into escola values
('ESANC2', 'Sorocaba', 'SP','10234987','Vista Boa','esanc@a.br',322345342,'12343000123','Rua 1','2015-07-19'),
('Uirapuru2', 'Sorocaba', 'SP','182284958','Campolim','uiapuru@a.br',12238763,'34565443322','Avenida 1','2015-03-25')
select*from escola
select*from Logs

-- Essa trigger é acionada após alguma atualização na tabela escola, ela simula um usuario do sistema e adiciona o valor alterado (antigo) e o novo valor, na tabela Logs.
-- O codigo checa coluna a coluna para poder registrar o valor correto na tabela Logs.

create trigger trAuditoriaIII on escola
after update
as
begin
	declare @UsuarioLogado int
	set @UsuarioLogado=3 --O usuario logado é de CodUsuario igual a 3 (Thomas)

	if update (nome)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Nome from deleted),(select Nome from inserted))
		end	
	else if update (Cidade)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Cidade from deleted),(select Cidade from inserted))
		end
	else if update (Estado)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Estado from deleted),(select Estado from inserted))
		end
	else if update (CEP)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select CEP from deleted),(select CEP from inserted))
		end
	else if update (Bairro)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Bairro from deleted),(select Bairro from inserted))
		end
	else if update (Email)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Email from deleted),(select Email from inserted))
		end
	else if update (Telefone)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Telefone from deleted),(select Telefone from inserted))
		end
	else if update (CNPJ)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select CNPJ from deleted),(select CNPJ from inserted))
		end
	else if update (Endereco)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select Endereco from deleted),(select Endereco from inserted))
		end
	else if update (DataCadastro)
		begin
			insert into Logs values
			('Alteração',getdate(),'Escola',(select CodEscola from inserted),(select Nome from Usuario where CodUsuario = @UsuarioLogado),(select DataCadastro from deleted),(select DataCadastro from inserted))
		end

		Select * From Logs
end

-- Validando alteração na tabela Logs ao atualizar algum dado da tabela escola.

update escola set Cidade = 'Pato Brmco' where nome ='uniso'
update escola set Estado = 'PR' where nome ='uniso'
update escola set Bairro = 'Vai Saber' where nome ='uniso'
update escola set Endereco = 'Rua de Longe' where nome ='uniso'


select *from escola

delete from Logs where logid=2


	--PROBLEMA
/* 12. De acordo com o tema  escolhido, escreva um trigger para realizar uma ação automática que seja  necessária para o  sistema manter a  integridade dos dados.
		Exemplo:
Cada vez que for inserida a matrícula de um aluno no curso, diminuir o número de vagas disponíveis no curso =>  para tema da Escola de Idiomas
Cada vez que uma locação for encerrada, calcular o total de pontos de fidelidade =>  para tema da  Locadora de veículos
Atualizar o saldo bancário cada vez que ocorrer um lançamento de débito ou crédito=> para o Tema de Contas correntes bancárias.
Etc. */

--DESCRIÇÃO DO QUE O COMANDO FAZ

/* o comando abaixo faz o seguinte:
					Cada vez que for inserida a matrícula de um aluno no curso, é subtraído em um o número de vagas atualmente disponíveis no curso.
O comando não é executado se a quantidade de vagas disponível for 0 ou menor que 0, pois aí o curso estaria com a turma completa.

*/


create trigger tgrcontrole on matricula
instead of insert
as
begin

if ((select c.VagasDisponiveis from inserted i inner join turma t 
on
i.CodTurma = t.CodTurma
inner join cursoidioma c
on
c.CodCurso = t.CodCurso) > 0)

begin

update cursoidioma set VagasDisponiveis = VagasDisponiveis - 1 where CodCurso = (select c.CodCurso from
																						inserted i inner join turma t
																						on
																						i.CodTurma = t.CodTurma
																						inner join cursoidioma c
																						on
																						c.CodCurso = t.CodCurso
																								
)

insert into matricula select Nota, DataMatricula, CodTurma, CodAluno from inserted

end

else
begin

raiserror('O curso escolhido nao possui mais vagas disponíveis, a turma atual está completa!', 13,1,1)

end

select * from cursoidioma

end

--O comandos Abaixo servem Apenas para testar o trigger acima

insert into turma values('Manha','Básico','2014-08-09','2014-12-09', 1)
insert into aluno values('Bruno','Sorocaba','Rua 1','Boa Vista','SP','654646484','457879965214','bruno@nois.com','32554878','1996-02-02','2014-02-02','n',29)
insert into matricula values(7.2,'2015-04-03',9,6)


select * from turma
select * from aluno
select * from matricula
select * from cursoidioma


	--PROBLEMA
/* 13. Escreva um procedimento que necessite da utilização de cursores.
Lembre-se o uso de cursores é interessante quando precisamos trabalhar com um conjunto de linhas e tratando cada linha de maneira individual. */

--DESCRIÇÃO DO QUE O COMANDO FAZ
/* O comando abaixo seleciona alguns campos da tabela aluno como Nome do Aluno, Cidade, Endereco e Telefone
e nos mostra com a numeração acima de todas essas informações para fácil verificação de quantos alunos existem na tabela.
*/

create procedure prcur
as
begin
		declare
				@NomeAluno varchar(100),
				@Cidade varchar(50),
				@Endereco varchar(100),
				@Telefone Varchar(30)

		declare curaluno cursor
		for
		select NomeAluno, Cidade, Endereco, Telefone from aluno

		open curaluno

		fetch next from curaluno into @NomeAluno, @Cidade, @Endereco, @Telefone

		declare @contador int
		set @contador = 1

		while @@FETCH_STATUS = 0
	begin

		print @contador
		print 'Nome do Aluno: ' +@NomeAluno
		print 'Cidade do Aluno: ' +@Cidade
		print 'Endereco do Aluno: ' +@Endereco
		print 'Telefone do Aluno: ' +@Telefone
		print''

		set @contador = @contador + 1

		fetch next from curaluno into @NomeAluno, @Cidade, @Endereco, @Telefone
	end

		close curaluno
		deallocate curaluno

end

execute prcur