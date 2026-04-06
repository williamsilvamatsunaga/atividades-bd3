#bd mecanica 9.0

-- William da Silva Matsunaga

create database bd_mecanica_9;
use bd_mecanica_9;
SET SQL_SAFE_UPDATES = 0;

create table estado (
id_est int not null primary key auto_increment,
nome_est varchar (200) not null,
sigla_est varchar (2) not null,
regiao_est varchar (300)
);

insert into estado values (null, 'Acre', 'AC', 'Norte');
insert into estado values (null, 'Alagoas', 'AL', 'Nordeste');
insert into estado values (null, 'Amapá', 'AP', 'Norte');
insert into estado values (null, 'Amazonas', 'AM', 'Norte');
insert into estado values (null, 'Bahia', 'BA', 'Nordeste');
insert into estado values (null, 'Ceará', 'CE', 'Nordeste');
insert into estado values (null, 'Distrito Federal', 'DF', 'Centro-Oeste');
insert into estado values (null, 'Espírito Santo', 'ES', 'Sudeste');
insert into estado values (null, 'Goiás', 'GO', 'Centro-Oeste');
insert into estado values (null, 'Maranhão', 'MA', 'Nordeste');
insert into estado values (null, 'Mato Grosso', 'MT', 'Centro-Oeste');
insert into estado values (null, 'Mato Grosso do Sul', 'MS', 'Centro-Oeste');
insert into estado values (null, 'Minas Gerais', 'MG', 'Sudeste');
insert into estado values (null, 'Pará', 'PA', 'Norte');
insert into estado values (null, 'Paraíba', 'PB', 'Nordeste');
insert into estado values (null, 'Paraná', 'PR', 'Sul');
insert into estado values (null, 'Pernambuco', 'PE', 'Nordeste');
insert into estado values (null, 'Piauí', 'PI', 'Nordeste');
insert into estado values (null, 'Rio de Janeiro', 'RJ', 'Sudeste');
insert into estado values (null, 'Rio Grande do Norte', 'RN', 'Nordeste');
insert into estado values (null, 'Rio Grande do Sul', 'RS', 'Sul');
insert into estado values (null, 'Rondônia', 'RO', 'Norte');
insert into estado values (null, 'Roraima', 'RR', 'Norte');
insert into estado values (null, 'Santa Catarina', 'SC', 'Sul');
insert into estado values (null, 'São Paulo', 'SP', 'Sudeste');
insert into estado values (null, 'Sergipe', 'SE', 'Nordeste');
insert into estado values (null, 'Tocantins', 'TO', 'Norte');

create table cidade (
id_cid int not null primary key auto_increment,
nome_cid varchar (200) not null,
id_est_fk int,
foreign key (id_est_fk) references estado (id_est)
);

-- Rondonia
insert into cidade values (null, 'ji-paraná', 22);
insert into cidade values (null, 'porto velho', 22);
insert into cidade values (null, 'vilhena', 22);
insert into cidade values (null, 'ariquemes', 22);
insert into cidade values (null, 'jaru', 22);
insert into cidade values (null, 'guajará-mirim ', 22);
insert into cidade values (null, 'colorado do oeste', 22);
insert into cidade values (null, 'ouro preto do oeste', 22);
insert into cidade values (null, 'pimenta bueno', 22);

-- Acre
insert into cidade values (null, 'Rio Branco', 1);
insert into cidade values (null, 'Cruzeiro do Sul', 1);
insert into cidade values (null, 'Feijó', 1);
insert into cidade values (null, 'Tarauacá', 1);
insert into cidade values (null, 'Sena Madureira', 1);

-- Alagoas
insert into cidade values (null, 'Maceió', 2);
insert into cidade values (null, 'Arapiraca', 2);
insert into cidade values (null, 'Palmeira dos Índios', 2);
insert into cidade values (null, 'Rio Largo', 2);
insert into cidade values (null, 'União dos Palmares', 2);

-- Amapá
insert into cidade values (null, 'Macapá', 3);
insert into cidade values (null, 'Santana', 3);
insert into cidade values (null, 'Laranjal do Jari', 3);
insert into cidade values (null, 'Oiapoque', 3);
insert into cidade values (null, 'Porto Grande', 3);

-- Amazonas
insert into cidade values (null, 'Manaus', 4);
insert into cidade values (null, 'Parintins', 4);
insert into cidade values (null, 'Itacoatiara', 4);
insert into cidade values (null, 'Manacapuru', 4);
insert into cidade values (null, 'Coari', 4);

-- Bahia
insert into cidade values (null, 'Salvador', 5);
insert into cidade values (null, 'Feira de Santana', 5);
insert into cidade values (null, 'Vitória da Conquista', 5);
insert into cidade values (null, 'Camaçari', 5);
insert into cidade values (null, 'Itabuna', 5);
-- Ceará
insert into cidade values (null, 'Fortaleza', 6);
insert into cidade values (null, 'Caucaia', 6);
insert into cidade values (null, 'Juazeiro do Norte', 6);
insert into cidade values (null, 'Maracanaú', 6);
insert into cidade values (null, 'Sobral', 6);

-- Distrito Federal
insert into cidade values (null, 'Brasília', 7);

-- Espírito Santo
insert into cidade values (null, 'Vitória', 8);
insert into cidade values (null, 'Vila Velha', 8);
insert into cidade values (null, 'Cariacica', 8);
insert into cidade values (null, 'Serra', 8);
insert into cidade values (null, 'Linhares', 8);

-- Goiás
insert into cidade values (null, 'Goiânia', 9);
insert into cidade values (null, 'Aparecida de Goiânia', 9);
insert into cidade values (null, 'Anápolis', 9);
insert into cidade values (null, 'Rio Verde', 9);
insert into cidade values (null, 'Luziânia', 9);

-- Maranhão
insert into cidade values (null, 'São Luís', 10);
insert into cidade values (null, 'Imperatriz', 10);
insert into cidade values (null, 'São José de Ribamar', 10);
insert into cidade values (null, 'Caxias', 10);
insert into cidade values (null, 'Timon', 10);
-- Mato Grosso
insert into cidade values (null, 'Cuiabá', 11);
insert into cidade values (null, 'Várzea Grande', 11);
insert into cidade values (null, 'Rondonópolis', 11);
insert into cidade values (null, 'Sinop', 11);
insert into cidade values (null, 'Tangará da Serra', 11);

-- Mato Grosso do Sul
insert into cidade values (null, 'Campo Grande', 12);
insert into cidade values (null, 'Dourados', 12);
insert into cidade values (null, 'Três Lagoas', 12);
insert into cidade values (null, 'Corumbá', 12);
insert into cidade values (null, 'Ponta Porã', 12);

-- Minas Gerais
insert into cidade values (null, 'Belo Horizonte', 13);
insert into cidade values (null, 'Uberlândia', 13);
insert into cidade values (null, 'Contagem', 13);
insert into cidade values (null, 'Juiz de Fora', 13);
insert into cidade values (null, 'Betim', 13);

-- Pará
insert into cidade values (null, 'Belém', 14);
insert into cidade values (null, 'Ananindeua', 14);
insert into cidade values (null, 'Santarém', 14);
insert into cidade values (null, 'Marabá', 14);
insert into cidade values (null, 'Castanhal', 14);

-- Paraíba
insert into cidade values (null, 'João Pessoa', 15);
insert into cidade values (null, 'Campina Grande', 15);
insert into cidade values (null, 'Santa Rita', 15);
insert into cidade values (null, 'Patos', 15);
insert into cidade values (null, 'Bayeux', 15);
-- Mato Grosso
insert into cidade values (null, 'Cuiabá', 11);
insert into cidade values (null, 'Várzea Grande', 11);
insert into cidade values (null, 'Rondonópolis', 11);
insert into cidade values (null, 'Sinop', 11);
insert into cidade values (null, 'Tangará da Serra', 11);

-- Mato Grosso do Sul
insert into cidade values (null, 'Campo Grande', 12);
insert into cidade values (null, 'Dourados', 12);
insert into cidade values (null, 'Três Lagoas', 12);
insert into cidade values (null, 'Corumbá', 12);
insert into cidade values (null, 'Ponta Porã', 12);

-- Minas Gerais
insert into cidade values (null, 'Belo Horizonte', 13);
insert into cidade values (null, 'Uberlândia', 13);
insert into cidade values (null, 'Contagem', 13);
insert into cidade values (null, 'Juiz de Fora', 13);
insert into cidade values (null, 'Betim', 13);

-- Pará
insert into cidade values (null, 'Belém', 14);
insert into cidade values (null, 'Ananindeua', 14);
insert into cidade values (null, 'Santarém', 14);
insert into cidade values (null, 'Marabá', 14);
insert into cidade values (null, 'Castanhal', 14);

-- Paraíba
insert into cidade values (null, 'João Pessoa', 15);
insert into cidade values (null, 'Campina Grande', 15);
insert into cidade values (null, 'Santa Rita', 15);
insert into cidade values (null, 'Patos', 15);
insert into cidade values (null, 'Bayeux', 15);
-- Paraná
insert into cidade values (null, 'Curitiba', 16);
insert into cidade values (null, 'Londrina', 16);
insert into cidade values (null, 'Maringá', 16);
insert into cidade values (null, 'Ponta Grossa', 16);
insert into cidade values (null, 'Cascavel', 16);

-- Pernambuco
insert into cidade values (null, 'Recife', 17);
insert into cidade values (null, 'Jaboatão dos Guararapes', 17);
insert into cidade values (null, 'Olinda', 17);
insert into cidade values (null, 'Caruaru', 17);
insert into cidade values (null, 'Paulista', 17);

-- Piauí
insert into cidade values (null, 'Teresina', 18);
insert into cidade values (null, 'Parnaíba', 18);
insert into cidade values (null, 'Picos', 18);
insert into cidade values (null, 'Campo Maior', 18);
insert into cidade values (null, 'Floriano', 18);

-- Rio de Janeiro
insert into cidade values (null, 'Rio de Janeiro', 19);
insert into cidade values (null, 'São Gonçalo', 19);
insert into cidade values (null, 'Duque de Caxias', 19);
insert into cidade values (null, 'Nova Iguaçu', 19);
insert into cidade values (null, 'Niterói', 19);

-- Rio Grande do Norte
insert into cidade values (null, 'Natal', 20);
insert into cidade values (null, 'Mossoró', 20);
insert into cidade values (null, 'Parnamirim', 20);
insert into cidade values (null, 'São Gonçalo do Amarante', 20);
insert into cidade values (null, 'Ceará-Mirim', 20);
-- Rio Grande do Sul
insert into cidade values (null, 'Porto Alegre', 21);
insert into cidade values (null, 'Caxias do Sul', 21);
insert into cidade values (null, 'Pelotas', 21);
insert into cidade values (null, 'Santa Maria', 21);
insert into cidade values (null, 'Canoas', 21);

-- Roraima
insert into cidade values (null, 'Boa Vista', 23);
insert into cidade values (null, 'Rorainópolis', 23);
insert into cidade values (null, 'Caracaraí', 23);
insert into cidade values (null, 'Mucajaí', 23);
insert into cidade values (null, 'São João da Baliza', 23);

-- Santa Catarina
insert into cidade values (null, 'Florianópolis', 24);
insert into cidade values (null, 'Joinville', 24);
insert into cidade values (null, 'Blumenau', 24);
insert into cidade values (null, 'São José', 24);
insert into cidade values (null, 'Lages', 24);

-- São Paulo
insert into cidade values (null, 'São Paulo', 25);
insert into cidade values (null, 'Guarulhos', 25);
insert into cidade values (null, 'Campinas', 25);
insert into cidade values (null, 'São Bernardo do Campo', 25);
insert into cidade values (null, 'Santo André', 25);

-- Sergipe
insert into cidade values (null, 'Aracaju', 26);
insert into cidade values (null, 'Nossa Senhora do Socorro', 26);
insert into cidade values (null, 'Lagarto', 26);
insert into cidade values (null, 'Itabaiana', 26);
insert into cidade values (null, 'São Cristóvão', 26);

-- Tocantins
insert into cidade values (null, 'Palmas', 27);
insert into cidade values (null, 'Araguaína', 27);
insert into cidade values (null, 'Gurupi', 27);
insert into cidade values (null, 'Porto Nacional', 27);
insert into cidade values (null, 'Paraíso do Tocantins', 27);


create table endereco (
id_end integer not null primary key auto_increment,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
id_cid_fk int not null,
foreign key (id_cid_fk) references cidade (id_cid)
); 

insert into endereco values (null, 'av. brasil', 111, 'nova brasília', 1);
insert into endereco values (null, 'av. marechal rondon', 1245, 'centro', 1);
insert into endereco values (null, 'rua dr. telma rios', 1174, 'colina park i', 1);
insert into endereco values (null, 'av. aracaju', 911, 'bnh', 1);
insert into endereco values (null, 'rua 07 de setembro', 121,'centro',  1);
insert into endereco values (null, 'rua mato grosso', 887, 'dom bosco', 1);
insert into endereco values (null, 'av. jorge teixeira', 1589, 'centro', 2);
insert into endereco values (null, 'av. paulista', 989, 'centro', 11);
insert into endereco values (null, 'travessa dos mineiros', 456, 'centro', 4);
insert into endereco values (null, 'av. monte castelo', 555, 'jardim dos migrantes', 1);
insert into endereco values (null, 'av. aracaju', 5111, 'nova brasilia', 1);
insert into endereco values (null, 'av. monte castelo', 9999, 'jardim dos migrantes', 1);
insert into endereco values (null, 'rua x', 12, 'jardim dos migrantes', 1);
insert into endereco values (null, 'k-0', 522, 'são francisco', 1);
insert into endereco values (null, 'av. monte castelo', 11229, 'jardim dos migrantes', 1);
insert into endereco values (null, 'rua das flores', 456, 'jardim das flores', 2);
insert into endereco values (null, 'av. dos ipês', 789, 'parque das árvores', 3);
insert into endereco values (null, 'travessa dos cravos', 231, 'jardim das rosas', 4);
insert into endereco values (null, 'rua das violetas', 876, 'parque floral', 5);
insert into endereco values (null, 'av. das begônias', 543, 'jardim primavera', 6);
insert into endereco values (null, 'travessa das orquídeas', 112, 'parque das tulipas', 7);
insert into endereco values (null, 'rua dos lírios', 789, 'jardim das margaridas', 8);
insert into endereco values (null, 'av. das dálias', 456, 'parque das hortênsias', 9);
insert into endereco values (null, 'travessa das azaleias', 231, 'jardim das camélias', 10);
insert into endereco values (null, 'rua dos girassóis', 876, 'parque dos girassóis', 11);
insert into endereco values (null, 'av. das acácias', 543, 'jardim das palmeiras', 12);
insert into endereco values (null, 'travessa dos manacás', 112, 'parque dos manacás', 13);
insert into endereco values (null, 'rua das bromélias', 789, 'jardim das bromélias', 14);
insert into endereco values (null, 'av. das laranjeiras', 456, 'parque das laranjeiras', 15);
insert into endereco values (null, 'travessa das goiabeiras', 231, 'jardim das goiabeiras', 16);
insert into endereco values (null, 'rua dos abacaxis', 876, 'parque dos abacaxis', 17);
insert into endereco values (null, 'av. das pitangas', 543, 'jardim das pitangas', 18);
insert into endereco values (null, 'travessa dos cajueiros', 112, 'parque dos cajueiros', 19);
insert into endereco values (null, 'rua das mangueiras', 789, 'jardim das mangueiras', 20);
insert into endereco values (null, 'av. das jabuticabeiras', 456, 'parque das jabuticabeiras', 21);


create table sexo (
id_sex int not null primary key auto_increment,
nome_sex varchar (100) not null
);

insert into sexo values (null, 'masculino');
insert into sexo values (null, 'feminino');

create table cliente (
id_cli integer not null primary key auto_increment,
nome_cli varchar (200) not null,
estado_civil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
data_nascimento_cli date,
renda_familiar_cli float,
telefone_cli varchar (50),
celular_cli varchar (50) not null,
email_cli varchar (500),
id_sex_fk integer not null,
id_end_fk integer not null,
foreign key (id_sex_fk) references sexo (id_sex),
foreign key (id_end_fk) references endereco (id_end)
);

insert into cliente values (null, 'rodrigo hilbert', 'casado', '111.111.111-11', '54654 sesdec', '1987-06-30', 10000.00, '69 84085712', '69 84111111', 'rodrigo@gmail.com', 1, 3);
insert into cliente values (null, 'tiago lacerda', 'casado', '111.111.111-22', '54654 sesdec',  '1965-1-1', 456454.45, '', '', 'lacerda@hotmail.com', 1, 8);
insert into cliente values (null, 'tom cruise', 'solteiro', '111.111.111-33', '48877 sesdec',  '1950-05-30', 0.00, '11 454546511', 'cruise@gmail.com', '', 1, 1);
insert into cliente values (null, 'josé pereiro da silva', 'casado', '222.222.222-88', '8888888 spp',  '1990-11-12', 900.00, '69 88998899', '69 4444 4444', 'silva@yahoo.com', 1, 4);
insert into cliente values (null, 'maria de jesus dos santos', 'solteira', '554.454.444-99', '99999 sesdec',  '1993-06-21', 3000.00, '69 3421 5511', '69 99111111', 'santos@gmail.com', 2, 3);
insert into cliente values (null, 'camila de oliveira', 'casada', '987.123.654-55', '8889999 sesdec',  '2000-12-12', 5450.00, '69 3421 1122', '69 9999 7788', 'camila@gmail.com', 2, 10);
insert into cliente values (null, 'marcos araujo de souza', 'casado', '654.789.123-88', '998877 sesdec',  '1970-01-01', 6845.00, '69 84085712', '69 84111111', 'souza@gmail.com', 1, 9);
insert into cliente values (null, 'cleiton batista ferraz', 'solteiro', '321.111.222-44', '1234312 sesdec',  '1982-07-30', 4199.00, '69 3421 2211', '69 84118811', 'cleiton@gmail.com', 1, 2);
insert into cliente values (null, 'eliana da cruz', 'solteira', '988.235.654-54', '12345 sesdec',  '1978-11-11', 3250.00, '69 3421 9999', '69 84118811', 'cruz@hotmail.com', 2, 5);
insert into cliente values (null, 'igor garcia da silva', 'solteiro', '123.445.888-99', '999992 sesdec',  '1989-12-30', 9600.00, '69 3421 1123', '69 84118811', 'igor@hotmail.com', 1, 11);
insert into cliente values (null, 'jackson henrique da silva bezerra', 'casado', '529.562.612-15', '880075 sesdec',  '1987-06-30', 11000.00, '', '69 84085712', 'jackson@gmail.com', 1, 3);
insert into cliente values (null, 'jaqueline leão pereira', 'casada', '522.222.153-15', '12315 sesdec', '1993-06-21', 11000.00, null, '69 984210921', 'leao@yahoo.com', 2, 3);
insert into cliente values (null, 'gleicy borgio', 'casada', '126.777.888-99', null, null, 5000.00, null, '69 84888899', 'borgio@gmail.com.br', 2, 11);
insert into cliente values (null, 'diego da silva bezerra', 'solteiro', '111.987.123-55', null, null, 3999.99, null, '69 88997722', 'bezerra@gmail.com', 1, 15);
insert into cliente values (null, 'murilo benicio', 'casado', '321.123.321-55', null, null, 2450.80, null, '11 2121 1111', 'benicio@gmail.com', 1, 8);
insert into cliente values (null, 'ana clara oliveira da silva', 'solteira', '454.272.333-44', '12345 sesdec', '1995-03-15', 7800.00, '69 3421 3344', '69 98888 7766', 'ana@ifro.edu.br', 2, 6);
insert into cliente values (null, 'ana clara oliveira', 'solteira', '111.222.333-44', '12345 sesdec', '1995-03-15', 7800.00, '69 3421 3344', '69 98888 7766', 'clara@gmail.com', 2, 6);
insert into cliente values (null, 'pedro henrique almeida', 'casado', '555.666.777-88', '998877 sesdec', '1980-08-22', 6500.00, '69 3421 5566', '69 84123 9876', 'almeida@gmail.com', 1, 9);
insert into cliente values (null, 'isabela pereira', 'solteira', '987.654.321-01', '12345 sesdec', '1992-05-10', 4200.00, '69 3421 8899', '69 99222 3344', 'isabela@gmail.com', 2, 5);
insert into cliente values (null, 'lucas souza', 'solteiro', '123.456.789-10', '54321 sesdec', '1988-11-03', 8900.00, '69 3421 2233', '69 87654 3210', 'souza@gmail.com', 2, 7);
insert into cliente values (null, 'gabriela silva', 'casada', '987.654.321-98', '8889999 sesdec', '1997-02-20', 5500.00, '69 3421 7788', '69 84123 5678', 'silva@hotmail.com', 1, 10);
insert into cliente values (null, 'ricardo martins', 'solteiro', '123.987.456-32', '87654 sesdec', '1985-09-17', 7600.00, '69 3421 1122', '69 99000 1122', 'martins@gmail.com', 2, 4);
insert into cliente values (null, 'carla santos', 'casada', '654.987.321-45', '876543 sesdec', '1975-12-01', 4800.00, '69 3421 5566', '69 84123 3333', 'santos@gmail.com', 1, 8);
insert into cliente values (null, 'roberto mendes', 'solteiro', '159.357.852-46', '998877 sesdec', '1991-04-12', 6200.00, '69 3421 8899', '69 99222 3344', 'mendes@hotmail.com', 2, 6);
insert into cliente values (null, 'marina costa', 'casada', '987.654.321-00', '12345 sesdec', '1983-07-25', 7100.00, '69 3421 3344', '69 98888 7766', null, 1, 5);
insert into cliente values (null, 'felipe rocha', 'solteiro', '258.369.147-00', '54321 sesdec', '1994-10-08', 5800.00, '69 3421 5566', '69 84123 9876', 'rocha@gmail.com', 2, 3);
insert into cliente values (null, 'lara alves', 'casada', '852.963.741-22', '87654 sesdec', '1986-02-14', 6800.00, '69 3421 2233', '69 87654 3210', 'lara@hotmail.com', 1, 9);
insert into cliente values (null, 'pedro martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1998-05-27', 8100.00, '69 3421 8899', '69 99222 3344', 'martins@ifro.edu.br', 2, 7);
insert into cliente values (null, 'larissa rodrigues', 'solteira', '987.654.321-98', '8889999 sesdec', '1984-09-30', 5900.00, '69 3421 7788', '69 84123 5678', 'larissa@gmail.com', 1, 10);
insert into cliente values (null, 'rafael pereira', 'casado', '123.987.456-32', '87654 sesdec', '1996-12-11', 7200.00, '69 3421 1122', '69 99000 1122', 'pereira@hotmail.com', 2, 4);
insert into cliente values (null, 'amanda santos', 'solteira', '654.987.321-45', '876543 sesdec', '1972-03-05', 5000.00, '69 3421 5566', '69 84123 3333', 'santos@gmail.com', 1, 8);
insert into cliente values (null, 'vinicius mendes', 'casado', '159.357.852-46', '998877 sesdec', '1999-06-18', 6700.00, '69 3421 8899', '69 99222 3344', 'mendes@hotmail.com', 2, 6);
insert into cliente values (null, 'thais costa', 'solteira', '987.654.321-00', '12345 sesdec', '1981-08-21', 4900.00, '69 3421 3344', '69 98888 7766', 'costa@gmail.com', 1, 5);
insert into cliente values (null, 'bruno rocha', 'casado', '258.369.147-00', '54321 sesdec', '1990-11-14', 6400.00, '69 3421 5566', '69 84123 9876', 'rocha@gmail.com', 2, 3);
insert into cliente values (null, 'mariana alves', 'solteira', '852.963.741-22', '87654 sesdec', '1979-02-28', 7500.00, '69 3421 2233', '69 87654 3210', 'alves@gmail.com', 1, 9);
insert into cliente values (null, 'eduardo martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1987-05-12', 9200.00, '69 3421 8899', '69 99222 3344', 'martins@gmail.com', 2, 7);
insert into cliente values (null, 'carol rodrigues', 'casada', '987.654.321-98', '8889999 sesdec', '1995-08-25', 6300.00, '69 3421 7788', '69 84123 5678', 'carol@gmail.com', 1, 10);
insert into cliente values (null, 'andre pereira', 'solteiro', '123.987.456-32', '87654 sesdec', '1982-11-06', 7900.00, '69 3421 1122', '69 99000 1122', 'andre@hotmail.com', 2, 4);
insert into cliente values (null, 'luana santos', 'casada', '654.987.321-45', '876543 sesdec', '1993-02-19', 5300.00, '69 3421 5566', '69 84123 3333', null, 1, 8);
insert into cliente values (null, 'rodrigo mendes', 'solteiro', '159.357.852-46', '998877 sesdec', '1988-05-03', 7100.00, '69 3421 8899', '69 99222 3344', 'mendes@gmail.com', 2, 6);
insert into cliente values (null, 'ana costa', 'casada', '987.654.321-00', '12345 sesdec', '1977-08-16', 6800.00, '69 3421 3344', '69 98888 7766', null, 1, 5);
insert into cliente values (null, 'pedro rocha', 'solteiro', '258.369.147-00', '54321 sesdec', '1992-11-29', 5900.00, '69 3421 5566', '69 84123 9876', 'pedro@gmail.com', 2, 3);
insert into cliente values (null, 'isabela alves', 'casada', '852.963.741-22', '87654 sesdec', '1974-04-10', 7500.00, '69 3421 2233', '69 87654 3210', null, 1, 9);
insert into cliente values (null, 'lucas martins', 'solteiro', '123.456.789-10', '54321 sesdec', '1989-07-23', 8400.00, '69 3421 8899', '69 99222 3344', null, 2, 7);
insert into cliente values (null, 'gabriela rodrigues', 'solteira', '987.654.321-98', '8889999 sesdec', '1996-10-06', 6200.00, '69 3421 7788', '69 84123 5678', null, 1, 10);
insert into cliente values (null, 'ricardo pereira', 'casado', '123.987.456-32', '87654 sesdec', '1976-01-18', 7800.00, '69 3421 1122', '69 99000 1122', 'rick@gmail.com', 2, 4);
insert into cliente values (null, 'carla alves', 'solteira', '654.987.321-45', '876543 sesdec', '1990-04-01', 5300.00, '69 3421 5566', '69 84123 3333', 'alves@gmail.com', 1, 8);
insert into cliente values (null, 'roberto rocha', 'casado', '159.357.852-46', '998877 sesdec', '1983-07-14', 6900.00, '69 3421 8899', '69 99222 3344', null, 2, 6);
insert into cliente values (null, 'marina rodrigues', 'solteira', '987.654.321-00', '12345 sesdec', '1978-10-27', 5000.00, '69 3421 3344', '69 98888 7766', null, 1, 5);
insert into cliente values (null, 'felipe almeida', 'casado', '258.369.147-00', '54321 sesdec', '1995-01-09', 6400.00, '69 3421 5566', '69 84123 9876', null, 2, 3);
insert into cliente values (null, 'lara martins', 'solteira', '852.963.741-22', '87654 sesdec', '1980-04-22', 7700.00, '69 3421 2233', '69 87654 3210', null, 1, 9);
insert into cliente values (null, 'pedro mendes', 'solteiro', '123.456.789-10', '54321 sesdec', '1998-07-05', 9200.00, '69 3421 8899', '69 99222 3344', 'mendes@gmail.com', 2, 7);
insert into cliente values (null, 'larissa pereira', 'casada', '987.654.321-98', '8889999 sesdec', '1985-10-18', 6900.00, '69 3421 7788', '69 84123 5678', 'pereira@gmail.com', 1, 10);
insert into cliente values (null, 'rafael alves', 'solteiro', '123.987.456-32', '87654 sesdec', '1997-01-30', 8300.00, '69 3421 1122', '69 99000 1122', null, 2, 4);
insert into cliente values (null, 'amanda rocha', 'casada', '654.987.321-45', '876543 sesdec', '1971-05-12', 5600.00, '69 3421 5566', '69 84123 3333', 'rocha@gmail.com', 1, 8);
insert into cliente values (null, 'vinicius rocha', 'solteiro', '159.357.852-46', '998877 sesdec', '1994-08-25', 7200.00, '69 3421 8899', '69 99222 3344', 'v@gmail.com', 2, 6);
insert into cliente values (null, 'thais pereira', 'solteira', '987.654.321-00', '12345 sesdec', '1982-11-07', 5500.00, '69 3421 3344', '69 98888 7766', null, 1, 5);
insert into cliente values (null, 'bruno almeida', 'casado', '258.369.147-00', '54321 sesdec', '1991-02-20', 6700.00, '69 3421 5566', '69 84123 9876', null, 2, 3);
insert into cliente values (null, 'mariana martins', 'solteira', '852.963.741-22', '87654 sesdec', '1973-05-04', 7400.00, '69 3421 2233', '69 87654 3210', null, 1, 9);
insert into cliente values (null, 'eduardo mendes', 'solteiro', '123.456.789-10', '54321 sesdec', '1986-08-17', 9100.00, '69 3421 8899', '69 99222 3344', null, 2, 7);
insert into cliente values (null, 'carol alves', 'casada', '987.654.321-98', '8889999 sesdec', '1999-11-30', 5900.00, '69 3421 7788', '69 84123 5678', null, 1, 10);
insert into cliente values (null, 'andre rocha', 'solteiro', '123.987.456-32', '87654 sesdec', '1975-02-12', 7600.00, '69 3421 1122', '69 99000 1122', null, 2, 4);
insert into cliente values (null, 'luana alves', 'casada', '654.987.321-45', '876543 sesdec', '1992-05-25', 5200.00, '69 3421 5566', '69 84123 3333', null, 1, 8);
insert into cliente values (null, 'rodrigo rocha', 'solteiro', '159.357.852-46', '998877 sesdec', '1987-08-08', 6800.00, '69 3421 8899', '69 99222 3344', null, 2, 6);
insert into cliente values (null, 'ana rodrigues', 'casada', '987.654.321-00', '12345 sesdec', '1979-11-21', 7500.00, '69 3421 3344', '69 98888 7766', null, 1, 5);
insert into cliente values (null, 'pedro almeida', 'solteiro', '258.369.147-00', '54321 sesdec', '1994-02-03', 6200.00, '69 3421 5566', '69 84123 9876', null, 2, 3);


create table carro (
id_car int primary key not null auto_increment,
modelo_car varchar (100) not null,
cor_car varchar (50) not null,
portas_car varchar (50),
placa_car varchar (50) not null,
marca_car varchar (50) not null,
id_cli_fk int not null,
foreign key (id_cli_fk) references cliente (id_cli)
);

insert into carro values (null, 'gol 1.0', 'preto', '4 portas', 'ndr 2815', 'volkswagen', 1);
insert into carro values (null, 'palio 1.0', 'branco', '4 portas', 'nea 1231', 'fiat', 2);
insert into carro values (null, 'gol 1.0', 'preto', '4 portas', 'wat 1254', 'volkswagen', 3);
insert into carro values (null, 's-10', 'prata', '2 portas', 'eae 2815', 'gm', 4);
insert into carro values (null, 'celta spirit 1.0', 'branco', '4 portas', 'ndd 2815', 'gm', 5);
insert into carro values (null, 'celta life 1.0', 'vermelho', '2 portas', 'mra 1288', 'gm', 6);
insert into carro values (null, 'hilux 2.4', 'prata', '4 portas', 'rtu 3498', 'toyota', 7);
insert into carro values (null, 'prisma ltz', 'branco', '4 portas', 'oip 1231', 'gm', 8);
insert into carro values (null, 'hilux 2.4', 'branco', '4 portas', 'asd 1234', 'toyota', 9);
insert into carro values (null, 'hb-20', 'preto', '4 portas', 'ndt 1155', 'hunday', 10);
insert into carro values (null, 'hilux 2.4', 'prata', '4 portas', 'noo 2010', 'toyota', 1);
insert into carro values (null, 'gol 1.6', 'branco', '4 portas', 'nnd 2066', 'volkswagen', 7);
insert into carro values (null, 'cruze ltz 1.8', 'preto', '4 portas', 'ndm 2819', 'gm', 11);
insert into carro values (null, 'cruze ltz 1.8', 'branco', '4 portas', 'nra 2233', 'gm', 5);
insert into carro values (null, 'celta spirit 1.0', 'branco', '4 portas', 'ndr 2233', 'gm', 12);
insert into carro values (null, 'onix 1.0', 'azul', '4 portas', 'abc 4567', 'gm', 3);
insert into carro values (null, 'uno 1.4', 'vermelho', '4 portas', 'xyz 7890', 'fiat', 4);
insert into carro values (null, 'corolla 2.0', 'prata', '4 portas', 'qwe 2345', 'toyota', 2);
insert into carro values (null, 'sandero 1.6', 'preto', '4 portas', 'poi 9876', 'renault', 6);
insert into carro values (null, 'fox 1.0', 'amarelo', '4 portas', 'lkj 3456', 'volkswagen', 8);
insert into carro values (null, 'etios 1.5', 'verde', '4 portas', 'zxc 6789', 'toyota', 9);
insert into carro values (null, 'uno 1.0', 'azul', '4 portas', 'qaz 1234', 'fiat', 10);
insert into carro values (null, 'siena 1.4', 'prata', '4 portas', 'wsx 5678', 'fiat', 1);
insert into carro values (null, 'onix 1.6', 'preto', '4 portas', 'edc 4321', 'gm', 7);
insert into carro values (null, 'hb-20 1.0', 'branco', '4 portas', 'rfv 8765', 'hunday', 5);
insert into carro values (null, 'fiesta 1.0', 'azul', '4 portas', 'abc 4567', 'ford', 3);
insert into carro values (null, 'sandero 1.4', 'vermelho', '4 portas', 'xyz 7890', 'renault', 4);
insert into carro values (null, 'civic 2.0', 'prata', '4 portas', 'qwe 2345', 'honda', 2);
insert into carro values (null, 'hb-20 1.6', 'preto', '4 portas', 'poi 9876', 'hunday', 6);
insert into carro values (null, 'fusca 1.6', 'amarelo', '2 portas', 'lkj 3456', 'volkswagen', 8);
insert into carro values (null, 'ranger 2.5', 'verde', '4 portas', 'zxc 6789', 'ford', 9);
insert into carro values (null, 'uno 1.0', 'azul', '4 portas', 'qaz 1234', 'fiat', 10);
insert into carro values (null, 'siena 1.4', 'prata', '4 portas', 'wsx 5678', 'fiat', 1);
insert into carro values (null, 'onix 1.6', 'preto', '4 portas', 'edc 4321', 'gm', 7);
insert into carro values (null, 'etios 1.5', 'branco', '4 portas', 'rfv 8765', 'toyota', 5);
insert into carro values (null, 'golf 1.0', 'azul', '4 portas', 'abc 9876', 'volkswagen', 3);
insert into carro values (null, 'corolla 1.8', 'vermelho', '4 portas', 'xyz 2345', 'toyota', 4);
insert into carro values (null, 'prisma 1.4', 'prata', '4 portas', 'qwe 7890', 'gm', 2);
insert into carro values (null, 'ka 1.0', 'preto', '4 portas', 'poi 2345', 'ford', 6);
insert into carro values (null, 's-10 2.8', 'amarelo', '2 portas', 'lkj 8765', 'gm', 8);
insert into carro values (null, 'fiat 500 1.0', 'verde', '2 portas', 'zxc 4321', 'fiat', 9);
insert into carro values (null, 'celta 1.0', 'azul', '4 portas', 'qaz 5678', 'gm', 10);
insert into carro values (null, 'voyage 1.6', 'prata', '4 portas', 'wsx 1234', 'volkswagen', 1);
insert into carro values (null, 'fit 1.5', 'preto', '4 portas', 'edc 5678', 'honda', 7);
insert into carro values (null, 'uno 1.4', 'branco', '4 portas', 'rfv 8765', 'fiat', 5);


create table departamento (
id_dep integer not null primary key auto_increment,
nome_dep varchar (100),
descricao_dep varchar (300)
);

insert into departamento values (null, 'vendas', 'venda de peças e serviços');
insert into departamento values (null, 'financeiro', 'controle financeiro e caixa');
insert into departamento values (null, 'entrega', 'entregar peças');
insert into departamento values (null, 'mecânica', 'realizar manutenção em veículos');
insert into departamento values (null, 'administração', 'gestão da empresa');

create table cargo (
id_carg int primary key auto_increment,
nome_carg varchar (300),
atribuicoes_carg varchar (500)
);

insert into cargo values (null, 'gerente', 'gestao operacional da empresa.');
insert into cargo values (null, 'vendedor(a)', 'vender produtos e servicos.');
insert into cargo values (null, 'mecanico', 'consertar veiculos.');
insert into cargo values (null, 'assistente de caixa', 'receber vendas no caixa.');
insert into cargo values (null, 'entregador(a)', 'entregar produtos conforme vendas.');


create table funcionario (
id_func integer not null primary key auto_increment,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
data_nascimento_func date,
salario_func double not null,
telefone_func varchar (50),
celular_func varchar (50) not null,
id_carg_fk integer not null,
id_sex_fk integer not null,
id_dep_fk integer not null,
id_end_fk integer not null,
foreign key (id_carg_fk) references cargo (id_carg),
foreign key (id_sex_fk) references sexo (id_sex),
foreign key (id_dep_fk) references departamento (id_dep),
foreign key (id_end_fk) references endereco (id_end)
);

insert into funcionario values (null, 'joão batista', '123.544.311-99', '22222 sesdec', '1988-10-30', 5000.00, '', '69 84111155', 1, 1, 5, 3);
insert into funcionario values (null, 'marcos garcia souza', '565.888.988-88', '64444 sesdec', '1965-1-20', 45000.00, '', '', 2, 1, 1, 8);
insert into funcionario values (null, 'leticia de jesus', '998.999.789-55', '46666 sesdec', '1990-05-23', 1500.00, '11 454546511', '', 2, 2, 1, 10);
insert into funcionario values (null, 'mateus solano ', '522.222.232-08', '65655 spp', '1990-11-30', 900.00, '69 8855 5544', '69 5555 4444', 3, 1, 4, 4);
insert into funcionario values (null, 'roger da silva', '123.589.978-77', null, '1987-11-11', 1100.00, null, '69 9988 7788', 3, 1, 4, 11);
insert into funcionario values (null, 'ana pereira silva', '987.987.788-88', null, '1985-11-22', 1000.50, null, '69 8888 7777', 4, 2, 2, 1);
insert into funcionario values (null, 'isaias queiroz', '123.121.321-88', '87788 sesdec', '1980-11-30', 2000.00, null, '69 8877 88881', 5, 1, 3, 7);
insert into funcionario values (null, 'ana clara oliveira', '543.987.654-99', '77777 spp', '1995-07-15', 3000.00, '69 8888 1234', '69 9999 5678', 1, 2, 5, 9);
insert into funcionario values (null, 'pedro henrique santos', '876.543.210-11', '12345 spp', '1982-02-18', 6000.00, '69 8765 4321', '69 9876 5432', 2, 1, 3, 2);
insert into funcionario values (null, 'carla fernandes', '654.321.098-77', '11111 spp', '1998-06-09', 2500.00, '69 8765 4321', '69 9876 5432', 3, 2, 1, 5);
insert into funcionario values (null, 'lucas oliveira santos', '987.654.321-00', '99999 spp', '1993-12-05', 4000.00, '69 8877 1234', '69 9999 5678', 4, 1, 2, 12);
insert into funcionario values (null, 'camila pereira', '123.456.789-01', '55555 spp', '1991-04-20', 3500.00, '69 8765 4321', '69 9876 5432', 5, 2, 4, 6);
insert into funcionario values (null, 'vitor da silva', '987.654.123-33', '44444 spp', '1988-09-28', 2800.00, '69 8877 1234', '69 9999 5678', 1, 1, 3, 3);
insert into funcionario values (null, 'amanda santos', '111.222.333-44', '66666 spp', '1980-03-15', 3200.00, '69 8765 4321', '69 9876 5432', 2, 2, 2, 9);
insert into funcionario values (null, 'leonardo souza', '555.888.777-00', '77777 spp', '1987-07-01', 4200.00, '69 8877 1234', '69 9999 5678', 3, 1, 5, 4);
insert into funcionario values (null, 'caroline oliveira', '444.555.666-99', '12345 spp', '1997-11-10', 2700.00, '69 8765 4321', '69 9876 5432', 4, 2, 1, 8);
insert into funcionario values (null, 'gustavo rodrigues', '777.888.999-11', '33333 spp', '1989-05-30', 3800.00, '69 8877 1234', '69 9999 5678', 5, 1, 4, 11);


create table fornecedor (
id_forn integer not null primary key auto_increment,
razao_social_forn varchar (200),
nome_fantasia_forn varchar (100),
cnpj_forn varchar (100),
representante_forn varchar (100),
contato_forn varchar (300),
id_end_fk integer not null,
foreign key (id_end_fk) references endereco (id_end)
);

insert into fornecedor values (null, 'gm motors ltda', 'chevrolet gm', '00.000.001/0001-91', 'tony', null, 5);
insert into fornecedor values (null, 'fiat ltda', 'fiat', '00.000.002/0001-82', 'fabio', '3421 5588', 1);
insert into fornecedor values (null, 'toyota ltda', 'toyota', '00.000.003/0001-73', 'marcos', '3422 7246', 2);
insert into fornecedor values (null, 'volkswagen ltda', 'volkswagem', '00.000.004/0001-64', 'nilson', null, 3);
insert into fornecedor values (null, 'hunday ltda', 'hynday', '00.000.005/0001-55', 'marcos', '3421 7897', 3);
insert into fornecedor values (null, 'eletrobrás brasil', 'ceron', '00.000.006/0001-46', 'governo', '3423 1234', 10);
insert into fornecedor values (null, 'companhia de agua e esgoto de rondonia', 'caerd', '00.000.007/0001-37', 'maria', null, 11);
insert into fornecedor values (null, 'nissan motores s.a.', 'nissan', '00.000.008/0001-28', 'andre', '3422 4455', 4);
insert into fornecedor values (null, 'ford parts ltda', 'ford', '00.000.009/0001-19', 'carlos', '3421 3366', 5);
insert into fornecedor values (null, 'honda parts s.a.', 'honda', '00.000.010/0001-00', 'joão', '3422 9988', 2);
insert into fornecedor values (null, 'peugeot components ltda', 'peugeot', '00.000.011/0001-91', 'lucas', null, 1);
insert into fornecedor values (null, 'renault auto parts s.a.', 'renault', '00.000.012/0001-82', 'roberto', '3421 1122', 3);
insert into fornecedor values (null, 'volvo parts ltda', 'volvo', '00.000.013/0001-73', 'jose', '3422 2233', 4);
insert into fornecedor values (null, 'kia motors s.a.', 'kia', '00.000.014/0001-64', 'fernando', '3421 7788', 5);
insert into fornecedor values (null, 'mercedes parts ltda', 'mercedes-benz', '00.000.015/0001-55', 'carla', '3422 3344', 1);
insert into fornecedor values (null, 'mitsubishi components s.a.', 'mitsubishi', '00.000.016/0001-46', 'rafael', '3421 8899', 2);
insert into fornecedor values (null, 'subaru motors s.a.', 'subaru', '00.000.017/0001-37', 'ana', null, 3);
insert into fornecedor values (null, 'jaguar parts ltda', 'jaguar', '00.000.018/0001-28', 'maria', '3422 5566', 4);
insert into fornecedor values (null, 'land rover ltda', 'land rover', '00.000.019/0001-19', 'andreia', '3421 6655', 5);
insert into fornecedor values (null, 'porsche parts s.a.', 'porsche', '00.000.020/0001-00', 'ricardo', '3422 3344', 1);
insert into fornecedor values (null, 'bugatti motors s.a.', 'bugatti', '00.000.021/0001-91', 'gustavo', '3421 9988', 2);
insert into fornecedor values (null, 'lamborghini ltda', 'lamborghini', '00.000.022/0001-82', 'leticia', null, 3);
insert into fornecedor values (null, 'aston martin parts s.a.', 'aston martin', '00.000.023/0001-73', 'pedro', '3422 4455', 4);
insert into fornecedor values (null, 'maserati ltda', 'maserati', '00.000.024/0001-64', 'camila', '3421 7788', 5);
insert into fornecedor values (null, 'rolls-royce motors s.a.', 'rolls-royce', '00.000.025/0001-55', 'joana', '3422 3344', 1);
insert into fornecedor values (null, 'lotus parts ltda', 'lotus', '00.000.026/0001-46', 'eduardo', '3421 8899', 2);
insert into fornecedor values (null, 'suzuki motors s.a.', 'suzuki', '00.000.027/0001-37', 'luis', null, 3);

create table produto (
id_prod int primary key not null auto_increment,
descricao_prod varchar (50) not null,
marca_prod varchar (50),
quant_prod int,
valor_prod double,
tamanho_prod varchar (50),
tipo_prod varchar (50)
);

insert into produto values (null, 'farol civic 2020 ld', 'honda', 5, 3500.00, 'médio', 'led');
insert into produto values (null, 'pneu aro 17 225/45', 'pirelli', 20, 999.00, 'médio', 'borracha');
insert into produto values (null, 'farol gol g7 2020 le', 'volkswagen', 10, 1500.99, 'médio', 'vidro');
insert into produto values (null, 'farol gol g7 2020 ld', 'ford', 10, 1500.99, 'médio', 'vidro');
insert into produto values (null, 'capô uno 2018', 'fiat', 5, 900.00, 'grande', 'metal');
insert into produto values (null, 'volante sportivo cruze 2021', 'chevrolet', 3, 4000.00, 'médio', 'borracha');
insert into produto values (null, 'difusor ar condicionado celta 2011 le', 'chevrolet', 10, 50.00, 'médio', 'plastico');
insert into produto values (null, 'parachoque s10 2020', 'chevrolet', 10, 2500.00, 'médio', 'fibra');
insert into produto values (null, 'parachoque celta 2020', 'chevrolet', 10, 1000.00, 'médio', 'fibra');
insert into produto values (null, 'roda aro 15', 'fiat', 4, 1000.00, 'médio', 'metal');
insert into produto values (null, 'porta hillux 2021 ld', 'toyota', 4, 5000.00, 'médio', 'metal');
insert into produto values (null, 'escape gol 2021', 'volkswagen', 10, 500.00, 'médio', 'metal');
insert into produto values (null, 'bico injetor motor 1.6 uno 2020', 'fiat', 5, 500.00, 'médio', 'metal');
insert into produto values (null, 'lanterna s10 2020 ld', 'chevrolet', 10, 1800.00, 'médio', 'plastico');
insert into produto values (null, 'lanterna s10 2020 le', 'chevrolet', 10, 1800.00, 'médio', 'plastico');
insert into produto values (null, 'escape cela 2008', 'chevrolet', 10, 500.00, 'médio', 'metal');
insert into produto values (null, 'difusor ar condicionado celta 2011 ld', 'chevrolet', 10, 50.00, 'médio', 'plastico');
insert into produto values (null, 'farol civic 2020 le', 'honda', 5, 3500.00, 'médio', 'led');
insert into produto values (null, 'grade difusora civic 2021', 'honda', 3, 3200.00, 'médio', 'metal');
insert into produto values (null, 'motor 1.8 cruze 2021', 'chevrolet', 1, 18500.00, 'grande', 'metal');
insert into produto values (null, 'amortecedor dianteiro gol g6', 'volkswagen', 15, 350.00, 'pequeno', 'metal');
insert into produto values (null, 'filtro de ar esportivo uno', 'fiat', 8, 120.00, 'pequeno', 'papel');
insert into produto values (null, 'sensor de estacionamento universal', 'universal', 25, 80.00, 'pequeno', 'plástico');
insert into produto values (null, 'jogo de tapetes de borracha', 'universal', 20, 50.00, 'médio', 'borracha');
insert into produto values (null, 'kit de embreagem celta 2015', 'chevrolet', 5, 550.00, 'médio', 'metal');
insert into produto values (null, 'filtro de óleo eco sport', 'ford', 10, 25.00, 'pequeno', 'papel');
insert into produto values (null, 'vela de ignição focus 2018', 'ford', 12, 12.00, 'pequeno', 'metal');
insert into produto values (null, 'kit correia dentada e tensor', 'universal', 8, 180.00, 'médio', 'borracha');
insert into produto values (null, 'retrovisor externo universal', 'universal', 18, 90.00, 'médio', 'plástico');
insert into produto values (null, 'calota aro 14', 'universal', 30, 15.00, 'pequeno', 'plástico');
insert into produto values (null, 'jogo de tapetes de carpete', 'universal', 25, 40.00, 'médio', 'tecido');
insert into produto values (null, 'bateria moura 60Ah', 'universal', 7, 280.00, 'médio', 'metal');
insert into produto values (null, 'sensor de oxigênio uno 2019', 'fiat', 10, 180.00, 'pequeno', 'metal');
insert into produto values (null, 'pára-brisa gol g5', 'volkswagen', 5, 400.00, 'grande', 'vidro');
insert into produto values (null, 'kit de freio a disco dianteiro', 'universal', 8, 350.00, 'médio', 'metal');
insert into produto values (null, 'lâmpada halógena h4', 'universal', 15, 10.00, 'pequeno', 'vidro');
insert into produto values (null, 'jogo de velas fox 2017', 'volkswagen', 12, 50.00, 'pequeno', 'metal');
insert into produto values (null, 'calota aro 15', 'universal', 20, 20.00, 'médio', 'plástico');
insert into produto values (null, 'kit de suspensão dianteira', 'universal', 5, 600.00, 'médio', 'metal');
insert into produto values (null, 'farol de milha palio 2016', 'fiat', 7, 120.00, 'pequeno', 'vidro');
insert into produto values (null, 'sensor de temperatura universal', 'universal', 18, 30.00, 'pequeno', 'metal');
insert into produto values (null, 'filtro de combustível civic 2019', 'honda', 10, 18.00, 'pequeno', 'plástico');
insert into produto values (null, 'jogo de tapetes de borracha', 'fiat', 15, 35.00, 'médio', 'borracha');
insert into produto values (null, 'kit de embreagem focus 2015', 'ford', 8, 480.00, 'médio', 'metal');
insert into produto values (null, 'lâmpada LED H7', 'universal', 25, 25.00, 'pequeno', 'led');
insert into produto values (null, 'kit de amortecedores traseiros', 'universal', 5, 250.00, 'médio', 'metal');
insert into produto values (null, 'bomba dágua uno 2017', 'fiat', 6, 60.00, 'pequeno', 'metal');
insert into produto values (null, 'calota aro 13', 'universal', 25, 18.00, 'pequeno', 'plástico');
insert into produto values (null, 'parafuso antifurto de roda', 'universal', 20, 10.00, 'pequeno', 'metal');
insert into produto values (null, 'filtro de ar condicionado', 'universal', 30, 15.00, 'pequeno', 'plástico');

create table servico (
id_serv int not null primary key auto_increment,
descricao_serv varchar(300),
tipo_serv varchar (100),
valor_serv float not null,
tempo_serv time
);

insert into servico values (null, 'funilaria de parachoque traseiro', 'conserto', 350.00, '04:00:00');
insert into servico values (null, 'rebaixar suspensao dianteira carro', 'estética', 400.50, '01:10:00');
insert into servico values (null, 'envelopar veiculo com pelicula preto fosco', 'pintura', 1900.00, '08:00:00');
insert into servico values (null, 'trocar volante', 'conserto', 49.99, '00:50:00');
insert into servico values (null, 'instalacao de acessório interno', 'estética', 49.99, '00:50:00');
insert into servico values (null, 'trocar pneu traseiro', 'conserto', 30.80, '00:30:00');
insert into servico values (null, 'instalar jogo de rodas', 'conserto', 100.00, '00:30:00');
insert into servico values (null, 'pintar veículo sedan', 'pintura', 5000.00, '12:00:00');
insert into servico values (null, 'substituição de suspensão dianteira', 'conserto', 299.90, '03:00:00');
insert into servico values (null, 'funilaria de parachoque dianteiro', 'conserto', 350.00, '04:00:00'); 

create table compra (
id_comp integer not null primary key auto_increment,
data_comp date,
valor_total_comp double,
forma_pagamento_comp varchar (100),
id_func_fk integer not null,
id_forn_fk integer not null,
foreign key (id_func_fk) references funcionario (id_func),
foreign key (id_forn_fk) references fornecedor (id_forn)
);

insert into compra values (null, '2021-01-23', 4654.50, '30 dias', 1, 1);
insert into compra values (null, '2021-02-10', 45464.00, '30 dias', 1, 2);
insert into compra values (null, '2022-06-30', 5045.90, 'vista', 1, 3);
insert into compra values (null, '2022-09-23', 2154.79, '60 dias', 1, 4);
insert into compra values (null, '2023-03-01', 6543.20, 'vista', 1, 5);
insert into compra values (null, '2023-03-15', 12345.67, '30 dias', 3, 1);
insert into compra values (null, '2023-03-25', 7890.50, '60 dias', 4, 2);
insert into compra values (null, '2023-04-10', 4321.89, 'vista', 5, 3);
insert into compra values (null, '2023-04-20', 9876.30, '30 dias', 6, 4);

create table itens_compra (
id_itc integer not null primary key auto_increment,
quant_itc integer not null,
valor_itc float not null,
id_prod_fk integer not null,
id_comp_fk integer not null,
foreign key (id_prod_fk) references produto (id_prod),
foreign key (id_comp_fk) references compra (id_comp)
);


insert into itens_compra values (null, 5, 5.55, 1, 1);
insert into itens_compra values (null, 12, 10.80, 2, 1);
insert into itens_compra values (null, 9, 19.99, 3, 1);
insert into itens_compra values (null, 2, 6.55, 4, 1);
insert into itens_compra values (null, 10, 10.00, 5, 1);

insert into itens_compra values (null, 5, 5.00, 6, 2);
insert into itens_compra values (null, 20, 20.50, 7, 2);
insert into itens_compra values (null, 15, 18.90, 8, 2);
insert into itens_compra values (null, 5, 30.60, 9, 2);
insert into itens_compra values (null, 30, 7.99, 10, 2);

insert into itens_compra values (null, 10, 12.90, 11, 3);
insert into itens_compra values (null, 20, 18.90, 12, 3);
insert into itens_compra values (null, 5, 120.00, 13, 3);
insert into itens_compra values (null, 2, 220.80, 14, 3);
insert into itens_compra values (null, 8, 127.70, 15, 3);

insert into itens_compra values (null, 10, 11.80, 16, 4);
insert into itens_compra values (null, 5, 124.90, 17, 4);
insert into itens_compra values (null, 22, 12.90, 18, 4);
insert into itens_compra values (null, 15, 34.80, 19, 4);
insert into itens_compra values (null, 12, 48.00, 20, 4);

insert into itens_compra values (null, 8, 15.90, 21, 5);
insert into itens_compra values (null, 15, 10.50, 22, 5);
insert into itens_compra values (null, 10, 25.75, 23, 5);
insert into itens_compra values (null, 5, 8.20, 24, 5);
insert into itens_compra values (null, 12, 12.40, 25, 5);

insert into itens_compra values (null, 10, 18.60, 26, 6);
insert into itens_compra values (null, 5, 35.90, 27, 6);
insert into itens_compra values (null, 8, 9.99, 28, 6);
insert into itens_compra values (null, 20, 5.50, 29, 6);
insert into itens_compra values (null, 15, 20.00, 30, 6);

insert into itens_compra values (null, 7, 22.30, 31, 7);
insert into itens_compra values (null, 15, 17.80, 32, 7);
insert into itens_compra values (null, 10, 13.25, 33, 7);
insert into itens_compra values (null, 5, 9.50, 34, 7);
insert into itens_compra values (null, 18, 8.90, 35, 7);

insert into itens_compra values (null, 12, 32.50, 36, 8);
insert into itens_compra values (null, 8, 45.80, 37, 8);
insert into itens_compra values (null, 5, 27.70, 38, 8);
insert into itens_compra values (null, 20, 13.90, 39, 8);
insert into itens_compra values (null, 15, 18.00, 40, 8);

create table caixa (
id_cai integer not null primary key auto_increment,
data_abertura_cai date not null,
data_fechamento_cai date,
saldo_inicial_cai double not null,
troco_cai double,
valor_creditos_cai double,
valor_debitos_cai double,
saldo_final_cai double,
status_cai varchar (100) not null
);
insert into caixa values (null, '2023-08-19', '2023-08-20', 0, 100.00, 500.00, 0, 600.00, 'fechado');
insert into caixa values (null, '2023-08-20', '2023-08-21', 0, 120.00, 480.00, 0, 600.00, 'fechado');
insert into caixa values (null, '2023-08-21', '2023-08-22', 0, 150.00, 550.00, 0, 700.00, 'fechado');
insert into caixa values (null, '2023-08-22', '2023-08-23', 0, 180.00, 600.00, 0, 780.00, 'fechado');
insert into caixa values (null, '2023-08-23', '2023-08-24', 0, 200.00, 700.00, 0, 900.00, 'fechado');
insert into caixa values (null, '2023-08-24', '2023-08-25', 0, 250.00, 800.00, 0, 1050.00, 'fechado');
insert into caixa values (null, '2023-08-25', '2023-08-26', 0, 280.00, 900.00, 0, 1180.00, 'fechado');
insert into caixa values (null, '2023-08-26', '2023-08-27', 0, 300.00, 1000.00, 0, 1300.00, 'fechado');
insert into caixa values (null, '2023-08-27', '2023-08-28', 0, 320.00, 1100.00, 0, 1420.00, 'fechado');
insert into caixa values (null, '2023-08-28', '2023-08-29', 0, 350.00, 1200.00, 0, 1550.00, 'fechado');
insert into caixa values (null, '2023-08-29', '2023-08-30', 0, 380.00, 1300.00, 0, 1680.00, 'fechado');
insert into caixa values (null, '2023-08-30', '2023-08-31', 0, 400.00, 1400.00, 0, 1800.00, 'fechado');
insert into caixa values (null, '2023-08-31', '2023-09-01', 0, 420.00, 1500.00, 0, 1920.00, 'fechado');
insert into caixa values (null, '2023-09-01', '2023-09-02', 0, 450.00, 1600.00, 0, 2050.00, 'fechado');
insert into caixa values (null, '2023-09-02', '2023-09-03', 0, 480.00, 1700.00, 0, 2180.00, 'fechado');
insert into caixa values (null, '2023-09-03', '2023-09-04', 0, 500.00, 1800.00, 0, 2300.00, 'fechado');
insert into caixa values (null, '2023-09-04', '2023-09-05', 0, 520.00, 1900.00, 0, 2420.00, 'fechado');
insert into caixa values (null, '2023-09-05', '2023-09-06', 0, 550.00, 2000.00, 0, 2550.00, 'fechado');
insert into caixa values (null, '2023-09-06', '2023-09-07', 0, 580.00, 2100.00, 0, 2680.00, 'fechado');
insert into caixa values (null, '2023-09-07', '2023-09-08', 0, 600.00, 2200.00, 0, 2800.00, 'fechado');
insert into caixa values (null, '2023-08-19', '2023-08-20', 0, 100.00, 500.00, 0, 600.00, 'fechado');
insert into caixa values (null, '2023-08-20', null, 0, 0.00, 0, 0, 0, 'aberto');

create table venda (
id_vend integer not null primary key auto_increment,
data_vend date,
valor_total_vend double not null,
desconto_vend double,
forma_recebimento_vend varchar (50),
parcelas_vend int,
id_func_fk integer not null,
id_cli_fk integer not null,
foreign key (id_func_fk) references funcionario (id_func),
foreign key (id_cli_fk) references cliente (id_cli)
);

insert into venda values (null, '2019-01-30', 454.99, 0, 'vista', 1, 2, 1);
insert into venda values (null, '2019-11-30', 4564.99, 10.50, 'vista', 1,  2, 2);
insert into venda values (null, '2022-09-23', 500.80, 5.80, 'vista', 1, 3, 8);
insert into venda values (null, '2023-03-05', 456.70, 10.20, 'cartão', 1, 1, 3);
insert into venda values (null, '2023-03-18', 789.50, 5.00, 'dinheiro', 1, 2, 1);
insert into venda values (null, '2023-03-28', 123.45, 8.30, 'boleto', 1, 3, 7);
insert into venda values (null, '2023-04-12', 654.80, 15.90, 'cartão', 2, 4, 2);
insert into venda values (null, '2023-04-22', 987.60, 7.80, 'dinheiro', 1, 5, 8);

create table itens_venda (
id_itv integer not null primary key auto_increment,
quant_itv integer not null,
valor_itv float not null,
id_prod_fk integer not null,
id_vend_fk integer not null,
foreign key (id_prod_fk) references produto (id_prod),
foreign key (id_vend_fk) references venda (id_vend)
);

insert into itens_venda values (null, 2, 12.50, 1, 1);
insert into itens_venda values (null, 1, 45.45, 3, 1);
insert into itens_venda values (null, 1, 89.77, 5, 1);
insert into itens_venda values (null, 3, 456.75, 4, 1);

insert into itens_venda values (null, 1, 45.05, 10, 2);
insert into itens_venda values (null, 4, 45.77, 4, 2);
insert into itens_venda values (null, 3, 99.87, 7, 2);
insert into itens_venda values (null, 9, 50.46, 1, 2);

insert into itens_venda values (null, 10, 78.77, 9, 3);
insert into itens_venda values (null, 2, 65.79, 2, 3);
insert into itens_venda values (null, 3, 20.57, 8, 3);
insert into itens_venda values (null, 1, 789.77, 1, 3);

insert into itens_venda values (null, 3, 25.60, 16, 1);
insert into itens_venda values (null, 5, 18.90, 17, 1);
insert into itens_venda values (null, 2, 30.80, 18, 1);
insert into itens_venda values (null, 4, 15.50, 19, 1);

insert into itens_venda values (null, 1, 40.00, 20, 2);
insert into itens_venda values (null, 6, 10.50, 21, 2);
insert into itens_venda values (null, 4, 22.30, 22, 2);
insert into itens_venda values (null, 8, 8.90, 23, 2);

insert into itens_venda values (null, 7, 15.90, 24, 3);
insert into itens_venda values (null, 3, 20.50, 25, 3);
insert into itens_venda values (null, 2, 50.00, 26, 3);
insert into itens_venda values (null, 5, 12.80, 27, 3);

insert into itens_venda values (null, 10, 18.60, 28, 4);
insert into itens_venda values (null, 4, 30.90, 29, 4);
insert into itens_venda values (null, 2, 12.40, 30, 4);
insert into itens_venda values (null, 6, 8.00, 31, 4);

create table recebimento (
id_rec integer not null primary key auto_increment,
data_vencimento_rec date,
valor_rec double,
parcela_rec varchar(100),
status_rec varchar (100),
forma_recebimento_rec varchar (100),
data_recebimento_rec date,
id_func_fk integer,
id_cai_fk integer,
id_vend_fk integer not null,
foreign key (id_func_fk) references funcionario (id_func),
foreign key (id_cai_fk) references caixa (id_cai),
foreign key (id_vend_fk) references venda (id_vend)
);

insert into recebimento values (null, '2022-01-14', 454.00, '1/1', 'Pago', 'Dinheiro', '2023-02-14', 6, 1, 1);
insert into recebimento values (null, '2022-01-20', 4546.00, '1/2', 'Pago', 'Dinheiro', '2023-02-20', 6, 1, 2);
insert into recebimento values (null, '2022-01-30', 1234.79, '2/2', 'Pago', 'Cartão de Crédito', '2023-03-30', 6, 1, 3);
insert into recebimento values (null, '2023-03-15', 456.70, '1/1', 'Pago', 'cartão', '2023-03-15', 2, 1, 3);
insert into recebimento values (null, '2023-03-25', 789.50, '1/1', 'Pago', 'dinheiro', '2023-03-25', 3, 2, 1);
insert into recebimento values (null, '2023-04-05', 123.45, '1/1', 'Pago', 'boleto', '2023-04-05', 4, 3, 7);
insert into recebimento values (null, '2023-04-20', 654.80, '1/2', 'Pago', 'cartão', '2023-04-20', 5, 4, 2);
insert into recebimento values (null, '2023-04-30', 987.60, '2/2', 'Pago', 'dinheiro', '2023-04-30', 6, 5, 8);


create table despesa (
id_desp integer not null primary key auto_increment,
descricao_desp varchar (200),
valor_desp double,
data_desp date,
numero_documento_desp varchar (300),
id_forn_fk int,
foreign key (id_forn_fk) references fornecedor (id_forn)
);

insert into despesa values (null, 'conta de agua de janeiro/2017', 150.50, '2023-01-31', '212312131311', 7);
insert into despesa values (null, 'conta de luz de janeiro/2017', 550.90, '2023-02-25', '485445646777', 6);
insert into despesa values (null, 'Conta de água de abril/2021', 180.50, '2023-04-30', '321548754845', 2);
insert into despesa values (null, 'Conta de luz de abril/2021', 620.90, '2023-04-30', '454578798787', 3);
insert into despesa values (null, 'Compra de material de escritório', 300.00, '2023-04-15', '879847458478', 4);
insert into despesa values (null, 'Manutenção de veículo da empresa', 1200.00, '2023-04-22', '987887788787', 5);
insert into despesa values (null, 'Compra de uniformes para funcionários', 450.00, '2023-04-10', '123456789987', 6);


create table pagamento (
id_pag integer not null primary key auto_increment,
data_vencimento_pag date,
valor_pag float,
parcela_pag varchar (100),
status_pag varchar (100),
forma_pagamento_pag varchar (100),
data_pagamento_pag date,
id_func_fk integer,
id_cai_fk integer,
id_desp_fk integer,
id_comp_fk integer,
foreign key (id_func_fk) references funcionario (id_func),
foreign key (id_cai_fk) references caixa (id_cai),
foreign key (id_desp_fk) references despesa (id_desp),
foreign key (id_comp_fk) references compra (id_comp)
);

insert into pagamento values (null, '2022-09-01', 4544.77, '1/1', 'Pago', 'dinheiro', '2022-10-01', 6, 1, null, 1);
insert into pagamento values (null, '2022-09-01', 787.99, '1/1', 'Pago', 'dinheiro', '2022-10-01',6, 2, null, 2);
insert into pagamento values (null, '2022-09-01', 477.99, '1/1', 'Pago', 'dinheiro', '2022-10-01', 6, 1, null, 3);
insert into pagamento values (null, '2022-09-01', 1234.99, '1/1', 'Pago', 'dinheiro', '2022-10-01', 6, 2, null, 4);
insert into pagamento values (null, '2022-09-01', 45.77, '1/1', 'Pago', 'débito conta', '2022-10-01', 6, 2, 1, null);
insert into pagamento values (null, '2022-09-01', 100.90, '1/1', 'Pago', 'débito conta', '2022-10-01', 6, 2, 2, null);
insert into pagamento values (null, '2023-04-05', 200.00, '1/1', 'Pago', 'dinheiro', '2023-04-05', 1, 1, 1, null);
insert into pagamento values (null, '2023-04-10', 400.00, '1/1', 'Pago', 'cartão', '2023-04-10', 2, 2, 2, null);
insert into pagamento values (null, '2023-04-15', 100.00, '1/1', 'Pago', 'cheque', '2023-04-15', 3, 3, 3, null);
insert into pagamento values (null, '2023-04-22', 800.00, '1/1', 'Pago', 'dinheiro', '2023-04-22', 4, 4, 4, null);
insert into pagamento values (null, '2023-04-30', 150.00, '1/1', 'Pago', 'cartão', '2023-04-30', 5, 5, 5, null);
insert into pagamento values (null, '2023-04-30', 400.00, '1/1', 'Pago', 'cheque', '2023-04-30', 6, 6, null, 5);

-- Exercícios

-- SELECTS em Múltiplas Tabelas com JOINS
-- SUBCONSULTAS
-- Visões
-- Indexação
-- Expressões Regulares

-- 1) Selecione o nome, cpf, renda, data de nascimento, nome do Sexo, dados do Endereço,
-- nome da Cidade e nome do Estado dos Clientes. Por fim ordene pelo nome do cliente. 
-- Garanta que todos os clientes sejam mostrados, independente de ter ou não relação
-- com as tabelas sexo e endereço.
select
cliente.nome_cli as Nome,
cliente.cpf_cli as CPF,
cliente.data_nascimento_cli as 'Data de Nascimento',
sexo.nome_sex as Sexo,
endereco.rua_end as Rua,
endereco.numero_end as 'Número',
endereco.bairro_end as Bairro,
cidade.nome_cid as Cidade,
estado.nome_est as Estado
from cliente left join sexo on sexo.id_sex = cliente.id_sex_fk
left join endereco on endereco.id_end = cliente.id_end_fk
left join cidade on cidade.id_cid = endereco.id_cid_fk
left join estado on estado.id_est = cidade.id_est_fk
order by nome_cli;

-- 2) Selecione o nome, cpf, função, nome do Sexo, dados do Endereço, nome da Cidade, 
-- nome do Estado e nome do Departamento dos Funcionários. Mostre somente os funcionarios
-- com relação com as tabelas sexo, endereço e departamento. Por fim ordene pelo nome do
-- funcionario.
select
funcionario.nome_func as Nome,
funcionario.cpf_func as CPF,
sexo.nome_sex as Sexo,
endereco.rua_end as Rua,
endereco.numero_end as 'Número',
endereco.bairro_end as Bairro,
cidade.nome_cid as Cidade,
estado.nome_est as Estado,
departamento.nome_dep as Departamento
from funcionario join sexo on sexo.id_sex = funcionario.id_sex_fk
join departamento on departamento.id_dep = funcionario.id_dep_fk
join endereco on endereco.id_end = funcionario.id_end_fk
join cidade on cidade.id_cid = endereco.id_cid_fk
join estado on estado.id_est = cidade.id_est_fk
order by nome_func;

-- 3) Selecione a data e o valor da Compra, razão social do Fornecedor e os nomes, 
-- quantidade e valor dos Produtos comprados entre os anos de 2000 a 2026. 
-- Ordem pelo nome do fornecedor. 
select
compra.data_comp as 'Data',
compra.valor_total_comp as Valor,
fornecedor.razao_social_forn as 'Razão Social',
fornecedor.nome_fantasia_forn as 'Nome Fantasia',
produto.quant_prod as Quantidade,
produto.valor_prod as Valor
from compra join fornecedor on fornecedor.id_forn = compra.id_forn_fk
join itens_compra on compra.id_comp = itens_compra.id_comp_fk
join produto on produto.id_prod = itens_compra.id_prod_fk
where data_comp between '2000-01-01' and '2025-12-31'
order by nome_fantasia_forn;

-- 4) Secione nome e o CPF do Cliente, assim como a quantidade, valor médio e a soma 
-- do valor total das Vendas que ele participou.  Ordene por nome.
select 
cliente.nome_cli as Nome,
cliente.cpf_cli as CPF,
(select count(id_vend) from venda where(cliente.id_cli = venda.id_cli_fk)) as Quantidade,
(select avg(valor_total_vend) from venda where (cliente.id_cli = venda.id_cli_fk)) as 'Média',
(select sum(valor_total_vend) from venda where (cliente.id_cli = venda.id_cli_fk)) as Soma
from cliente
order by nome_cli;

-- 5) Crie uma visão para consulta nº 1. Depois crie um código de uso da visão para
-- retornar os registros com renda entre mil e 20 mil reais e nascidos entre 1950 e 1999 
-- e que sejam do sexo Masculino e que moram em endereços do tipo “Rua” ou “Avenida”. 
-- Use REGEXP.
create view consulta1 as select
cliente.renda_familiar_cli as Renda,
cliente.data_nascimento_cli as 'Data nascimento',
sexo.nome_sex as Sexo,
endereco.rua_end as Rua
from cliente join sexo on sexo.id_sex = cliente.id_sex_fk
join endereco on endereco.id_end = cliente.id_end_fk;
select
* from consulta1 where (Renda between 1000 and 20000) and (`Data nascimento` between '1950-01-01' and '1998-12-31')
and Sexo = 'masculino' and Rua regexp '^(rua|av)';

-- 6) Crie uma visão para consulta nº 2. Depois crie um código de uso da visão para 
-- retornar os registros com salário superior a 1 mil reais e que possuam
-- sobrenome “silva” ou “santos” ou “souza” e que sejam nascidos após a década 
-- de 70 e que morem em estados da região “Norte” e “Sul” e “Sudeste”. Use REGEXP.
create view consulta2 as select
funcionario.salario_func as Salario,
funcionario.nome_func as Sobrenome,
funcionario.data_nascimento_func as 'Data de Nascimento',
estado.regiao_est as Regiao
from funcionario join endereco on endereco.id_end = funcionario.id_end_fk
join cidade on cidade.id_cid = endereco.id_cid_fk
join estado on estado.id_est = cidade.id_est_fk;
select * from consulta2
where Salario > 1000 and Sobrenome regexp '(silva|santos|souza)'
and `Data de Nascimento` regexp '^(..7|..8|..9|..0|..1|..2)' and Regiao regexp 'Norte|Sul|Sudeste';

select * from funcionario;
select * from estado;
select * from endereco;
select * from cidade;

-- 7) Mostre os clientes que não possuem nenhum carro. Dica: EXISTS
select 
cliente.nome_cli as Nome
from cliente where not exists(select 1 from carro where carro.id_cli_fk = cliente.id_cli); 

-- 8) Mostre os funcionarios com o CPF dentro do padrão de máscara: 000.000.000-00.
select * from funcionario where (cpf_func regexp '^[0-9]{3}\\.[0-9]{3}\\.[0-9]{3}-[0-9]{2}$');

-- 9) Crie índices para os atributos nome e cpf de cliente e funcionario. 
create index idx_nome_cli on cliente (nome_cli);
create index idx_cpf_cli on cliente (cpf_cli);
create index idx_nome_func on funcionario (nome_func);
create index idx_cpf_func on funcionario (cpf_func);

-- 10) Use o comando EXPLAIN e exame consultas que utilizam os atributos indexados 
-- no exercício anterior. Explique o resultado do type no explain.
explain select * from cliente where nome_cli = 'Ana';
explain select * from cliente where cpf_cli = '111.111.111-11';
explain select * from funcionario where nome_func = 'Ana';
explain select * from funcionario where cpf_func = '111.111.111-11'; 
-- Nestas consultas, os tipos sendo ref, idicando que a indexação está sendo usada e consultando apenas a linha descrita na where,
-- caso n estivesse sendo usado, iria aparecer all, idicando que o select está buscando em todas as linhas da tabela, podendo 
-- observar isso em rows.














