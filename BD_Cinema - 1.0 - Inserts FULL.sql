#Banco de Dados do Cinema

-- William da Silva Mamatsunaga

create database bd_cinema_1;
use bd_cinema_1;

create table Cliente(
id_cli int primary key auto_increment,
nome_cli varchar(300),
sexo_cli varchar(100),
data_nasc_cli date,
cpf_cli varchar(100),
rg_cli varchar(100),
email_cli varchar(300),
endereco_cli varchar(300),
telefone_cli varchar(300),
cartao_sus_cli varchar(300),
tipagem_sanguinea_cli varchar(100)
);

create table Fornecedor(
id_forn int primary key auto_increment,
nome_forn varchar(300),
razao_Social_forn varchar(300),
cnpj_forn varchar(300),
endereco_forn varchar(300),
email_forn varchar(300),
telefone_forn varchar(300)
);

create table Despesa(
id_desp int primary key auto_increment,
descricao_desp varchar(300),
valor_desp float,
data_desp date,
parcelas_desp int,
vencimento_desp date
);

create table Funcionario(
id_fun int primary key auto_increment,
nome_fun varchar(300),
cpf_fun varchar(100),
rg_fun varchar (100),
telefone_fun varchar(100),
email_fun varchar(300),
sexo_fun varchar(100),
funcao_fun varchar(300),
salario_fun float,
horario_entrada_fun time,
horario_saida_fun time,
data_nasc_fun date,
carteira_trabalho_fun varchar(300)
);

create table Caixa(
id_cai int primary key auto_increment,
numero_cai int,
data_cai date,
saldo_inicial_cai float,
saldo_final_cai float,
total_recebimentos_cai float,
total_retiradas_cai float,
id_fun_fk int,
foreign key(id_fun_fk) references Funcionario(id_fun)
);

create table Pagamento(
id_pag int primary key auto_increment,
valor_pag float,
data_pag date,
parcela_pag int,
status_pag varchar(300),
forma_pag varchar(300),
id_cai_fk int,
foreign key(id_cai_fk) references Caixa(id_cai),
id_desp_fk int,
foreign key(id_desp_fk) references Despesa(id_desp)
);

create table Filme(
id_film int primary key auto_increment,
titulo_film varchar(300),
sinopse_film varchar(500),
atores_film varchar(300),
diretor_film varchar(300),
genero_film varchar(300),
classificacao_indicativa_film varchar(300),
duracao_film time
);

create table Sala(
id_sala int primary key auto_increment,
nome_sala varchar(300),
numero_sala int,
capacidade_sala varchar(300),
local_sala varchar(300)
);

create table Poltrona(
id_polt int primary key auto_increment,
numero_polt int,
fileira_polt int,
coordenada_polt varchar(100),
status_polt varchar(100),
id_sala_fk int,
foreign key(id_sala_fk) references Sala(id_sala)
);

create table Sessao(
id_ses int primary key auto_increment,
hora_inicio_ses time,
data_ses date,
hora_fim_ses time,
id_sala_fk int,
foreign key(id_sala_fk) references Sala(id_sala),
id_film_fk int,
foreign key(id_film_fk) references Filme(id_film)
);

create table Ingresso(
id_ing int primary key auto_increment,
valor_ing float,
data_ing date,
cod_barras_ing varchar(300),
id_ses_fk int,
foreign key (id_ses_fk) references Sessao (id_ses)
);

create table Venda(
id_vend int primary key auto_increment,
valor_vend float,
hora_vend time,
data_vend date,
id_polt_fk int,
foreign key(id_polt_fk) references Poltrona(id_polt),
id_ing_fk int,
foreign key(id_ing_fk) references Ingresso(id_ing),
id_fun_fk int,
foreign key(id_fun_fk) references Funcionario(id_fun),
id_cli_fk int,
foreign key(id_cli_fk) references Cliente(id_cli)
);

create table Produto(
id_prod int primary key auto_increment,
nome_prod varchar(300),
marca_prod varchar(300),
valor_venda_prod float,
valor_compra_prod float,
estoque_prod int,
tipo_prod varchar(300),
descricao_prod varchar(300)
);

create table Venda_Produto(
id_vend_prod int primary key auto_increment,
qtd_itens_vend_prod int,
valor_vend_prod float,
id_prod_fk int,
foreign key(id_prod_fk) references Produto(id_prod),
id_vend_fk int,
foreign key(id_vend_fk) references Venda(id_vend)
);

create table Compra(
id_comp int primary key auto_increment,
valor_comp float,
hora_comp time,
data_comp date,
id_fun_fk int,
foreign key(id_fun_fk) references Funcionario(id_fun),
id_forn_fk int,
foreign key(id_forn_fk) references Fornecedor(id_forn)
);

create table Compra_Produto(
id_vend_comp int primary key auto_increment,
qtd_itens_comp_prod int,
valor_comp_prod float,
id_prod_fk int,
foreign key(id_prod_fk) references Produto(id_prod),
id_comp_fk int,
foreign key(id_comp_fk) references Compra(id_comp)
);

insert into Cliente values(null, 'Bernardo Sebastião Bruno Mendes', 'Masculino', '1968-06-10','496.702.865-90', '26.671.677-5', 'bernardo_sebastiao_mendes@hotmail.com', 'Rua Barão José Miguel, , Nº 541, Bairro', '(82) 2815-4982', '979612111910003', 'AB+');
insert into Cliente values(null, 'Lúcia Vanessa Moraes', 'Feminino', '1969-04-30', '125.677.389-16', '11.376.596-4', 'lucia_moraes@outlook.com', 'Rua Divino Alcides Santos, nº 610, Bairro Vila Camarim', '(21) 98783-4871', '167091242130001', 'O-');
insert into Cliente values(null, 'Pietro Ian Peixoto', 'Masculino', '1969-12-15', '918.985.672-47', '27.782.916-1', 'pietro.ian.peixoto@gmail.com', 'Rua Pedras Brancas, nº 470, Bairro Nova Esperança', '(47) 98695-3713', '951969232230007', 'B+');
insert into Cliente values(null, 'Eloá Tânia Kamilly Campos', 'Feminino', '1970-06-21', '294.927.666-04', '22.584.593-3', 'eloa-campos74@gmail.com', 'Rua Casa do Ator 783, nº 122, Bairro Vila Olímpia', '(11) 99345-6882', '976843162080002', 'O+');
insert into Cliente values(null, 'Luiz Thales Benjamin Moraes', 'Masculino', '1970-10-23', '844.453.646-65', '25.271.350-3', 'luisthales@gmail.com', null, '(95) 98522-1979', '199969865880005', 'AB+');
insert into Cliente values(null, 'Letícia Lavínia Milena Novaes', 'Feminino', '1971-05-24', '133.117.564-01', '33.585.038-8', 'leticia_novaes@outlook.com', '2ª Travessa Monte Castelo , nº 746, Bairro Vergel do Lago', '(82) 98143-4651', '123616178650000', 'A-');
insert into Cliente values(null, 'Letícia Ana Cardoso', 'Feminino', '1971-08-04', '668.582.130-23', '48.866.840-2', 'leticiaanacardoso@novaes.me', 'Rua Jenner Augusto , nº 529, Bairro Jardins', '(79) 99521-9139', '166375673830005', 'O-');
insert into Cliente values(null, 'Rafaela Fabiana Barbosa', 'Feminino', '1974-09-14', '709.679.918-46', '40.476.313-3', 'rafaela.fabiana.barbosa@gmail.com', 'Rua Ana Landmann , nº 807, Bairro Costa e Silva', '(47) 98438-9246', '287756570020007', 'B+');
insert into Cliente values(null, 'Oliver Juan Nogueira', 'Masculino', '1975-12-23', '513.097.603-73', '35.738.710-7', null, null, null, '863232411560009', 'A+');
insert into Cliente values(null, 'Ruan Bento Kaique Martins', 'Masculino', '1977-01-30', '685.387.530-37', '42.861.955-1', 'ruan@gmail.com', 'Rua México , nº 340, Bairro Baixada da Habitasa', '(95) 98192-2787', '284909243870004', 'B+');
insert into Cliente values(null, 'Ricardo Luis Bastida Tavares', 'Masculino', '1977-07-23', '288.742.147-66', '10.508.678-2', 'ricardo@outlook.com', 'Rua José Suides Rodrigues , nº 607, Bairro Cariacica Sede', '(98) 98126-3417', '137492655440007', 'A+');
insert into Cliente values(null, 'Regiane Thomaz Bastida', 'Feminino', '1978-01-20', '812.107.101-10', '47.701.277-2', 'regiane@outlook.com', 'Rua Negreiros Ferreira , nº 920, Bairro São Francisco', '(22) 96754-6878', '216007669020007', 'B-');
insert into Cliente values(null, 'Dyego Knupp Araujo', 'Masculino', null, '855.544.082-30', '12.813.160-3', 'dyego@outlook.com', 'Praça dos Gerânios , nº 892, Bairro Sobrinho', '(65) 98644-0470', '855217764860006', 'AB+');
insert into Cliente values(null, 'Maurício Antonio Lyrio', 'Masculino', '1982-01-29', '877.764.277-56', '45.303.193-6', 'mauricio@outlook.com', 'Quadra Quadra 24 , nº 357, Bairro 357', '(28) 98992-8252', '230097396700005','O-');
insert into Cliente values(null, 'Rosinalda Esteves Filho', 'Feminino', '1982-08-20', '876.381.597-48', '42.709.465-3', 'rosinalda@outlook.com', 'Passarela Beira Rio , nº 156, Bairro Perpétuo Socorro', '(61) 98676-4546', '189692523100005', 'O+');
insert into Cliente values(null, 'Carolina Jéssica Campos', 'Feminino', '1982-11-09', '024.142.101-25', '31.641.349-5', 'carolina@hotmail.com', 'Rua Manoel Amaro de Matos , nº , Bairro ', '(18) 99946-3761', null, 'O+');
insert into Cliente values(null, 'Nicolas Thomas Gael da Luz', 'Masculino', '1983-12-06', '945.331.054-91', '32.760.673-3', 'nicolas@hotmail.com', 'Rua Dom Augusto , nº 267, Bairro Parque do Lago', '(21) 97498-1047', '743016604490007', 'A-');
insert into Cliente values(null, 'Nei Malaquias Torres', 'Masculino', '1986-03-15', '934.793.995-17', '48.354.127-8', 'nei@hotmail.com', 'Travessa Rio Solimoes , nº 473, Bairro Marabaixo', '(62) 99885-3088', '759286613040005', 'B+');
insert into Cliente values(null, 'Nicholye Firmino Sarmento', 'Feminino', '1987-05-31', '414.752.353-64', '12.683.844-6', 'nicholye@hotmail.com', 'Rua João Leonel Caetano , nº 231, Bairro Jardim Anchieta', '(69) 99563-9277', '820448428370003', 'AB+');
insert into Cliente values(null, 'Elizabetti Moraes Norte', null, '1987-06-04', '146.544.643-52', '47.897.694-X', 'elizabetti@hotmail.com', 'Rua Treze , nº 347, Bairro Bela Vista', '(67) 97576-5125', '224180568550004', 'A-');
insert into Cliente values(null, 'Maria Carmoriz Schuenck', 'Feminino', '1988-04-25', '666.163.406-51', '44.687.787-6', 'mariacar@hotmail.com', 'Rua Ataulfo Alves , nº 368, Bairro Santa Cruz', '(27) 97305-4514', '862446084300003', 'B+');
insert into Cliente values(null, 'Gleice Darmont Araujo', null, '1988-12-13', '336.519.443-60', '26.308.043-2', 'gleice@gmail.com', 'Rua Rio Iguaçu , nº 636, Bairro Cidade de Deus', '(24) 97186-3349', '150216486800004', 'O+');
insert into Cliente values(null, 'Geanny Carmoriz Damasceno', 'Feminino', '1989-07-05', '424.526.290-73', '37.441.958-9', null, 'Rua 02 C , nº 550, Bairro Cidade Operária', '(83) 97398-3721', '883663231370009', 'O+');
insert into Cliente values(null, 'Emanoel Boelho Portugal', 'Masculino', '1996-07-07', '552.429.851-86', '29.314.122-8', 'emanoel@outlook.com', 'Passagem São Francisco Xavier , nº 748, Bairro Coqueiro', '(85) 98135-5389', '237213183950006', 'O-');
insert into Cliente values(null, 'Laudemar Borralho Portugal', 'Masculino', '1996-12-29', '261.226.518-00', '16.783.068-5', 'laudemar@hotmail.com', null, '(63) 99815-9930', '719963354540009', 'AB+');
insert into Cliente values(null, 'Cristiano Bochimpani Rocha', 'Masculino', '1997-03-24', '116.434.757-89', '10.756.692-8', 'cristiano@outlook.com', 'Rua do Pavão , nº 365, Bairro Mecejana', null, '836944930530001', 'B+');
insert into Cliente values(null, 'Ariel Bochimpani Muchão', 'Masculino', '1971-07-04', '851.218.774-39', '17.455.762-0', 'arielbochi@outlook.com', 'Rua dos Cravos , nº 300, Bairro Jardim das Flores', '(18) 97178-4435', '829545680800009', 'B-');
insert into Cliente values(null, 'Margareth Valente Donato', 'Feminino', '1972-01-03', '462.362.618-06', '26.485.379-9', 'margareth@outlook.com', 'Rua Barão da Passagem , nº 676, Bairro Catolé', '(99) 98944-5260', '230857381290003', 'AB+');
insert into Cliente values(null, 'Suellem Uchôa Abreu', 'Feminino', '1972-07-14', '384.911.523-26', '45.863.758-0', 'suellem@gmail.com', 'Rua Mercúrio , nº 667, Bairro Parque Residencial Quinta da Lagoa', '(63) 99295-7476', '223050191450008', 'O-');
insert into Cliente values(null, 'Rita de Souza Muniz', null, null, '324.931.231-23', '48.539.665-8', 'rita@hotmail.com', 'Travessa Gaspar Dutra , nº 867, Bairro Santo Antônio', '(83) 99621-8774', '215726754900002', 'O+');
insert into Cliente values(null, 'Elita Darmont Matta', 'Feminino', '1973-09-10', '372.115.262-03', '24.222.455-6', 'elita@outlook.com', 'Rua dos Donizetes , nº 834, Bairro Itaperi', '(12) 97512-0898', '262538255530000', 'A+');
insert into Cliente values(null, 'Marcus Matos Carvalheiro', 'Masculino', '1974-02-12', '474.601.654-25', '31.610.617-3', 'marcus@hotmail.com', 'Avenida Doutor Humberto de Queiroz Matosso , nº 656, Bairro Sol e Mar', '(24) 98822-2297', '818327480420006', 'B+');
insert into Cliente values(null, 'Rachel da Paixão Lopez', 'Feminino', '1975-06-19', '813.776.496-87', '32.819.194-2', 'rachel@hotmail.com', 'Rua Benoni Falcão de Gouveia , nº 621, Bairro Tribobó', '(95) 99725-0845', '150393086780002', 'AB-');
insert into Cliente values(null, 'Mônica Pontes Alves', 'Feminino', '1978-01-15', '175.314.313-60', '44.628.129-3', 'monicapon@hotmail.com', 'Rua 24 , nº 376, Bairro Vila Velha', '(82) 98684-1851', '819993733130018', 'AB+');
insert into Cliente values(null, 'Osvaldo Terra Teodoro', 'Masculino', '1979-10-20', '827.555.643-00', '38.879.454-9', 'osvaldo@gmail.com', null, '(63) 97110-2165', null, 'O-');
insert into Cliente values(null, 'Ronaldo Paula Viana', 'Masculino', '1980-10-14', '649.384.933-06', '44.741.724-1', 'ronaldo@gmail.com', 'Travessa Urucuri , nº 334, Bairro Zumbi dos Palmares', '(83) 97214-2332', null, 'AB+');
insert into Cliente values(null, 'Luciane Auzier Salomão', 'Feminino', '1980-10-16', '275.236.083-53', '17.354.133-1', 'luciane@gmail.com', 'Rua Doutor Deoplisto Feitosa , nº 143, Bairro Engenheiro Luciano Cavalcante', '(22) 98562-5531', '267132918030018', 'B-');
insert into Cliente values(null, 'Sayonara Mendonça Bochimpani', null, '1985-07-21', '468.728.421-30', '12.402.022-7', 'sayonara@hotmail.com', 'Travessa Euclides Santos , nº 773, Bairro Chã da Jaqueira', '(28) 99837-2213', '889439421880004', 'O-');
insert into Cliente values(null, 'Dora Coelho Camacho', 'Feminino', '1985-09-04', '773.015.565-60', '42.413.605-3', 'doracoelho@outlook.com', 'Praça Professor Apolônio Sales de Miranda , nº 963, Bairro Tambiá', '(97) 98836-4053', '849065433900006', null);
insert into Cliente values(null, 'Wallace Sousa Navega', 'Masculino', '1985-11-06', '136.720.151-99', '25.138.536-X', 'wallace@hotmail.com', 'Rua São Judas Tadeu , nº 884, Bairro Jardim Gonçalves', '(92) 99177-8723', '188502859620007', null);
insert into Cliente values(null, 'Abraão Candido Texeira', 'Masculino', '1986-06-12', '138.491.293-22', '40.427.337-3', null, 'Rua Carlos Rodrigues de Farias , nº 585, Bairro Spar (Inoã)', '(32) 97212-2252', '239290470510001', null);
insert into Cliente values(null, 'Rosane Castro Firmino', 'Masculino', '1987-08-25', '473.768.692-12', '47.526.637-7', 'rosane@hotmail.com', null, '(37) 99547-7151', '704112995700018', 'A+');
insert into Cliente values(null, 'Elias Knupp Albuquerque', null, '1987-10-05', '432.638.560-06', '17.831.187-X', 'elias@hotmail.com', null, '(67) 99106-3355', '883613429670002', 'B+');
insert into Cliente values(null, 'Maria Eliza Carvalho Gomes', 'Feminino', '1989-04-11', '354.647.197-09', '32.672.156-3', 'marieli@gmail.com', null, '(96) 97211-6244', '191514313270006', 'O-');
insert into Cliente values(null, 'Reginaldo Moreira Antunes', 'Masculino', '1992-01-07', '664.657.648-30', '28.151.102-0', 'reginaldomorei@hotmail.com', null, '(67) 97349-5694', '106382302730006', 'B+');
insert into Cliente values(null, 'Adilson Santomauro Barboza', 'Masculino', '1992-04-17', '288.145.225-61', '23.727.611-2', 'adilsonsan@hotmail.com', null, '(83) 97981-7760', '960564458300004', 'B-');
insert into Cliente values(null, 'Rita Livramento Santana', 'Feminino', '1994-09-29', '843.767.216-38', '16.484.888-5', 'ritalivramento@hotmail.com', null, '(68) 98176-5706', '247976942570002', 'O+');
insert into Cliente values(null, 'Sueli Bonimo Sena', 'Feminino', '1996-03-02', '502.453.734-38', '11.147.157-6', 'suelibonimo@outlook.com', null, '(83) 99275-1312', '916039065750006', 'B-');
insert into Cliente values(null, 'Lucas Felipe Biango Pereira', 'Masculino', '1997-04-23', '622.166.557-40', '15.585.402-1', 'lucasfelipe@outlook.com', null, '(63) 98687-0886', '112956483830000', 'A-');
insert into Cliente values(null, 'Vivian Barcelos Vogas', 'Feminino', '1997-09-09', '334.582.463-98', '13.701.243-3', 'vivian@gmail.com', null, '(83) 97481-1156', '179799051240001', 'AB-');
insert into Cliente values(null, 'Lucas Felipe Serra Tavares', 'Masculino', '1996-04-24', '468.822.252-14', '37.324.810-6', 'lucasfeli@hotmail.com', null,null,  '212316297020004', 'AB+');
insert into Cliente values(null, 'Stefany Vilela Garbelini', 'Feminino', '2001-05-12', '529.042.073-84', '28.161.221-3', 'stefanyvi@hotmail.com', null, '(49) 98128-4296', '938222405440000', 'O+');
insert into Cliente values(null, 'Elvis Estellet Diniz', 'Masculino', '2005-06-12', null, '22.860.543-X', 'elvis@hotmail.com', null, '(87) 97913-6673', '261924583840000', 'B+');
insert into Cliente values(null, 'Laysa Vidal Cristo', 'Feminino', '1987-11-15', '736.126.617-79', '35.774.426-3', 'laysa@gmail.com', null, '(44) 97216-6628', '252097573750000', 'O-');
insert into Cliente values(null, 'Wesley Tolentino Moraes', 'Feminino', '1995-10-13', '370.851.224-39', '29.356.710-4', 'wesley@gmail.com', null, '(91) 98818-5608', null, 'B+');
insert into Cliente values(null, 'Norival Mota Milanez', 'Masculino', '1997-11-16', '035.140.933-50', '21.815.501-3', 'norimot@gmail.com', null, '(61) 99639-1888', '185484368850000', null);
insert into Cliente values(null, 'Erika Leonicio Lima', 'Feminino', '1966-06-21', '881.533.326-60', '12.632.274-0', 'erikaleo@outlook.com', null, '(28) 97409-4355', '250100499100008', null);
insert into Cliente values(null, 'Francisca Cormack da Mota', 'Feminino', '1978-08-12', '555.284.221-91', '48.614.035-0', 'francormack@outlook.com', null, '(89) 96956-8348', '170628701880006', 'A-');
insert into Cliente values(null, 'Raquel Anastacio Vidal', 'Feminino', '1987-10-30', '257.868.604-18', '23.496.807-2', 'raqueanas@gmail.com', null, '(98) 97346-5127', null, null);
						   
insert into Fornecedor values(null, 'Pipocas do Sul', 'Pipocas do Sul LTDA', '67.371.964/0001-17', 'Rua da Quadra 25, nº784', 'pipocas@alimentos.com.br', '(45) 55865-2145');
insert into Fornecedor values(null, 'Distribuição Alimentos', 'Distribuição Alimentos LTDA', '37.017.143/0001-16', 'Rua Neto Filho', 'alimentacaodistribuicao@alimentos.com.br', '(63) 22541-2548');
insert into Fornecedor values(null, 'Vale Verde', 'Vale Verde LTDA', '50.578.368/0001-00', 'Rua das Laranjeiras', 'valeverde@alimentos.com.br', '(12) 52545-8962');
insert into Fornecedor values(null, 'Alimentos e Cia', 'Alimentos e Cia LTDA', '50.578.368/0001-00', 'Rua dos Bairros, nº156', 'alimetacao@alimento.com.br', '41169587423');
insert into Fornecedor values(null, 'Energisa', 'Energisa LTDA', '27.637.394/0001-40', 'Rua Almeida Quinn, nº589', 'energisa@energia.com.br', '(15)366985-4754');
insert into Fornecedor values(null, 'Campilar Alimentos', 'Campilar Alimentos SA', '27.637.394/0001-40', null, 'campilaralimentos@empresa.com.br', null);
insert into Fornecedor values(null, 'Bernardo', 'Bernardo Alimentos LTDA', '27.637.394/0001-40', null, 'bernardoalimentos@empresa.com.br', '(69)99847-8741');
insert into Fornecedor values(null, 'Coca-Cola', 'Coca-Cola LTDA', '27.637.394/0001-40', null, 'cocacola@coke.com.br', '(15) 55468-7512');
insert into Fornecedor values(null, 'COMPANHIA DE ÁGUAS E ESGOTOS DO ESTADO', 'CAERD SA', '27.637.394/0001-40', null, 'caerd_ro@esgoto.com.br', '(15) 55847-7856');

insert into Despesa values(null, 'Conta de Água', 1564.58, '2021-03-25', 2, '2021-03-30');
insert into Despesa values(null, 'Compra de pipoca', 723.31, '2021-04-21', 3, '2021-04-30');
insert into Despesa values(null, 'Conta de Luz', 1543.36, '2021-01-31', 1, '2021-02-10');
insert into Despesa values(null, 'Aluguel de Prédio', 5862.63, '2021-08-19', 1, '2021-08-30');
insert into Despesa values(null, 'Encanamento', 4586.12, '2021-10-21', 2, '2021-10-30');

insert into Funcionario values(null, 'Rafaela Isis da Mota', '996.401.378-71', '28.570.443-6', '(24) 3536-4239', 'rafaisis@gmail.com', 'Feminino', 'Atendente', 1500, '07:00:00', '12:00:00', '1974-05-20', '640.18114.67-6');
insert into Funcionario values(null, 'Raquel Emily Duarte', '345.088.764-55', '44.064.825-7', '(79) 2071-1091', 'raqueemily@gmail.com', 'Feminino', 'Atendente', 1520,'07:00:00', '12:00:00', '1975-03-04', '427.18487.12-2');
insert into Funcionario values(null, 'Nathan Oliver Vieira', '031.140.805-29', '42.339.398-4', '(67) 2831-2415', 'nathanoli@gmail.com', 'Masculino', 'Gerente', 2400,'07:00:00', '12:00:00', '1975-04-05', '105.40497.30-2');
insert into Funcionario values(null, 'Nathan Raul Manuel Barros', '922.608.344-42', '35.107.431-4', '(83) 3569-0884', 'nathanraul@hotmail.com', 'Masculino', 'Segurança', 1630, '07:00:00', '12:00:00', '1976-02-16', '995.94006.03-0');
insert into Funcionario values(null, 'Cauã Sebastião Tomás Freitas', '737.437.295-71', '25.332.252-2', '(47) 2948-7438', 'cauasebast@gmail.com', 'Masculino', 'Segurança', 2100,'07:00:00', '12:00:00', '1976-04-04', '954.72645.36-2');
insert into Funcionario values(null, 'Aline Aparecida Rita Bernardes', '054.586.363-50', '11.048.957-3', '(94) 2753-3123', 'alineaparecida@hotmail.com', 'Feminino', 'Segurança', 1800, '', '', '1976-12-12', '373.63278.89-7');
insert into Funcionario values(null, 'Tomás Martin Kauê Caldeira', '675.685.821-16', '21.233.303-3', '(97) 3354-7837', 'tomasmartin@gmail.com', 'Masculino', 'Segurança', 1400,'07:00:00', '12:00:00', '1976-12-18', '121.25238.96-0');
insert into Funcionario values(null, 'Laura Carolina Eduarda Moraes', '852.635.792-17', '43.064.791-8', '(28) 3702-6882', 'lauracarolina@hotmail.com', 'Feminino', 'Segurança', 1630, '12:00:00', '18:00:00', '1978-11-03', '253.61303.59-1');
insert into Funcionario values(null, 'Ryan Enrico Pinto', '048.115.922-39', '16.779.522-3', '(88) 2377-4381', 'ryanenrico@gmail.com', 'Masculino', 'Supervisor', 1500, '12:00:00', '18:00:00', '1982-01-02', '686.38620.16-4');
insert into Funcionario values(null, 'Bento Joaquim Vieira', '032.355.388-52', '33.786.376-3', '(88) 3541-1133', 'bentojoaquim@gmail.com', 'Masculino', 'Supervisor', 1520, '12:00:00', '18:00:00', '1984-10-18', '183.62985.57-4');
insert into Funcionario values(null, 'Gabriel Kevin Fogaça', '355.631.513-01', '47.023.268-7', '(96) 3141-8322', 'gabrielkevin@outlook.com', 'Masculino', 'Zelador', 1800, '12:00:00', '18:00:00', '1986-04-18', '502.51711.83-2');
insert into Funcionario values(null, 'Nathan Danilo Nogueira', '848.958.429-08', '13.662.687-7', '(67) 3304-8517', 'nathandanilo@outlook.com', 'Masculino', 'Zelador', 1400, '12:00:00', '18:00:00', '1988-01-29', '588.85236.11-4');
insert into Funcionario values(null, 'Diego Luís das Neves', '128.112.813-98', '35.752.496-2', '(54) 2474-7245', 'diegoluis@outlook.com', 'Masculino', 'Zelador', 1800, '12:00:00', '18:00:00', '1971-04-21', '760.10075.17-4');
insert into Funcionario values(null, 'Carlos Eduardo Miguel da Silva', '837.844.115-68', '22.210.473-9', '(73) 2963-9262', 'carlosmiguel@gmail.com', 'Masculino', 'Zelador', 3200, '12:00:00', '18:00:00', '1971-11-16', '381.85302.78-8');
insert into Funcionario values(null, 'Nathan Filipe Martins', '357.745.841-00', '46.046.742-6', '(96) 3865-5843', 'nathanfelipe@gmail.com', 'Masculino', 'Auxiliar', 1405, '12:00:00', '18:00:00', '1989-09-13', '862.57097.34-9');
insert into Funcionario values(null, 'Bruna Helena Sarah Caldeira', '832.605.747-94', '36.339.812-0', '(92) 2533-7162', 'brunahelena@gmail.com', 'Feminino', 'Auxiliar', 2400, '18:00:00', '23:00:00', '1990-08-13', '943.65067.64-3');
insert into Funcionario values(null, 'Julio Henry Osvaldo Moreira', '225.767.095-75', '18.826.467-X', '(97) 2223-1324', 'juliohenry@gmail.com', 'Masculino', 'Diretor', 1520, '18:00:00', '23:00:00', '1991-10-18', '422.40050.78-2');
insert into Funcionario values(null, 'Julio Antonio Enzo Duarte', '678.186.117-46', '13.366.216-0', '(64) 2789-5188', 'julioantoni@gmail.com', 'Masculino', 'Segurança', 4210, '18:00:00', '23:00:00', '2001-02-10', '796.12937.17-3');
insert into Funcionario values(null, 'Henrique Carlos Eduardo da Mata', '107.128.529-72', '11.246.726-X', '(65) 2141-7684', 'henriquecarlos@outlook.com', 'Masculino', '', 3120, '18:00:00', '23:00:00', '2001-10-21', '632.36900.62-7');
insert into Funcionario values(null, 'Luana Francisca Pinto', '114.996.442-13', '16.218.306-9', '(61) 2903-0188', 'luanafrancisca@hotmail.com', 'Feminino', 'Contador', 1540, '18:00:00', '23:00:00', '2001-12-28', '516.92086.07-3');

insert into Caixa values(null, 1, '2021-05-01', 0, 2500, 2500, 1562, 1);
insert into Caixa values(null, 5, '2021-05-30', 0, 1900, 1900, 552, 2);
insert into Caixa values(null, 3, '2021-01-23', 0, 6800, 6800, 5465, 4);
insert into Caixa values(null, 2, '2021-08-20', 0, 9823, 9823, 121, 3);
insert into Caixa values(null, 4, '2021-07-05', 0, 15985, 15985, 545, 5);

insert into Pagamento values(null, 564, '2021-05-06', 1, 'aberto', 'Cartão', 1, 2);
insert into Pagamento values(null, 65456, '2021-04-08', 2, 'fechado', 'Boleto', 2, 4);
insert into Pagamento values(null, 545, '2021-10-21', 3, 'aberto', 'Pix', 3, 3);
insert into Pagamento values(null, 5145, '2021-11-30', 1, 'fechado', 'Boleto',5 , 1);
insert into Pagamento values(null, 4452, '2021-07-09', 2, 'fechado', 'Cartão', 4, 5);

insert into Filme values(null, 'Doutor Estranho no Multiverso da Loucura', null, 'Benedict Cumberbatch, Elizabeth Olsen, Chiwetel Ejiofor', 'Sam Raimi', 'Ação, Aventura, Fantasia', '14+', '02:06:00');
insert into Filme values(null, 'Sonic 2 - O Filme', null, 'Jim Carrey, James Marsden, Idris Elba', 'Jeff Fowler', 'Aventura, Animação, Família', '10+', '02:02:00');
insert into Filme values(null, 'O Homem do Norte', null, 'Alexander Skarsgård, Nicole Kidman, Claes Bang', 'Robert Eggers', 'Ação, Histórico', '18+', '02:17:00');
insert into Filme values(null, 'Animais Fantásticos: Os Segredos de Dumbledore', null, 'Eddie Redmayne, Jude Law, Mads Mikkelsen', 'David Yates', ' Aventura, Fantasia', '18+', '02:10:00');
insert into Filme values(null, 'O Peso do Talento', null, 'Nicolas Cage, Pedro Pascal, Alessandra Mastronardi', ' Tom Gormican', 'Ação, Comédia', '16+', '02:05:00');
insert into Filme values(null, 'Detetives do Prédio Azul 3 - Uma Aventura no Fim do Mundo', null, 'Pedro Henriques Motta, Letícia Braga, Anderson Lima', 'Mauro Lima', 'Aventura, Família', 'Livre', '01:42:00');
insert into Filme values(null, 'Cidade Perdida', null, 'Sandra Bullock, Channing Tatum, Daniel Radcliffe', 'Aaron Nee, Adam Nee', ' Ação, Aventura, Comédia', '16+', '01:52:00');
insert into Filme values(null, 'Jujutsu Kaisen 0: O Filme', null, 'Megumi Ogata, Kana Hanazawa, Mikako Komatsu', null, ' Ação, Animação, Drama', '18+', '01:45:00');
insert into Filme values(null, 'Meu AmigãoZão - O Filme', null, null, 'Andrés Lieban', 'Aventura, Animação, Família', 'Livre', '01:17:00');
insert into Filme values(null, 'Crocodilos – A Morte Te Espera', null, 'Jessica McNamee, Luke Mitchell, Amali Golden', 'Andrew Traucki', 'Ação, Terror', '18+', '01:38:00');
insert into Filme values(null, 'Medida Provisória', null, 'Taís Araújo, Alfred Enoch, Seu Jorge', 'Lázaro Ramos', 'Drama', '18+', '01:34:00');
insert into Filme values(null, 'Águas Selvagens', null, 'Roberto Birindelli, Mayana Neiva, Allana Lopes', 'Roly Santos', 'Policial', '18+', '01:43:00');
insert into Filme values(null, 'Downton Abbey II: Uma Nova Era', null, 'Hugh Bonneville, Michelle Dockery, Elizabeth McGovern', 'Simon Curtis', 'Drama, Histórico', '16+', '02:00:00');
insert into Filme values(null, 'A Fratura', null, 'Valeria Bruni Tedeschi, Marina Foïs, Pio Marmaï', 'Catherine Corsini', 'Comédia dramática, Drama', '14+', '01:39:00');
insert into Filme values(null, 'A Pior Pessoa do Mundo', null, 'Renate Reinsve, Anders Danielsen Lie, Herbert Nordrum', 'Joachim Trier', 'Comédia, Drama', '16+', '02:08:00');
insert into Filme values(null, 'Klondike: A Guerra na Ucrânia', null, 'Oksana Cherkashyna, Evgeniy Efremov, Sergiy Shadrin', 'Maryna Er Gorbach', 'Drama', '18+', '01:40:00');
insert into Filme values(null, '@Arthur.Rambo - Ódio nas redes', null, 'Rabah Naït Oufella, Antoine Reinartz, Sofian Khammes', 'Laurent Cantet', 'Drama', '16+', '01:18:00');
insert into Filme values(null, 'A Noite do Triunfo', null, 'Kad Merad, David Ayala, Lamine Cissokho', 'Emmanuel Courcol', 'Comédia', '16+', '01:46:00');
insert into Filme values(null, 'Como Matar a Besta', null, 'Ana Brun, João Miguel', 'Agustina San Martín', 'Drama, Fantasia, Suspense', '18+', '01:45:00');
insert into Filme values(null, 'Vitalina Varela', null, null, null, 'Drama', '18+', ':00');
insert into Filme values(null, 'Drive My Car', null, 'Hidetoshi Nishijima, Toko Miura, Masaki Okada', null, 'Drama, Romance', '18+', '02:01:00');
insert into Filme values(null, 'Tre Piani', null, null, null, 'Comédia, Comédia dramática, Drama', null, '02:02:00');
insert into Filme values(null, 'Um Conto de Amor e Desejo', null, 'Sami Outalbali, Aurélia Petit, Bellamine Abdelmalek', 'Leyla Bouzid', 'Drama, Romance', '18+', '02:00:00');
insert into Filme values(null, 'Paris, 13º Distrito', null, 'Lucie Zhang, Makita Samba, Noémie Merlant', 'Jacques Audiard', null, null, '01:46:00');
insert into Filme values(null, 'Um Divã na Tunísia', null, 'Golshifteh Farahani, Majd Mastoura, Aïcha Ben Miled', 'Manele Labidi', 'Comédia, Drama', '14+', '01:29:00');
insert into Filme values(null, 'Flee - Nenhum Lugar Para Chamar de Lar', null, null, 'Jonas Poher Rasmussen', ' Animação, Documentário', '10+', '01:23:00');
insert into Filme values(null, 'Nunca mais nevará', null, 'Alec Utgoff, Maja Ostaszewska, Agata Kulesza', 'Malgorzata Szumowska, Michal Englert', 'Comédia, Comédia dramática, Drama', '16+', '01:47:00');
insert into Filme values(null, 'Sibyl', null, 'Virginie Efira, Adèle Exarchopoulos, Sandra Hüller', 'Justine Triet', 'Drama', '14+', '01:48:00');
insert into Filme values(null, 'Aznavour por Charles', null, 'Charles Aznavour, Romain Duris', null, 'Biopic, Documentário', null, '02:05:00');
insert into Filme values(null, 'Fim de Festa', null, 'Irandhir Santos, Gustavo Patriota, Amanda Beça', 'Hilton Lacerda', 'Drama', '18+', '01:50:00');
insert into Filme values(null, 'A felicidade das pequenas coisas', null, null, 'Pawo Choyning Dorji', 'Aventura, Drama, Família', 'Livre', '01:38:00');
insert into Filme values(null, 'Madalena', null, 'Joana Castro, Natália Mazarim, Pamela Yulle', 'Madiano Marcheti', 'Drama', '16+', '01:29:00');
insert into Filme values(null, 'Doutor Estranho', null, 'Benedict Cumberbatch, Chiwetel Ejiofor, Tilda Swinton', 'Scott Derrickson', null, '14+', '02:04:00');
insert into Filme values(null, 'Benedetta', null, 'Virginie Efira, Charlotte Rampling, Daphne Patakia', 'Paul Verhoeven', 'Drama, Histórico, Romance', '16+', '01:41:00');
insert into Filme values(null, 'Pássaros de Verão', null, 'José Acosta, Carmiña Martínez, Jhon Narváez', 'Ciro Guerra, Cristina Gallego', 'Drama, Suspense', '18+', '02:08:00');
insert into Filme values(null, 'Morbius', null, 'Jared Leto, Matt Smith (XI), Adria Arjona', 'Daniel Espinosa', 'Ação, Aventura, Fantasia', '16+', '01:45:00');
insert into Filme values(null, 'Retablo', null, null, 'Álvaro Delgado-Aparicio', 'Drama', '16+', '01:45:00');
insert into Filme values(null, 'A Hora do Show', null, 'Sarah Jones (III), Thomas Jefferson Byrd, Jason Bernard', 'Spike Lee', 'Comédia dramática, Musical', '10+', '02:02:00');
insert into Filme values(null, 'A Mulher de um Espião', null, ' Yû Aoi, Masahiro Higashide, Yuri Tsunematsu', 'Kiyoshi Kurosawa', 'Drama, Histórico', null, '01:48:00');
insert into Filme values(null, 'Mar de Dentro', null, 'Monica Iozzi, Rafael Losso, Gilda Nomacce', 'Dainara Toffoli', 'Drama', '16+', '02:04:00');
insert into Filme values(null, 'O Segundo Rosto', null, ' Rock Hudson, Will Geer, John Randolph', 'John Frankenheimer', 'Drama, Ficção Científica, Suspense', '18+', '01:45:00');
insert into Filme values(null, 'Fallen Angels', null, 'Charlie Yeung, Takeshi Kaneshiro, Leon Lai', 'Wong Kar-Wai', 'Policial, Romance', '18+', '02:21:00');
insert into Filme values(null, 'O Homem Elefante', null, 'Anthony Hopkins, John Hurt, Anne Bancroft', 'David Lynch', 'Biopic, Drama', '16+', '01:45:00');
insert into Filme values(null, 'O Casamento de Maria Braun', null, 'Hanna Schygulla, Klaus Löwitsch, Ivan Desny', null, 'Drama', '18+', '02:03:00');
insert into Filme values(null, 'Amor à Flor da Pele', null, 'Maggie Cheung, Tony Leung Chiu-Wai, Rebecca Pan', 'Wong Kar-Wai', 'Drama, Romance', '18+', '01:58:00');
insert into Filme values(null, 'Cicatrizes', null, 'Snezana Bogdanovic, Jovana Stojiljkovic, Vesna Trivalic', 'Miroslav Terzic', 'Drama, Suspense', '14+', '01:45:00');
insert into Filme values(null, 'Adam', null, 'Lubna Azabal, Nisrin Erradi, Douae Belkhaouda', 'Maryam Touzani', 'Drama', '18+', '01:48:00');
insert into Filme values(null, 'No Ritmo do Coração', null, 'Emilia Jones, Marlee Matlin, Eugenio Derbez', null, null, '16+', '01:57:00');

insert into Sala values(null, 'Sala 1', 1, 150, 'Primeiro andar');
insert into Sala values(null, 'Sala 2', 2, 150, 'Primeiro andar');
insert into Sala values(null, 'Sala 3', 3, 120, 'Primeiro andar');
insert into Sala values(null, 'Sala 4', 4, 100, 'Segundo Andar');
insert into Sala values(null, 'Sala 5', 5, 150, 'Segundo Andar');

insert into Poltrona values(null, 1, 1, '(1,1)', 'livre', 1);
insert into Poltrona values(null, 5, 7, '(7,5)', 'ocupada', 2);
insert into Poltrona values(null, 78, 21, '(78,21)', 'livre', 3);
insert into Poltrona values(null, 42, 11, '(42,11)', 'livre', 5);
insert into Poltrona values(null, 53, 10, '(53,10)', 'ocupada', 4);

insert into Sessao values(null, '08:00:00', '2021-01-10', '10:00:00', 1, 1);
insert into Sessao values(null, '10:00:00', '2021-01-15', '12:00:00', 5, 3);
insert into Sessao values(null, '12:00:00', '2021-01-20', '14:00:00', 3, 4);
insert into Sessao values(null, '18:00:00', '2021-01-25', '20:00:00', 2, 2);
insert into Sessao values(null, '20:00:00', '2021-01-30', '22:00:00', 4, 5);

insert into Ingresso values(null, 20, '2021-01-10', '1584796542589', 1);
insert into Ingresso values(null, 22, '2021-01-10', '145874586954', 1);
insert into Ingresso values(null, 20, '2021-01-10', '120120125469', 1);
insert into Ingresso values(null, 11.50, '2021-01-15', '012560145236', 2);
insert into Ingresso values(null, 16, '2021-01-15', '012541202563', 2);
insert into Ingresso values(null, 20, '2021-01-15', '210214520125', 2);
insert into Ingresso values(null, 22, '2021-01-20', '201365410215', 3);
insert into Ingresso values(null, 25, '2021-01-25', '101021236521', 4);
insert into Ingresso values(null, 22, '2021-01-30', '100102136541', 5);
insert into Ingresso values(null, 20, '2021-01-30', '254103652148', 5);

insert into Venda values(null, 156, '11:21:00', '2021-05-06', 2, 3, 1, 2);
insert into Venda values(null, 154, '15:10:22', '2021-04-08', 3, 2, 2, 3);
insert into Venda values(null, 111, '18:25:15', '2021-02-03', 4, 5, 5, 4);
insert into Venda values(null, 153, '20:15:23', '2021-12-06', 5, 1, 4, 1);
insert into Venda values(null, 456, '20:00:54', '2021-11-05', 1, 4, 3, 5);

insert into Produto values(null, 'Pipoca', 'Yoki', 20.41, 10.25, 12, 'Comida', 'Pacote de pipoca 500g');
insert into Produto values(null, 'Refrigerante', 'Tuchaua', 8.32, 10.30, 35, 'Bebida', 'Refrigerante 2L');
insert into Produto values(null, 'Pipoca doce', 'Bernardo', 15.32, 24.10, 65, 'Comida', null);
insert into Produto values(null, 'Batata frita', 'Yoki', 10.21, 50.10, 14, 'Comida', 'pacote de 25g');
insert into Produto values(null, 'Paçoca', 'Bernardo', 4.91, 15.14, 41, 'Comida', null);

insert into Venda_Produto values(null, 15, 54, 1, 2);
insert into Venda_Produto values(null, 456, 45, 2, 5);
insert into Venda_Produto values(null, 63, 25, 5, 4);
insert into Venda_Produto values(null, 4, 68, 4, 1);
insert into Venda_Produto values(null, 41, 67, 3, 3);

insert into Compra values(null, 152, '16:05:23', '2021-12-30', 1, 2);
insert into Compra values(null, 456, '06:25:11', '2021-10-12', 4, 3);
insert into Compra values(null, 153, '21:23:23', '2021-06-05', 3, 5);
insert into Compra values(null, 485, '15:26:56', '2021-04-08', 2, 4);
insert into Compra values(null, 698, '14:15:06', '2021-09-07', 5, 1);

insert into Compra_Produto values(null, 14, 456, 1, 1);
insert into Compra_Produto values(null, 25, 237, 5, 4);
insert into Compra_Produto values(null, 75, 7897, 3, 2);
insert into Compra_Produto values(null, 36, 4563, 4, 3);
insert into Compra_Produto values(null, 30, 548, 2, 5);

-- 1) Analise o banco de dados e normalize o atributo Endereço presente nas entidades Cliente e Fornecedor. 
-- Saiba que funcionário também possui endereço, logo precisa dessa informação. Saiba que endereço
-- precisa cumprir a 3FN, assim, cidade deve estar em uma tabela a parte. Ao final do processo de
-- normalização, lembre-se de excluir os atributos simples de endereço afim de evitar a redundância de dados.
-- A migração dos dados é opcional, ou seja, não precisa fazer os updates para preencher as FKs.

CREATE TABLE cidade (
	id_cid INT PRIMARY KEY AUTO_INCREMENT,
	nome_cid VARCHAR(300) NOT NULL
);

CREATE TABLE endereco(
	id_end INT PRIMARY KEY AUTO_INCREMENT,
    rua_end VARCHAR (300),
    bairro_end varchar (300),
    numero_end varchar (300),
    id_cid_fk INT NOT NULL,
    FOREIGN KEY (id_cid_fk) REFERENCES cidade (id_cid)
);

ALTER TABLE cliente ADD COLUMN id_end INT;
ALTER TABLE cliente ADD FOREIGN KEY (id_end) REFERENCES endereco(id_end);
ALTER TABLE cliente DROP COLUMN endereco_cli;

ALTER TABLE fornecedor ADD COLUMN id_end INT;
ALTER TABLE fornecedor ADD FOREIGN KEY (id_end) REFERENCES endereco(id_end);
ALTER TABLE fornecedor DROP COLUMN endereco_forn;

ALTER TABLE funcionario ADD COLUMN id_end INT;
ALTER TABLE funcionario ADD FOREIGN KEY (id_end) REFERENCES endereco(id_end);

SELECT * FROM fornecedor;

-- 2) Normalize o atributo Sexo presente cliente e funcionario. Você deverá 
-- obrigatoriamente fazer a migração de dados, ou seja, preencher as FKs de sexo.
-- Lembre-se de excluir os atributos simples de sexo afim de evitar a redundância de dados. 

CREATE TABLE sexo (
	id_sex INT PRIMARY KEY AUTO_INCREMENT,
    sex_sex VARCHAR(50) NOT NULL
);

INSERT INTO sexo (sex_sex) VALUES ('Masculino');
INSERT INTO sexo (sex_sex) VALUES ('Feminino');

ALTER TABLE Cliente ADD COLUMN id_sex_fk INT;
ALTER TABLE Cliente ADD FOREIGN KEY (id_sex_fk) REFERENCES sexo(id_sex);

ALTER TABLE Funcionario ADD COLUMN id_sex_fk INT;
ALTER TABLE Funcionario ADD FOREIGN KEY (id_sex_fk) REFERENCES sexo(id_sex);

UPDATE cliente c JOIN sexo s ON c.sexo_cli = s.sex_sex SET c.id_sex_fk = s.id_sex;
SET SQL_SAFE_UPDATES = 0;
UPDATE Funcionario f JOIN sexo s ON f.sexo_fun = s.sex_sex SET f.id_sex_fk = s.id_sex;

SELECT nome_cli, sexo_cli, id_sex_fk FROM cliente;
SELECT nome_fun, sexo_fun, id_sex_fk FROM funcionario;

ALTER TABLE cliente DROP COLUMN sexo_cli;
ALTER TABLE funcionario DROP COLUMN sexo_fun;

-- 3) Liste todos os clientes cujo nome comece com a letra A, que sejam do sexo masculino, 
-- tenham nascido entre os anos de 1990 e 2005, possuam e-mail que termine em @gmail.com, 
-- apresentem CPF preenchido (não nulo), tenham telefone com o DDD 69 e cuja tipagem sanguínea
-- seja A+ ou O+.

SELECT * FROM cliente c JOIN sexo s ON c.id_sex_fk = s.id_sex WHERE nome_cli LIKE 'A%'
AND sex_sex = 'Masculino' AND data_nasc_cli BETWEEN '1990-01-01' AND '2005-12-31'
AND email_cli LIKE '%@gmail.com' AND cpf_cli IS NOT NULL AND telefone_cli LIKE '(69)%'
AND (tipagem_sanguinea_cli = 'A+' OR tipagem_sanguinea_cli = 'O+');

-- 4. Liste todos os funcionários que recebam salário entre 2000 e 5000 reais, 
-- possuam função que contenha a palavra Atendente, sejam do sexo masculino ou 
-- feminino, tenham e-mail terminado em .com.br, nasceram após 01/01/1985, entrem 
-- no trabalho antes das 09:00 horas, possuam número de carteira de trabalho informado 
-- (não vazio ou nulo) e cujo nome contenha a letra S.

SELECT * FROM funcionario f JOIN sexo s ON f.id_sex_fk = s.id_sex WHERE salario_fun BETWEEN 2000 AND 5000
AND funcao_fun LIKE '%Atendente%' AND email_fun LIKE '%.com.br' AND data_nasc_fun > '1985-01-01'
AND f.horario_entrada_fun < '09:00:00' AND f.carteira_trabalho_fun IS NOT NULL AND carteira_trabalho_fun <> ''
AND LOWER(nome_fun) LIKE '%s%';

-- 5. Liste todos os produtos cujo valor de venda esteja entre 10 e 50 reais, possuam estoque
-- superior a 100 unidades, sejam do tipo Bebida ou Doce, tenham nome contendo a palavra Coca,
-- cuja marca não seja Genérica, cujo valor de compra seja menor que o valor de venda, cujo -
-- nome termine em Zero e cuja descrição contenha a palavra lata.

SELECT * FROM produto WHERE valor_venda_prod IN ('Bebida', 'Doce') AND estoque_prod > 100
AND tipo_prod BETWEEN 'Doce' AND 'Bebida' AND nome_prod LIKE '%Coca%' AND marca_prod
!= 'Genérica' AND valor_compra_prod < valor_venda_prod AND nome_prod LIKE '%Zero'
AND descricao_prod LIKE '%lata%'; 

-- 6. Liste todos os filmes que pertençam aos gêneros Ação, Comédia ou Drama, cujo título
-- contenha a letra O ou letra A, que não sejam classificados como 18 anos, tenham duração
-- entre 1h e 2h30, cujo diretor comece com a letra J, cujo título termine com a
-- letra A ou E e cuja lista de atores contenha aos termos PE ou AN .

SELECT * FROM Filme WHERE genero_film IN ('Ação', 'Comédia', 'Drama') AND (titulo_film LIKE '%O%' OR titulo_film LIKE '%A%')
AND classificacao_indicativa_film <> '18 anos' AND duracao_film BETWEEN '01:00:00' AND '02:30:00' AND diretor_film LIKE 'J%'
AND (titulo_film LIKE '%A' OR titulo_film LIKE '%E') AND (atores_film LIKE '%PE%' OR atores_film LIKE '%AN%');

-- 7. Liste todas as vendas cujo valor esteja entre 30 e 500 reais, realizadas após as
-- 14:00 horas, ocorridas no ano de 2024 ou 2025, vinculadas a um cliente existente
-- (FK preenchida), efetuadas por funcionários de id 1, 2 ou 3, cujo valor não seja exatamente
-- 100 reais, e cuja poltrona esteja entre 1 a 10.

SELECT * FROM venda WHERE valor_vend between 30 AND 500 and hora_vend > '14:00:00' AND 
data_vend BETWEEN '2024-01-01' AND '2025-12-31' AND id_cli_fk IS NOT NULL 
and id_fun_fk IN (1,2,3) AND id_polt_fk BETWEEN 1 AND 10;

-- 8. Liste todas as sessões realizadas no ano de 2025, cuja hora de início esteja entre
-- 18:00 e 22:00, cuja hora de término seja maior que 20:00, vinculadas a filmes de 
-- id 2, 3 ou 5, que não estejam em salas de id 4 ou 6, cujo término seja anterior
-- a 23:59, cujo início não seja exatamente às 19:00 horas e termine antes das 23:00.

SELECT * FROM sessao WHERE data_ses BETWEEN '2025-01-01' AND '2025-12-31'
AND hora_inicio_ses BETWEEN '18:00:00' AND '22:00:00' AND hora_inicio_ses <> '19:00:00'
AND hora_fim_ses > '20:00:00' AND hora_fim_ses < '23:00:00' AND id_film_fk IN (2, 3, 5)
AND id_sala_fk NOT IN (4, 6);

-- 9. Liste todas as despesas cujo valor esteja entre 500 e 3000 reais, que tenham 3
-- parcelas ou mais, cuja data de lançamento esteja no ano de 2024, cuja descrição contenha
-- a palavra energia, cujo vencimento seja posterior a 01/06/2024, cujo valor não seja
-- exatamente 1000 reais, cuja descrição não contenha a palavra Agua ou Luz e cujo número
-- de parcelas seja inferior a 12.

SELECT * FROM Despesa WHERE valor_desp BETWEEN 500 AND 3000 AND valor_desp <> 1000
AND parcelas_desp >= 3 AND parcelas_desp < 12 AND data_desp BETWEEN '2024-01-01' AND '2024-12-31'
AND descricao_desp LIKE '%energia%' AND descricao_desp NOT LIKE '%Agua%'
AND descricao_desp NOT LIKE '%Luz%' AND vencimento_desp > '2024-06-01';

-- 10. Liste todos os fornecedores cujo nome comece com a letra C, que possuam e-mail contendo
-- o caractere @, cujo CNPJ não inicie com 00, cujo telefone comece com 69, cuja razão social 
-- contenha a expressão LTDA, cujo nome não termine em ME e cujo e-mail termine em .com.

SELECT * FROM Fornecedor WHERE nome_forn LIKE 'C%' AND email_forn LIKE '%@%'
AND cnpj_forn NOT LIKE '00%' AND telefone_forn LIKE '69%'
AND razao_Social_forn LIKE '%LTDA%' AND nome_forn NOT LIKE '%ME'
AND email_forn LIKE '%.com';

-- 11. Liste todos os ingressos cujo valor esteja entre 20 e 60 reais, cuja data esteja no
-- ano de 2025, cujo código de barras contenha a sequência 123, vinculados a alguma sessão 
-- existente, cujo valor não seja 35 nem 45 reais, cuja data seja posterior ao mês de junho, 
-- cujo valor seja maior que 25 reais e cujo código de barras termine em 9.

SELECT * FROM ingresso WHERE valor_ing between 20 and 60 and data_ing between '2025-01-01' and
'2025-12-31' AND cod_barras_ing LIKE '%123%' and id_ses_fk IS NOT NULL and valor_ing <> 35 and
valor_ing <> 45 and data_ing < '2025-06-30' and valor_ing > 25 and cod_barras_ing like '%9';




 

