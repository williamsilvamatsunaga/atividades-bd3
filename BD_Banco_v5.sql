#Script BD_AgenciaBancaria - Versão 5.0

-- William da Silva Matsunaga

create database BD_Banco_v5;
use BD_Banco_v5;

create table Banco (
id_ban int primary key not null auto_increment,
nome_ban varchar (200) not null
);

insert into Banco values (null, 'Caixa Econômica Federal');
insert into Banco values (null, 'Banco do Brasil');
insert into Banco values (null, 'Banco Bradesco');
insert into Banco values (null, 'Banco Itaú');
insert into Banco values (null, 'Banco Santander');
insert into Banco values (null, 'Banco Inter');
insert into Banco values (null, 'Banco Nubank');
insert into Banco values (null, 'Banco Sicredi');
insert into Banco values (null, 'Banco Sicoob');
insert into Banco values (null, 'Banco Safra');
insert into Banco values (null, 'Banco Original');
insert into Banco values (null, 'Banco BTG Pactual');

create table Agencia (
id_ag int primary key not null auto_increment,
numero_ag varchar (100) not null,
nome_ag varchar (100),
telefone_ag varchar (200),
id_ban_fk int not null,
foreign key (id_ban_fk) references Banco (id_ban)
);

insert into Agencia values (null, '0951-2', 'Centro', '69 3421 1111', 2);
insert into Agencia values (null, '4402-1', 'Centro', '69 3422 2299', 2);
insert into Agencia values (null, '1824', 'Centro', '69 3423 1925', 1);
insert into Agencia values (null, '1920', 'Nova Brasilia', '69 3421 1122', 1);
insert into Agencia values (null, '3301', 'Industrial', '69 3322 1122', 3);
insert into Agencia values (null, '3302', 'Centro', '69 3322 1133', 3);
insert into Agencia values (null, '4401', 'Centro', '69 3333 2233', 4);
insert into Agencia values (null, '5501', 'Nova Esperança', '69 3344 4455', 5);
insert into Agencia values (null, '6601', 'Centro', '69 3355 5566', 6);
insert into Agencia values (null, '7701', 'Industrial', '69 3366 6677', 7);
insert into Agencia values (null, '8801', 'Centro', '69 3377 7788', 8);
insert into Agencia values (null, '9901', 'Centro', '69 3388 8899', 9);
insert into Agencia values (null, '1101', 'Nova Brasilia', '69 3399 9900', 10);
insert into Agencia values (null, '1201', 'Centro', '69 3311 1111', 11);

CREATE TABLE Cliente (
id_cli INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_cli VARCHAR(255) NOT NULL,
cpf_cli VARCHAR(50) NOT NULL,
rg_cli VARCHAR(255) NOT NULL,
sexo_cli ENUM('M', 'F'),
dataNasc_cli DATE NOT NULL,
renda_cli FLOAT NOT NULL,
rua_cli VARCHAR(255) NOT NULL,
num_cli VARCHAR(10),
bairro_cli VARCHAR(255),
cidade_cli VARCHAR(255),
uf_cli VARCHAR(255),
email_cli VARCHAR(300) NOT NULL,
telefone_cli VARCHAR(200) NOT NULL
);

INSERT INTO Cliente VALUES (NULL, 'Maria da Silva', '123.123.123-23', '1113322 sesdec/RO', 'F', '1990-10-10', 2500.00, 'Rua das Flores', '123', 'Centro', 'Ji-Paraná', 'RO', 'maria.silva@hotmail.com', '3423 3333');
INSERT INTO Cliente VALUES (NULL, 'Roberto Carlos', '789.789.789-89', '889977 sesdec/RO', 'M', '1975-01-10', 4990.00, 'Av. Costa', '45', 'Bairro Nobre', 'Ji-Paraná', 'RO', 'roberto.carlos@gmail.com', '8444 8899');
INSERT INTO Cliente VALUES (NULL, 'Jane Pereira', '444.666.444-44', '005548 sesdec/RO', 'F', '1989-06-07', 1850.50, 'Rua Presidente', 'S/N', 'Planalto', 'Ji-Paraná', 'RO', 'jane.pereira@hotmail.com', '9977 8899');
INSERT INTO Cliente VALUES (NULL, 'Clodoaldo Bragança', '654.456.654-65', '654658 sesdec/RO', 'F', '1991-10-12', 9850.50, 'Av. Brasil', '1000', 'Centro', 'Porto Velho', 'RO', 'clodoaldo.bragança@gmail.com', '3423 5500');
INSERT INTO Cliente VALUES (NULL, 'Livia de Souza', '333.444.666-98', '0033333 sesdec/RO', 'F', '1982-01-30', 1100.00, 'Av. Ji-Parana', '22', 'Urupá', 'Ji-Paraná', 'RO', 'livia.souza@hotmail.com', '8498 9898');
INSERT INTO Cliente VALUES (NULL, 'Joab da Silva', '159.425.456-77', '001215 sesdec/RO', 'M', '2000-10-01', 4990.00, 'Av. Ji-Parana', '500', 'Urupá', 'Ji-Paraná', 'RO', 'joab.silva@hotmail.com', '69 8411 2321');
INSERT INTO Cliente VALUES (NULL, 'Rodrigo Hilbert', '123.445.888-99', '5592 sesdec', 'M', '1970-09-30', 2500.00, 'Rua Dr. Luiz', '12', 'Industrial', 'Ji-Paraná', 'RO', 'rodrigo.hilbert@yahoo.com.br', '9944 4545');
INSERT INTO Cliente VALUES (NULL, 'João Eujácio Teixeira Júnior', '999.445.789-99', '978999992 sesdec', 'M', '1989-01-10', 6000.00, 'Rua Silva Abreu', '88', 'Nova Brasília', 'Ji-Paraná', 'RO', 'joao.eujacio@ifro.edu.br', '3421 1159');
INSERT INTO Cliente VALUES (NULL, 'Everton Feline', '123.123.888-99', '12392 sesdec', 'M', '1987-12-10', 11500.00, 'Rua Alencar Vieira', 'S/N', 'Jardim dos Migrantes', 'Ji-Paraná', 'RO', 'everton.feline@gmail.com','69 84228811');
INSERT INTO Cliente VALUES (NULL, 'Igor de Souza Santos', '123.345.848-99', '43299892 sesdec', 'M', '1990-12-30', 1000.00, 'Av. Brasil', '200', 'Centro', 'Ji-Paraná', 'RO', 'igor.souza@gmail.com', '69 9977 7777');
INSERT INTO Cliente VALUES (NULL, 'Francisco Bezerra', '888.123.111-11', '213156 sesdec', 'M', '1965-01-30', 3500.00, 'Rua Fim do Mundo', '99', 'Esperança', 'Ji-Paraná', 'RO', 'francisco.bezerra@ifro.edu.br', '69 3423 5502');
INSERT INTO Cliente VALUES (NULL, 'Ana Paula Gomes','111.222.333-44','123456 SSP','F','1995-02-10',3200,'Rua Amazonas','101','Setor 01','Porto Velho','RO','ana.gomes@gmail.com','69 99111 1111');
INSERT INTO Cliente VALUES (NULL, 'Carlos Eduardo Lima','222.333.444-55','222333 SSP','M','1988-05-21',4500,'Av Brasil','202','Centro','Porto Velho','RO','carlos.lima@gmail.com','69 99111 2222');
INSERT INTO Cliente VALUES (NULL, 'Fernanda Oliveira','333.444.555-66','444555 SSP','F','1992-08-11',3800,'Rua Rio Madeira','303','Nova Porto Velho','Porto Velho','RO','fernanda@gmail.com','69 99111 3333');
INSERT INTO Cliente VALUES (NULL, 'Paulo Henrique Souza','444.555.666-77','777888 SSP','M','1980-09-02',6200,'Rua Amazonas','404','Setor 01','Porto Velho','RO','paulo@gmail.com','69 99111 4444');
INSERT INTO Cliente VALUES (NULL, 'Marcos Vinicius Costa','555.666.777-88','555666 SSP','M','1978-07-30',5200,'Av Rio Madeira','505','Nova Porto Velho','Porto Velho','RO','marcos@gmail.com','69 99111 5555');
INSERT INTO Cliente VALUES (NULL, 'Juliana Barbosa','666.777.888-99','888999 SSP','F','1996-01-18',2900,'Rua das Flores','606','Centro','Ariquemes','RO','juliana@gmail.com','69 99111 6666');
INSERT INTO Cliente VALUES (NULL, 'Rafael Mendes','777.888.999-00','101010 SSP','M','1985-12-10',7200,'Av Jatuarana','707','Conceição','Porto Velho','RO','rafael@gmail.com','69 99111 7777');
INSERT INTO Cliente VALUES (NULL, 'Patricia Teixeira','888.999.000-11','222111 SSP','F','1991-03-14',4100,'Rua Calama','808','São João Bosco','Porto Velho','RO','patricia@gmail.com','69 99111 8888');
INSERT INTO Cliente VALUES (NULL, 'Bruna Martins','000.111.222-33','333444 SSP','F','1993-04-25',3500,'Av Amazonas','110','Centro','Porto Velho','RO','bruna@gmail.com','69 99222 0000');
INSERT INTO Cliente VALUES (NULL, 'Igor Martins','547.111.222-11','45477 SSP','F','1993-01-25',4000,'Av Amazonas','110','Centro','Porto Velho','RO','igorgmail.com','69 99222 1647');

create table Conta_Corrente (
id_cc int primary key not null auto_increment,
numero_cc int not null,
dataAbertura_cc date not null,
saldo_cc float not null,
valorLimite_cc float not null,
id_ag_fk int not null,
id_cli_fk int not null,
foreign key (id_ag_fk) references Agencia (id_ag),
foreign key (id_cli_fk) references Cliente (id_cli)
);

insert into Conta_Corrente values (null, 40650, '2009-01-01', 1232.00, 100.00, 1, 1);
insert into Conta_Corrente values (null, 41897, '2009-01-30', 4564.00, 200.00, 1, 2);
insert into Conta_Corrente values (null, 42487, '2010-06-06', 2211.00, 200.00, 1, 3);
insert into Conta_Corrente values (null, 43456, '2011-04-21', 15.00, 100.00, 1, 4);
insert into Conta_Corrente values (null, 44787, '2012-12-31', 0.00, 100.00, 1, 5);
insert into Conta_Corrente values (null, 45650, '2013-01-01', 545.00, 100.00, 1, 6);
insert into Conta_Corrente values (null, 46897, '2014-01-30', 12345.00, 300.00, 1, 7);
insert into Conta_Corrente values (null, 47487, '2014-06-06', 112.00, 200.00, 1, 8);
insert into Conta_Corrente values (null, 48456, '2015-04-21', 10.00, 100.00, 1, 9);
insert into Conta_Corrente values (null, 280541, '2016-12-31', 12345.00, 100.00, 3, 10);
insert into Conta_Corrente values (null, 280191, '2016-12-31', 555465.00, 100.00, 3, 11);
insert into Conta_Corrente values (null,50001,'2017-01-10',1200,200,2,12);
insert into Conta_Corrente values (null,50002,'2017-02-10',3400,300,3,13);
insert into Conta_Corrente values (null,50003,'2017-03-10',2200,200,4,14);
insert into Conta_Corrente values (null,50004,'2017-04-10',1000,200,5,15);
insert into Conta_Corrente values (null,50005,'2017-05-10',5400,500,6,16);
insert into Conta_Corrente values (null,50006,'2017-06-10',1500,200,7,17);
insert into Conta_Corrente values (null,50007,'2017-07-10',7600,400,8,18);
insert into Conta_Corrente values (null,50008,'2017-08-10',900,100,9,19);
insert into Conta_Corrente values (null,50009,'2017-09-10',1300,200,10,20);
insert into Conta_Corrente values (null,50010,'2017-10-10',8700,500,11,21);

create table Deposito (
id_dep int primary key not null auto_increment,
valor_dep float not null,
data_dep date not null,
tipo_dep varchar (100),
id_cc_fk int not null,
foreign key (id_cc_fk) references Conta_Corrente (id_cc)
);

insert into Deposito values (null, 500.00, '2011-03-21', 'Dinheiro', 1);
insert into Deposito values (null, 50.00, '2011-10-09', 'Dinheiro', 4);
insert into Deposito values (null, 1500.00, '2011-12-20', 'Cheque', 3);
insert into Deposito values (null, 125.00, '2011-06-11', 'Dinheiro', 5);
insert into Deposito values (null, 490.00, '2012-12-02', 'Dinheiro', 2);
insert into Deposito values (null, 1010.00, '2012-12-11', 'Cheque', 6);
insert into Deposito values (null, 120.00, '2016-01-30', 'Dinheiro', 7);
insert into Deposito values (null, 550.00, '2016-06-30', 'Dinheiro', 9);
insert into Deposito values (null, 80.00, '2016-10-23', 'Dinheiro', 10);
insert into Deposito values (null, 1000.00, '2016-11-08', 'Cheque', 10);
insert into Deposito values (null,200,'2017-01-15','Dinheiro',12);
insert into Deposito values (null,450,'2017-02-12','Cheque',13);
insert into Deposito values (null,800,'2017-03-21','Dinheiro',4);
insert into Deposito values (null,150,'2017-04-19','Dinheiro',15);
insert into Deposito values (null,900,'2017-05-10','Cheque',1);
insert into Deposito values (null,120,'2017-06-02','Dinheiro',17);
insert into Deposito values (null,600,'2017-07-18','Dinheiro',18);
insert into Deposito values (null,200,'2017-08-30','Dinheiro',9);
insert into Deposito values (null,400,'2017-09-22','Cheque',2);
insert into Deposito values (null,1500,'2017-10-11','Dinheiro',21);
INSERT INTO Deposito VALUES (NULL, 320.00, '2017-11-01', 'Dinheiro', 3);
INSERT INTO Deposito VALUES (NULL, 150.00, '2017-11-03', 'Cheque', 7);
INSERT INTO Deposito VALUES (NULL, 980.00, '2017-11-05', 'Dinheiro', 12);
INSERT INTO Deposito VALUES (NULL, 450.00, '2017-11-07', 'Dinheiro', 9);
INSERT INTO Deposito VALUES (NULL, 600.00, '2017-11-09', 'Cheque', 4);
INSERT INTO Deposito VALUES (NULL, 75.00, '2017-11-10', 'Dinheiro', 15);
INSERT INTO Deposito VALUES (NULL, 820.00, '2017-11-11', 'Dinheiro', 18);
INSERT INTO Deposito VALUES (NULL, 210.00, '2017-11-12', 'Cheque', 1);
INSERT INTO Deposito VALUES (NULL, 1500.00, '2017-11-13', 'Dinheiro', 10);
INSERT INTO Deposito VALUES (NULL, 95.00, '2017-11-14', 'Dinheiro', 6);
INSERT INTO Deposito VALUES (NULL, 430.00, '2017-11-15', 'Cheque', 8);
INSERT INTO Deposito VALUES (NULL, 270.00, '2017-11-16', 'Dinheiro', 14);
INSERT INTO Deposito VALUES (NULL, 620.00, '2017-11-17', 'Dinheiro', 2);
INSERT INTO Deposito VALUES (NULL, 110.00, '2017-11-18', 'Cheque', 11);
INSERT INTO Deposito VALUES (NULL, 340.00, '2017-11-19', 'Dinheiro', 13);
INSERT INTO Deposito VALUES (NULL, 900.00, '2017-11-20', 'Dinheiro', 16);
INSERT INTO Deposito VALUES (NULL, 50.00, '2017-11-21', 'Dinheiro', 5);
INSERT INTO Deposito VALUES (NULL, 1250.00, '2017-11-22', 'Cheque', 20);
INSERT INTO Deposito VALUES (NULL, 315.00, '2017-11-23', 'Dinheiro', 19);
INSERT INTO Deposito VALUES (NULL, 740.00, '2017-11-24', 'Dinheiro', 21);
INSERT INTO Deposito VALUES (NULL, 660.00, '2017-11-25', 'Cheque', 7);
INSERT INTO Deposito VALUES (NULL, 410.00, '2017-11-26', 'Dinheiro', 9);
INSERT INTO Deposito VALUES (NULL, 230.00, '2017-11-27', 'Dinheiro', 3);
INSERT INTO Deposito VALUES (NULL, 880.00, '2017-11-28', 'Cheque', 1);
INSERT INTO Deposito VALUES (NULL, 150.00, '2017-11-29', 'Dinheiro', 4);
INSERT INTO Deposito VALUES (NULL, 720.00, '2017-11-30', 'Dinheiro', 12);
INSERT INTO Deposito VALUES (NULL, 390.00, '2017-12-01', 'Cheque', 8);
INSERT INTO Deposito VALUES (NULL, 540.00, '2017-12-02', 'Dinheiro', 6);
INSERT INTO Deposito VALUES (NULL, 260.00, '2017-12-03', 'Dinheiro', 14);
INSERT INTO Deposito VALUES (NULL, 810.00, '2017-12-04', 'Cheque', 10);
INSERT INTO Deposito VALUES (NULL, 135.00, '2017-12-05', 'Dinheiro', 11);
INSERT INTO Deposito VALUES (NULL, 480.00, '2017-12-06', 'Dinheiro', 16);
INSERT INTO Deposito VALUES (NULL, 560.00, '2017-12-07', 'Cheque', 2);
INSERT INTO Deposito VALUES (NULL, 970.00, '2017-12-08', 'Dinheiro', 20);
INSERT INTO Deposito VALUES (NULL, 610.00, '2017-12-09', 'Dinheiro', 18);
INSERT INTO Deposito VALUES (NULL, 140.00, '2017-12-10', 'Cheque', 13);
INSERT INTO Deposito VALUES (NULL, 330.00, '2017-12-11', 'Dinheiro', 5);
INSERT INTO Deposito VALUES (NULL, 780.00, '2017-12-12', 'Dinheiro', 17);
INSERT INTO Deposito VALUES (NULL, 250.00, '2017-12-13', 'Cheque', 19);
INSERT INTO Deposito VALUES (NULL, 690.00, '2017-12-14', 'Dinheiro', 21);
INSERT INTO Deposito VALUES (NULL, 305.00, '2017-12-15', 'Dinheiro', 8);
INSERT INTO Deposito VALUES (NULL, 455.00, '2017-12-16', 'Cheque', 12);
INSERT INTO Deposito VALUES (NULL, 720.00, '2017-12-17', 'Dinheiro', 3);
INSERT INTO Deposito VALUES (NULL, 880.00, '2017-12-18', 'Dinheiro', 6);
INSERT INTO Deposito VALUES (NULL, 160.00, '2017-12-19', 'Cheque', 15);
INSERT INTO Deposito VALUES (NULL, 515.00, '2017-12-20', 'Dinheiro', 9);
INSERT INTO Deposito VALUES (NULL, 640.00, '2017-12-21', 'Dinheiro', 2);
INSERT INTO Deposito VALUES (NULL, 710.00, '2017-12-22', 'Cheque', 18);
INSERT INTO Deposito VALUES (NULL, 200.00, '2017-12-23', 'Dinheiro', 4);
INSERT INTO Deposito VALUES (NULL, 950.00, '2017-12-24', 'Dinheiro', 10);

create table Saque (
id_saq int primary key not null auto_increment,
valor_saq float not null,
data_saq date not null,
local_saq varchar (100) not null,
hora_saq time,
id_cc_fk int not null,
foreign key (id_cc_fk) references Conta_Corrente (id_cc)
);

insert into Saque values (null, 100.00, '2014-11-12', 'Caixa Eletrônico', sysdate(), 5);
insert into Saque values (null, 200.00, '2014-12-11', 'Agência', sysdate(), 1);
insert into Saque values (null, 120.00, '2015-12-02', 'Caixa Eletrônico', sysdate(), 2);
insert into Saque values (null, 100.00, '2015-01-03', 'Caixa Eletrônico', sysdate(), 5);
insert into Saque values (null, 200.00, '2015-01-30', 'Caixa Eletrônico', sysdate(), 1);
insert into Saque values (null, 120.00, '2015-02-25', 'Agência', sysdate(), 6);
insert into Saque values (null, 100.00, '2016-01-07', 'Agência', sysdate(), 1);
insert into Saque values (null, 200.00, '2016-01-08', 'Caixa Eletrônico', sysdate(), 4);
insert into Saque values (null, 120.00, '2016-03-20', 'Caixa Eletrônico', sysdate(), 2);
insert into Saque values (null, 100.00, '2016-03-23', 'Agência', sysdate(), 7);
insert into Saque values (null, 200.00, '2016-05-09', 'Caixa Eletrônico', sysdate(), 4);
insert into Saque values (null, 120.00, '2016-06-16', 'Agência', sysdate(), 6);
insert into Saque values (null, 100.00, '2016-08-21', 'Caixa Eletrônico', sysdate(), 9);
insert into Saque values (null, 200.00, '2016-09-06', 'Caixa Eletrônico',sysdate(), 8);
insert into Saque values (null, 120.00, '2016-10-20', 'Caixa Eletrônico', sysdate(), 10);
insert into Saque values (null, 122.22, '2016-10-20', 'Agência', sysdate(), 2);
insert into Saque values (null,100,'2017-01-16','Caixa Eletrônico',sysdate(),12);
insert into Saque values (null,200,'2017-02-18','Agência',sysdate(),13);
insert into Saque values (null,150,'2017-03-11','Caixa Eletrônico',sysdate(),14);
insert into Saque values (null,300,'2017-04-10','Agência',sysdate(),15);
insert into Saque values (null,80,'2017-05-19','Caixa Eletrônico',sysdate(),16);
insert into Saque values (null,90,'2017-06-15','Agência',sysdate(),17);
insert into Saque values (null,500,'2017-07-21','Caixa Eletrônico',sysdate(),18);
insert into Saque values (null,60,'2017-08-02','Agência',sysdate(),19);
insert into Saque values (null,70,'2017-09-25','Caixa Eletrônico',sysdate(),20);
insert into Saque values (null,120,'2017-10-08','Agência',sysdate(),21);

create table Transferencia (
id_trans int primary key not null auto_increment,
valor_trans float not null,
data_trans date not null,
descricao_trans varchar (100),
id_cc_origem_fk int not null,
id_cc_destino_fk int not null,
foreign key (id_cc_origem_fk) references Conta_Corrente (id_cc),
foreign key (id_cc_destino_fk) references Conta_Corrente (id_cc)
);

insert into Transferencia values (null, 5100.00, '2010-01-01', 'Pagamento Pensão', 4, 1);
insert into Transferencia values (null, 150.00, '2011-09-20', 'Compra Moto', 2, 3);
insert into Transferencia values (null, 50.00, '2013-10-23', 'Pagamento Divida', 3, 1);
insert into Transferencia values (null, 1000.00, '2014-12-29', 'Mesada Filho', 10, 3);
insert into Transferencia values (null, 660.00, '2016-11-30', 'Divida Banco', 1, 9);
insert into Transferencia values (null, 340.00, '2016-10-10', 'Pagamento', 7, 6);
INSERT INTO Transferencia VALUES (NULL, 250.00, '2018-01-02', 'Pagamento', 5, 3);
INSERT INTO Transferencia VALUES (NULL, 780.00, '2018-01-03', 'Compra Equipamento', 8, 2);
INSERT INTO Transferencia VALUES (NULL, 120.00, '2018-01-04', 'Ajuda', 4, 6);
INSERT INTO Transferencia VALUES (NULL, 940.00, '2018-01-05', 'Pagamento Serviço', 7, 10);
INSERT INTO Transferencia VALUES (NULL, 310.00, '2018-01-06', 'Divida', 2, 11);
INSERT INTO Transferencia VALUES (NULL, 1500.00, '2018-01-07', 'Pagamento Aluguel', 10, 1);
INSERT INTO Transferencia VALUES (NULL, 420.00, '2018-01-08', 'Compra', 6, 9);
INSERT INTO Transferencia VALUES (NULL, 95.00, '2018-01-09', 'Ajuda Familiar', 3, 7);
INSERT INTO Transferencia VALUES (NULL, 600.00, '2018-01-10', 'Pagamento', 12, 14);
INSERT INTO Transferencia VALUES (NULL, 270.00, '2018-01-11', 'Compra Internet', 13, 15);
INSERT INTO Transferencia VALUES (NULL, 880.00, '2020-01-12', 'Pagamento Parcela', 16, 12);
INSERT INTO Transferencia VALUES (NULL, 135.00, '2020-01-13', 'Divida', 14, 18);
INSERT INTO Transferencia VALUES (NULL, 510.00, '2020-01-14', 'Compra Online', 17, 19);
INSERT INTO Transferencia VALUES (NULL, 760.00, '2022-01-15', 'Pagamento', 18, 16);
INSERT INTO Transferencia VALUES (NULL, 300.00, '2022-01-16', 'Ajuda', 19, 21);
INSERT INTO Transferencia VALUES (NULL, 450.00, '2022-01-17', 'Pagamento Serviço', 20, 17);
INSERT INTO Transferencia VALUES (NULL, 200.00, '2022-01-18', 'Compra', 21, 13);
INSERT INTO Transferencia VALUES (NULL, 980.00, '2025-01-19', 'Pagamento', 15, 20);
INSERT INTO Transferencia VALUES (NULL, 670.00, '2025-01-20', 'Divida', 9, 5);
INSERT INTO Transferencia VALUES (NULL, 340.00, '2025-01-21', 'Pagamento', 11, 4);

create table Pagamento (
id_pag int primary key not null auto_increment,
valor_pag float not null,
data_pag date not null,
tipo_pag varchar (100),
dataVencimento_pag date not null,
codigoBarras_pag varchar (300),
id_cc_fk int not null,
foreign key (id_cc_fk) references Conta_Corrente (id_cc)
);

insert into Pagamento values (null, 300.00, '2015-10-20', 'Boleto', '2025-10-20', '1212312111131', 1);
insert into Pagamento values (null, 54.00, '2015-01-20', 'Convênio', '2025-01-20', '787987987987', 2);
insert into Pagamento values (null, 89.00, '2016-06-20', 'Boleto', '2025-06-22', '6544678979', 1);
insert into Pagamento values (null, 321.00, '2016-10-20', 'Convênio', '2025-10-20', '156546465454', 2);
insert into Pagamento values (null, 123.00, '2016-11-08', 'Boleto', '2025-11-09', '132131564587', 1);
insert into Pagamento values (null,120,'2017-01-10','Boleto','2025-01-15','111111111',12);
insert into Pagamento values (null,250,'2017-02-10','Convênio','2025-02-20','222222222',13);
insert into Pagamento values (null,90,'2017-03-10','Boleto','2025-03-12','333333333',14);
insert into Pagamento values (null,330,'2017-04-10','Convênio','2025-04-15','444444444',15);
insert into Pagamento values (null,500,'2017-05-10','Boleto','2025-05-14','555555555',16);
insert into Pagamento values (null,75,'2017-06-10','Convênio','2025-06-15','666666666',17);
insert into Pagamento values (null,620,'2017-07-10','Boleto','2025-07-20','777777777',18);
insert into Pagamento values (null,80,'2017-08-10','Convênio','2025-08-14','888888888',19);
insert into Pagamento values (null,150,'2017-09-10','Boleto','2025-09-18','999999999',20);
insert into Pagamento values (null,430,'2017-10-10','Convênio','2025-10-20','101010101',21);

-- Exercícios

-- 1. Selecione o nome do cliente e quantidade total de depósitos que a conta dele possui;
select
cliente.nome_cli as Nome,
(select count(valor_dep) from deposito where conta_corrente.id_cc = deposito.id_cc_fk) as Total
from cliente inner join conta_corrente on (cliente.id_cli = conta_corrente.id_cli_fk);

-- 2. Selecione o nome e o CPF do cliente e a última data em que ele realizou um saque.
select
cliente.nome_cli as Nome,
cliente.cpf_cli as CPF,
(select MAX(data_saq) from saque where conta_corrente.id_cc = saque.id_cc_fk) as "Última Data"
from cliente inner join conta_corrente on (cliente.id_cli = conta_corrente.id_cli_fk);

-- 3. Selecione o número da conta e o total de vezes que já foram realizados saques na conta.
select
conta_corrente.numero_cc as "Número da Conta",
(select count(valor_saq) from saque where conta_corrente.id_cc = saque.id_cc_fk) as Qdt
from conta_corrente;

-- 4. Selecione o nome do cliente, o número da conta corrente e a soma total de
-- saques já realizados na conta.
select
cliente.nome_cli as Nome,
(select numero_cc from conta_corrente where conta_corrente.id_cc = saque.id_cc_fk) as "Número sa Conta",
(select sum(valor_saq) from saque where conta_corrente.id_cc = saque.id_cc_fk) as "Total de Saques"
from cliente inner join conta_corrente on cliente.id_cli = conta_corrente.id_cli_fk
inner join saque on conta_corrente.id_cc = saque.id_cc_fk;

-- 5. Selecione os clientes que possuem pelo menos uma conta corrente.
select
cliente.nome_cli as Nome
from cliente where exists (
select 1 from conta_corrente where conta_corrente.id_cli_fk = cliente.id_cli
);

-- 6. Selecione o número das contas que possuem pelo menos um saque.
select
conta_corrente.numero_cc as "Número da conta"
from conta_corrente where exists (
select 1 from saque where conta_corrente.id_cc = saque.id_cc_fk
);

-- 7. Selecione as contas cujo saldo é maior que o saldo de todas as contas da agência 1.
select
conta_corrente.numero_cc as Conta
from conta_corrente where saldo_cc > all(
select saldo_cc from conta_corrente where id_ag_fk = 1
);

-- 8. Selecione o nome dos clientes que não possuem nenhuma conta corrente cadastrada.
select
cliente.nome_cli as Nomes
from cliente where not exists(
select 1 from conta_corrente where cliente.id_cli = conta_corrente.id_cli_fk
);

-- 9. Atualize o limite das contas para 800 para clientes que possuem renda maior que 5000.
update conta_corrente set valorLimite_cc = 800
where id_cli_fk in (
	select id_cli from cliente where renda_cli > 5000 
);

-- 10. Normalize o atributo endereço presente na tabela CLIENTE. Você deve migrar 
-- os dados existes em cliente para a nova tabela.
create table endereco (
    id_end int primary key auto_increment,
    rua_end varchar(255),
    numero_end varchar(10),
    bairro_end varchar(255),
    cidade_end varchar(255),
    uf_end varchar(10)
);

insert into endereco (rua_end, numero_end, bairro_end, cidade_end, uf_end)
select distinct rua_cli, num_cli, bairro_cli, cidade_cli, uf_cli
from cliente;

alter table cliente add id_end_fk int;

SET SQL_SAFE_UPDATES = 0;

UPDATE cliente c INNER JOIN endereco e 
ON c.rua_cli = e.rua_end
AND c.num_cli = e.numero_end
AND c.bairro_cli = e.bairro_end
AND c.cidade_cli = e.cidade_end
AND c.uf_cli = e.uf_end
SET c.id_end_fk = e.id_end;

ALTER TABLE cliente ADD CONSTRAINT fk_cliente_endereco
FOREIGN KEY (id_end_fk) REFERENCES endereco(id_end);

ALTER TABLE cliente 
DROP COLUMN rua_cli,
DROP COLUMN num_cli,
DROP COLUMN bairro_cli,
DROP COLUMN cidade_cli,
DROP COLUMN uf_cli;



