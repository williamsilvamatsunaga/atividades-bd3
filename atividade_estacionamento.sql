-- William da Silva Matsunaga

CREATE DATABASE estacionamento;

USE estacionamento;

CREATE TABLE proprietario (
	id_pro INT PRIMARY KEY AUTO_INCREMENT,
    nome_pro VARCHAR(300) NOT NULL,
    cpf_pro VARCHAR (300) NOT NULL UNIQUE,
    telefone_pro VARCHAR(15) NOT NULL
);

INSERT INTO proprietario (nome_pro, cpf_pro, telefone_pro) VALUES
("Maria", "444.444.444-44", "(69) 99994-2754"),
("Marcos", "555.555.555-85", "(69) 99994-2754");

INSERT INTO proprietario (nome_pro, cpf_pro, telefone_pro) VALUES
("William", "063.402.382-97", "(69) 99994-2754");

SELECT * FROM proprietario; 

CREATE TABLE vaga (
	id_vag INT PRIMARY KEY AUTO_INCREMENT,
    numero_vag INT NOT NULL UNIQUE,
    status_vag BOOL NOT NULL
);

INSERT INTO vaga (numero_vag, status_vag) VALUES
(10, true),
(20, false);

INSERT INTO vaga (numero_vag, status_vag) VALUES
(30, true);

CREATE TABLE veiculo (
	id_vei INT PRIMARY KEY AUTO_INCREMENT,
    modelo_vei VARCHAR(300) NOT NULL,
    placa_vei VARCHAR (8) NOT NULL UNIQUE,
    cor_vei VARCHAR(300) NOT NULL
);

INSERT INTO veiculo (modelo_vei, placa_vei, cor_vei) VALUES
("GOL", "NDD-1020", "BRANCO"),
("HILUX", "AAB-1010", "PRETO");

INSERT INTO veiculo (modelo_vei, placa_vei, cor_vei) VALUES
("GOL G3 2003 AP 1.6", "SLH-2I**", "PRETO");

CREATE TABLE estacionamento (
	id_est INT PRIMARY KEY AUTO_INCREMENT,
    data_est DATE NOT NULL,
    hora_entrada_est TIME,
    hora_saida_est TIME
);

INSERT INTO estacionamento (data_est, hora_entrada_est, hora_saida_est) VALUES
('2026-02-12', '15:00:00', null),
('2026-02-11', '10:00:00', '13:00:00');

INSERT INTO estacionamento (data_est, hora_entrada_est, hora_saida_est) VALUES
('2026-02-14', '14:00:00', '18:00:00');

-- Selecione as pessoas com nome iniciado com a letra “M” ou nome terminado
-- com a letra “S” e que contenha a letra “A” no nome.

SELECT * FROM proprietario WHERE (nome_pro LIKE 'M%' OR nome_pro LIKE '%S')
AND nome_pro LIKE '%A%';

-- Atualize o registro de Maria e adicione o telefone (69) 92222-2222 e o CPF 137.123.121-11.

UPDATE proprietario SET cpf_pro = "137.123.121-11", telefone_pro = "(69) 92222-2222"
WHERE id_pro = 1;

SELECT *FROM proprietario;

-- Exclua todos os veículos com cor preta ou azul que tenham placas iniciadas com
-- a letra “N” ou número 10 e com modelo de cilindrada 2.0.

INSERT INTO veiculo (modelo_vei, placa_vei, cor_vei)
VALUES ("CIVIC 2.0 FLEX", "NAA-1010", "PRETO");

SELECT * FROM veiculo;

SELECT *
FROM veiculo 
WHERE (cor_vei = 'PRETO' OR cor_vei = 'AZUL')
AND (placa_vei LIKE 'N%' OR placa_vei LIKE '%10%')
AND modelo_vei LIKE '%2.0%';


DELETE FROM veiculo 
WHERE (cor_vei = 'PRETO' OR cor_vei = 'AZUL')
AND (placa_vei LIKE 'N%' OR placa_vei LIKE '%10%')
AND modelo_vei LIKE '%2.0%';

-- Selecione as vagas com número maior que 100 e menor que 200 e com status livre.

-- FOI COLOCADO ENTRE 19 E 30 PARA TESTE Para aparecer

SELECT * FROM VAGA WHERE numero_vag
BETWEEN 9 AND 31 AND status_vag = 1;

select * from vaga;


