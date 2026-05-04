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

drop procedure inserirEndereco;

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