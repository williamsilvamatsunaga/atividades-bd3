#Sistema para Empresa de Transporte Rodoviario

create database bd_rodoviaria_3;
use bd_rodoviaria_3;

create table estado (
id_est int primary key auto_increment,
nome_est varchar (200) not null,
sigla_est varchar (2) not null,
regiao_est varchar (300)
);

create table cidade (
id_cid int primary key auto_increment,
nome_cid varchar (200) not null,
populacao_cid int not null,
tipologia_cid varchar (300),
id_est_fk int not null,
foreign key (id_est_fk) references estado (id_est)
);

create table endereco (
id_end integer primary key auto_increment,
rua_end varchar (300) not null,
numero_end integer,
bairro_end varchar (100),
cep_end varchar (100) not null,
id_cid_fk int not null,
foreign key (id_cid_fk) references cidade (id_cid)
); 

create table sexo (
id_sex int primary key auto_increment,
nome_sex varchar (100) not null
);

insert into sexo values (null, 'Masculino'), (null, 'Feminino');

create table cliente (
id_cli integer primary key auto_increment,
nome_cli varchar (300) not null,
cpf_cli varchar (20) not null,
rg_cli varchar (200),
data_nascimento_cli date not null,
idade_cli int,
celular_cli varchar (100),
email_cli varchar(300),
id_sex_fk integer not null,
id_end_fk integer not null,
foreign key (id_sex_fk) references sexo (id_sex),
foreign key (id_end_fk) references endereco (id_end)
);

create table departamento (
id_dep integer primary key auto_increment,
nome_dep varchar (100)
);

insert into departamento values (null, 'Vendas'), (null, 'Manutenção'), (null, 'Financeiro'), (null, 'Administração');

create table funcionario (
id_fun integer primary key auto_increment,
nome_fun varchar (300) not null,
cpf_fun varchar (20) not null,
rg_fun varchar (50),
data_nascimento_fun date,
salario_fun double not null,
funcao_fun varchar (50) not null,
data_contratacao_fun date,
celular_fun varchar (300) not null,
email_fun varchar (300) not null,
id_sex_fk integer not null,
id_dep_fk integer not null,
id_end_fk integer not null,
foreign key (id_sex_fk) references sexo (id_sex),
foreign key (id_dep_fk) references departamento (id_dep),
foreign key (id_end_fk) references endereco (id_end)
);

create table onibus (
id_oni integer primary key auto_increment,
modelo_oni varchar (100) not null,
marca_oni varchar (100),
placa_oni varchar (50) not null,
capacidade_oni int not null
);

create table poltrona(
id_pol integer primary key auto_increment,
numero_pol integer not null,
situacao_pol varchar (100) not null,
id_oni_fk integer not null,
foreign key (id_oni_fk) references onibus (id_oni)
);

create table trecho_viagem (
id_tre integer primary key auto_increment,
data_partida_tre date not null,
data_chegada_tre date not null,
horario_partida_tre time not null,
horario_chegada_tre time not null,
distancia_tre float,
tarifa_tre float,
id_cid_origem_fk int not null,
id_cid_destino_fk int not null,
id_oni_fk int not null,
id_fun_fk int,
foreign key (id_cid_origem_fk) references cidade (id_cid),
foreign key (id_cid_destino_fk) references cidade (id_cid),
foreign key (id_oni_fk) references Onibus (id_oni),
foreign key (id_fun_fk) references funcionario (id_fun)
);

create table passagem (
id_pas integer primary key auto_increment,
data_pas date not null,
valor_pas float,
forma_recebimento_pas varchar (300), #Vista ou Prazo
parcelamento_pas int, #Se a Vista 1. Se a prazo o usuario informa a quantidade. Influenciará diretamente a geração de recebimentos.
id_cli_fk integer not null,
id_fun_fk integer not null,
id_tre_fk integer not null,
poltrona_pas integer,
foreign key (id_cli_fk) references Cliente (id_cli),
foreign key (id_fun_fk) references Funcionario (id_fun),
foreign key (id_tre_fk) references Trecho_Viagem (id_tre)
);

create table caixa (
id_cai integer not null primary key auto_increment,
data_abertura_cai date not null,
data_fechamento_cai date,
saldo_inicial_cai double not null,
valor_creditos_cai double,
valor_debitos_cai double,
saldo_final_cai double,
status_cai varchar (100) not null, #Aberto ou Fechado
id_fun_fk int not null,
foreign key (id_fun_fk) references funcionario (id_fun)
);

#são gerados automaticamente de acordo com a forma de recebimento escolhida na passagem.
create table recebimento ( 
id_rec integer not null primary key auto_increment,
data_vencimento_rec date,
valor_rec double,
parcela_rec varchar(100), #1/1
status_rec varchar (100), #Aberto ou Recebido
tipo_recebimento_rec varchar (100), #Dinheiro ou PIX ou Cartão Crédito ou Cartão de Debito
data_recebimento_rec date,
hora_recebimento_rec time,
id_cai_fk integer,
id_pas_fk integer not null,
foreign key (id_cai_fk) references caixa (id_cai),
foreign key (id_pas_fk) references passagem (id_pas)
);

-- Exercícios

-- RF1 - CADASTRAR ESTADO

-- Crie um procedimento para inserir um registro na tabela Estado de acordo com as seguintes regras:
-- 1) Garanta que não seja inserido Estados com o nome repetido;
-- 2) Garanta que os campos obrigatórios sejam inseridos.
-- 3) Garanta que o campo sigla seja inserido com apenas dois caracteres; Dica: length()
-- TESTE: Insira 10 Estados do Brasil, entre eles devem constar obrigatoriamente: RO, MT, AC, AM e MS.

delimiter $$
create procedure inserirEstado (nome varchar(100),  sigla varchar(100), regiao varchar(100))
begin
    declare teste varchar(100);
    set teste = (select nome_est from estado where (nome_est = nome));
    if (teste = '') or (teste is null) then
        if (nome is not null) and (sigla is not null) then
            if (length(sigla) = 2) then
                insert into estado values (null, nome, sigla, regiao);
                select 'Dados inseridos' Confirmacao;
            else
                select 'Erro 2' Alerta;
            end if;
        else
            select 'Dados não inseridos' Alerta;
        end if;
    else
        select 'Erro 1' Alerta;
    end if;
end $$
delimiter ;

call inserirEstado('Rondônia', 'RO', 'Norte');
call inserirEstado('Mato Grosso', 'MT', 'Centro-Oeste');
call inserirEstado('Acre', 'AC', 'Norte');
call inserirEstado('Amazonas', 'AM', 'Norte');
call inserirEstado('Mato Grosso do Sul', 'MS', 'Centro-Oeste');
call inserirEstado('São Paulo', 'SP', 'Sudeste');
call inserirEstado('Rio de Janeiro', 'RJ', 'Sudeste');
call inserirEstado('Minas Gerais', 'MG', 'Sudeste');
call inserirEstado('Paraná', 'PR', 'Sul');
call inserirEstado('Bahia', 'BA', 'Nordeste');

-- RF2 – CADASTRAR CIDADE
-- Crie um procedimento para inserir um registro na tabela Cidade de acordo com as seguintes regras:
-- 1) Garanta que a chave estrangeira realmente exista na tabela de origem;
-- 2) Garanta que não seja inserido Cidades com o nome repetido;
-- 3) O campo tipologia não deve ser inserido pelo usuário. O procedimento deverá preenchê-lo automaticamente com os 
-- informações Pequena, Média ou Grande a partir do campo população de acordo com a regra “Cidade pequena: possui
-- até 99 mil habitantes. Cidade média: ente 100 mil e 499 mil habitantes. Cidade grande: acima de 500 mil habitantes”
-- TESTE: Chame o procedimento e insira 10 cidades de RO, 03 de MT, 02 de AC, 03 de AM e 02 de MS.

delimiter $$
create procedure InserirCidade (nome varchar(100), populacao int, id_est int)
begin
	declare teste_id_fk int;
    declare test_nome varchar(100);
    declare v_tipologia varchar(100);
    set teste_id_fk = (select id_est from estado where id_est = id_est limit 1);
    set test_nome = (select nome_cid from cidade where nome_cid = nome limit 1);
    
    if (teste_id_fk is not null) then
		if (test_nome is null) then
			if populacao <= 99000 then
				set v_tipologia = 'Pequena';
			elseif populacao between 100000 and 499999 then
				set v_tipologia = 'Média';
			else
				set v_tipologia = 'Grande';
			end if;
            
            insert into cidade (nome_cid, populacao_cid, tipologia_cid, id_est_fk)
            values (nome, populacao, v_tipologia, id_est);
        else
			select "Cidade já cadastrada" Alert;
		end if;
    else
		select "Estado não existente" Alert;
	end if;
end $$
delimiter ;

call InserirCidade('Porto Velho', 548952, 1);
call InserirCidade('Ji-Paraná', 130000, 1);
call InserirCidade('Ariquemes', 110000, 1);
call InserirCidade('Vilhena', 102000, 1);
call InserirCidade('Cacoal', 86000, 1);
call InserirCidade('Rolim de Moura', 55000, 1);
call InserirCidade('Jaru', 52000, 1);
call InserirCidade('Guajará-Mirim', 47000, 1);
call InserirCidade('Ouro Preto do Oeste', 38000, 1);
call InserirCidade('Buritis', 40000, 1);

call InserirCidade('Cuiabá', 650000, 2);
call InserirCidade('Várzea Grande', 300000, 2);
call InserirCidade('Rondonópolis', 230000, 2);

call InserirCidade('Rio Branco', 420000, 3);
call InserirCidade('Cruzeiro do Sul', 90000, 3);

call InserirCidade('Manaus', 2200000, 4);
call InserirCidade('Parintins', 115000, 4);
call InserirCidade('Itacoatiara', 100000, 4);

call InserirCidade('Campo Grande', 900000, 5);
call InserirCidade('Dourados', 225000, 5);

-- RF3 – CADASTRAR ENDEREÇO
-- Crie um procedimento para inserir um registro na tabela Endereço de acordo com as seguintes regras:
-- 1) Garanta que a chave estrangeira realmente exista na tabela de origem;
-- 2) Garanta que não seja inserido um Endereço repetido. Lembrado que um endereço é composto por rua, nº,
-- 3) Garanta que o campo cep seja inserido com apenas 8 dígitos e sem a máscara;
-- TESTE: Chame o procedimento e insira 10 endereços aleatórios;

delimiter $$
create procedure inserirEndereco (rua varchar(100), numero int, bairro varchar(100), cep varchar(100), id_cid_fk int)
begin
	declare test_id_fk int;
    declare test_cep varchar(100);
    set test_id_fk = (select id_cid from cidade where id_cid = id_cid_fk limit 1);
    set test_cep = (select cep_end from endereco where cep_end = cep limit 1);
    
    if (test_id_fk is not null) then
		if (test_cep is null) then
			if (length(cep) = 8) then
				insert into endereco (rua_end, numero_end, bairro_end, cep_end, id_cid_fk)
                values (rua, numero, bairro, cep, id_cid_fk);
                
                select "Endereço inserido" as Confirmacao;
            else
				select "Formato cep errado" as Alert;
			end if;
        else
			select "Cep existente" as Alert;
		end if;
    else
		select "Cidade não existente" as Alert;
	end if;
end $$
delimiter ;

call inserirEndereco('Rua das Flores', 123, 'Centro', '76800000', 1);
call inserirEndereco('Av. Brasil', 456, 'Jardim América', '76801000', 2);
call inserirEndereco('Rua Amapá', 78, 'Nova Esperança', '76802000', 3);
call inserirEndereco('Rua São Paulo', 910, 'Industrial', '76803000', 4);
call inserirEndereco('Av. Paraná', 321, 'Centro', '76804000', 5);
call inserirEndereco('Rua Bahia', 654, 'Bela Vista', '76805000', 6);
call inserirEndereco('Rua Goiás', 147, 'Planalto', '76806000', 7);
call inserirEndereco('Av. Amazonas', 258, 'Zona Sul', '76807000', 8);
call inserirEndereco('Rua Mato Grosso', 369, 'Centro', '76808000', 9);
call inserirEndereco('Rua Rio Grande', 159, 'Jardim das Palmeiras', '76809000', 10);

-- RF4 – CADASTRAR CLIENTE
-- Crie um procedimento para inserir um registro na tabela Cliente de acordo com as seguintes regras:
-- 1) Garanta que as chaves estrangeiras realmente existam nas tabelas de origem;
-- 2) Garanta que o usuário informe um CPF com o 11 caracteres.
-- 3) Garanta que não seja inserido clientes com o CPF repetido;
-- 4) Garanta que não seja inserida data de nascimento superior a data atual do SO e inferior ao ano de 1900. Dica: curdate()
-- 5) Garanta que o usuário digite um e-mail com o caractere @.
-- 6) O campo idade não deve ser inserido pelo usuário. O procedimento deverá preenchê-lo automaticamente a partir da data de nascimento. Dica: datediff()
-- TESTE: Chame o procedimento e insira 05 clientes aleatórios;

delimiter $$
create procedure inserirCliente (nome varchar (300), cpf varchar (300), rg varchar (300), nascimento date, celular varchar (300),
								email varchar (300), sexo int, endereco int)
begin
	declare teste_cpf varchar (300);
	declare teste_sexo, teste_endereco, idade int;
    
    set teste_cpf = (select cpf_cli from cliente where (cpf_cli = cpf));
	set teste_sexo = (select id_sex from sexo where (id_sex = sexo));
    set teste_endereco = (select id_end from endereco where (id_end = endereco));
    
    set idade = datediff(curdate(), nascimento) / 365;
    
    if (teste_sexo is not null) then
		if (teste_endereco is not null) then
			if (teste_cpf is null) then
				if (nome <> '') and (cpf <> '') and (nascimento is not null) and (sexo <> '') and (endereco <> '') then
					if (length(cpf) = 11) then
						if ((cpf like '%-%') is false) then
							if (nascimento < curdate()) and (nascimento > '1900-01-01') then
								if (email like '%@%') then
									insert into cliente values (null, nome, cpf, rg, nascimento, idade, celular, email, sexo, endereco);
									select concat('O cliente ', nome, ' com CPF ', cpf, ' foi inserido com sucesso!') as Confirmacao;
								else
									select 'O campo e-mail precisa conter o caractere @!' as Alerta;
								end if;
							else
								select 'A Data de Nascimento precisa ser inferior a data atual e superior ao ano 1900!' as Alerta;
							end if;
						else
							select 'O CPF não pode ser inserido com a máscara, somente números!' as Alerta;
						end if;
					else
						select 'O campo CPF precisa receber apenas 11 caracteres!' as Alerta;
					end if;
				else
					select 'Os campos nome, cpf, data de nascimento, sexo e endereco são obrigatorios!' as Alerta;
				end if;
			else 
				select 'O CPF informado já existe no sistema!' as Alerta;
			end if;
		else
			select 'O ID de Endereco informado não existe na tabela de origem!' as Alerta;
		end if;
	else
		select 'O ID de Sexo informado não existe na tabela de origem!' as Alerta;
	end if;
end;
$$ delimiter ;

call inserirCliente ('Jackson Henrique', '52956261215', '880075', '1898-06-30', '69 984085712', 'jackson@gmail.com', 1, 4);
call inserirCliente ('Jaqueline Leao', '00747571210', '880075', '1993-06-21', '69 984085712', 'jaque@gmail.com', 1, 5);
call inserirCliente ('William da Silva Matsunaga', '06360238298', '199306', '1993-06-22', '69 984055712', 'will229zica@gmail.com', 1, 3);
call inserirCliente ('Mateus', '00647571210', '880175', '1993-06-28', '69 984585712', 'mateus@gmail.com', 1, 2);
call inserirCliente ('Fernando Sampaio Correa', '00727571210', '810075', '1993-06-29', '69 984084712', 'fag@gmail.com', 1, 5);

#RF5 - Cadastrar Funcionario
delimiter $$
create procedure inserirFuncionario (nome varchar (300), cpf varchar (300), rg varchar (300), nascimento date, 
salario float, funcao varchar (300), contratacao date, celular varchar (300), email varchar (300), sexo int, departamento int, endereco int)
begin
	declare teste_cpf varchar (300);
	declare teste_sexo, teste_endereco, teste_departamento int;
    
    set teste_cpf = (select cpf_fun from funcionario where (cpf_fun = cpf));
	set teste_sexo = (select id_sex from sexo where (id_sex = sexo));
    set teste_endereco = (select id_end from endereco where (id_end = endereco));
	set teste_departamento = (select id_dep from departamento where (id_dep = departamento));

    if (teste_departamento is not null) then
		if (teste_sexo is not null) then
			if (teste_endereco is not null) then
				if (teste_cpf is null) then
					if (nome <> '') and (cpf <> '') and (salario <> '') and (funcao <> '') and (celular <> '') and (email <> '') and (sexo <> '') and (endereco <> '') and (departamento <> '') then
						if (contratacao < curdate()) then
							if (nascimento < curdate()) then
								if (salario > 1412.00) then
									insert into funcionario values (null, nome, cpf, rg, nascimento, salario, funcao, contratacao, celular, email, sexo, departamento, endereco);
									select concat('O funcionario ', nome, ' com CPF ', cpf, ' foi inserido com sucesso!') as Confirmacao;
								else
									select 'O salario nao pode ser inferir a R$ 1.412,00!' as Alerta;
								end if;
							else
								select 'A data de nascimento não pode ser superir a data atual!' as Alerta;
							end if;
						else
							select 'A data de contratacao não pode ser superir a data atual!' as Alerta;
						end if;
					else
						select 'Os campos nome, cpf, salario, funcao, celular, email, departamento, sexo e endereco são obrigatorios!' as Alerta;
					end if;
				else 
					select 'O CPF informado já existe no sistema!' as Alerta;
				end if;
			else
				select 'O ID de Endereco informado não existe na tabela de origem!' as Alerta;
			end if;
		else
			select 'O ID de Sexo informado não existe na tabela de origem!' as Alerta;
		end if;
	else
		select 'O ID do Departamento informado não existe na tabela de origem!' as Alerta;
	end if;
end;
$$ delimiter ;

call inserirFuncionario ('Sonia Bezerra', '527.123.123-10', '123457 SSP', '1965-09-10', 1500.55, 'Atendente', '2022-01-01', '69 9844 4444', 'sonia@gmail.com', 2, 1, 4);
call inserirFuncionario ('Francisco Silva', '123.123.123-20', '54577 SSP', '1968-07-10', 2900.55, 'Motorista', '2022-01-01', '69 98421 1144', 'chico@gmail.com', 1, 4, 5);
call inserirFuncionario ('Ana Maria Santos', '231.323.111-20', '123123 SSP', '1987-09-30', 4900.00, 'Gerente', '2000-02-01', '69 99844 7744', 'ana@gmail.com', 2, 4, 2);
call inserirFuncionario ('Gabriel Braga', '231.767.567-66', '32341 SSP', '1990-09-30', 3200.00, 'Mecanico', '2021-09-01', '69 99844 4787', 'gabriel@gmail.com', 1, 2, 1);

#RF6 - Cadastrar Onibus
delimiter $$
create procedure inserirOnibus (modelo varchar (300), marca varchar (300), placa varchar (300), capacidade int)
begin
	declare teste_placa varchar (300);
	set teste_placa = (select placa_oni from onibus where (placa_oni = placa));
    
	if (modelo <> '') and (placa <> '') and (capacidade <> '') then
		if (teste_placa is null) then
			if (placa regexp '^[a-z]{3}-[0-9]{4}$') then
				if (capacidade = 48) or (capacidade = 60) then
					insert into onibus values (null, modelo, marca, placa, capacidade);
					select concat('O onibus com placa ', placa, ' foi inserido com sucesso!') as Confirmacao;
				else
					select 'Os onibus possuem capacidade restrita a 48 ou 60 poltronas!' as Alerta;
				end if;
			else
				select 'A placa informada não pode ser inserida com máscara. Ex: XXX-1111!' as Alerta;
			end if;
		else
			select 'A placa informada deve possuir apenas 7 caracteres!' as Alerta;
		end if;
	else
		select 'Os campos modelo, placa e capacidade!' as Alerta;
	end if;
end;
$$ delimiter ;

call inserirOnibus ('Marcopolo 1516', 'Marcopolo', 'NDD-1120', 60);
call inserirOnibus ('VW Future', 'Volskwagem', 'NQE-9877', 60);
call inserirOnibus ('Marcopolo 966', 'Marcopolo', 'NPD-1578', 48);
call inserirOnibus ('Mercebes Tourino 2015', 'Mercedes', 'NPQ-8713', 48);

-- RF7 - CADASTRAR POLTRONAS
-- Crie um procedimento para inserir os registros na tabela Poltrona
-- de acordo com as seguintes regras:
-- 1) O procedimento deve receber apenas placa do ônibus,
-- garantindo que seja digitado com a máscara.
-- 2) A partir da placa o procedimento deve verificar se o ônibus
-- informado já possui poltronas cadastradas, para que não
-- sejam cadastrados poltronas em duplicidade para um mesmo
-- ônibus.
-- 3) Garanta que a placa informada exista na base de dados.
-- 4) Crie uma estrutura de repetição para inserir automaticamente
-- as poltronas no ônibus de acordo com a sua capacidade
-- (identificada a partir da placa) do ônibus informado. Cada
-- poltrona deve ser criada com status de ‘livre’;
-- TESTE: Chame o procedimento e insira poltronas para os 04
-- ônibus cadastrados.

delimiter $$

create procedure inserirPoltrona (placa varchar(100))
begin
    declare id_oni int;
    declare test_pol int;
    declare capacidade int;
    declare controle int;

    set controle = 1;

    set id_oni = (select id_oni from onibus where placa_oni = placa limit 1);
	set test_pol = (select count(id_pol) from poltrona where id_oni_fk = id_oni);
    set capacidade = (select capacidade_oni from onibus where placa_oni = placa limit 1);
    
    if (placa like '%-%') then
        if (id_oni is not null) then
            if (test_pol = 0) then
                while (controle <= capacidade) do
                    insert into poltrona values (null, controle, 'Livre', id_oni);
                    set controle = controle + 1;
                end while;
                select 'Poltronas cadastradas com sucesso' as Confirmacao;
            else
                select 'Poltronas já cadastradas para este ônibus' as Alert;
            end if;
        else
            select 'Ônibus não encontrado' as Alert;
        end if;
    else
        select 'Placa em formato incorreto' as Alert;
    end if;
end $$
delimiter ;

call inserirPoltrona('ABC-1234');
call inserirPoltrona('DEF-5678');
call inserirPoltrona('GHI-9012');
call inserirPoltrona('JKL-3456');

-- RF10 - MARCAR POLTRONA
-- Crie um procedimento chamado MarcarPoltrona para atualizar a passagem e a poltrona marcada de acordo com as seguintes regras:
-- 1) Esse procedimento deve receber somente ID da passagem e o número da poltrona (não é o ID) escolhida.
-- 2) Verifique se a poltrona informada está com o status de “Livre”.
-- Caso SIM:
-- Faça um update na poltrona escolhida e altere o seu status para “Ocupada”, informe o usuário com mensagem de confirmação.
-- Atualize a tabela Passagem informando o número da poltrona escolhida;
 -- Caso NÃO:
-- Mensagem 1: Informe ao usuário que a poltrona esta ocupada e peça para escolher outra poltrona;
-- TESTE: Chame o procedimento e marque uma poltrona para cada uma das Passagem vendidas;

delimiter $$
	
begin

end

$$ delimiter;

