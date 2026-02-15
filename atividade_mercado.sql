drop database supermecado;

CREATE DATABASE supermecado;

USE supermecado;

CREATE TABLE fornecedores (
	id_for INT PRIMARY KEY AUTO_INCREMENT,
    nome_for VARCHAR(300) NOT NULL,
    cnpj_for VARCHAR(20) UNIQUE,
    cpf_for VARCHAR(14) UNIQUE,
    endereco_for VARCHAR (300) NOT NULL,
    telefone_for VARCHAR(20) NOT NULL
);

CREATE TABLE categorias (
    id_cat INT AUTO_INCREMENT PRIMARY KEY,
    nome_cat VARCHAR(300) NOT NULL UNIQUE,
    descricao_cat VARCHAR(300)
);

CREATE TABLE produtos (
    id_pro INT AUTO_INCREMENT PRIMARY KEY,
    nome_pro VARCHAR(300) NOT NULL,
    preco_pro DECIMAL(10,2) NOT NULL,
    fk_id_categoria INT NOT NULL,
    FOREIGN KEY (fk_id_categoria) REFERENCES categorias (id_cat)
);

CREATE TABLE estoques (
    id_est INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_produto INT NOT NULL UNIQUE,
    quantidade_est INT NOT NULL,
    FOREIGN KEY (fk_id_produto) REFERENCES produtos (id_pro)
);

CREATE TABLE caixas (
    id_cai INT AUTO_INCREMENT PRIMARY KEY,
    saldo_cai DECIMAL(10,2) NOT NULL
);

CREATE TABLE despesas (
    id_des INT AUTO_INCREMENT PRIMARY KEY,
    descricao_des VARCHAR(300),
    valor_des DECIMAL(10,2) NOT NULL,
    data_des DATE NOT NULL,
    fk_id_caixa INT NOT NULL,
    FOREIGN KEY (fk_id_caixa) REFERENCES caixas (id_cai)
);

CREATE TABLE pagamentos (
    id_pag INT AUTO_INCREMENT PRIMARY KEY,
    valor_pag DECIMAL(10,2) NOT NULL,
    data_pag DATE NOT NULL,
    fk_id_caixa INT NOT NULL,
    FOREIGN KEY (fk_id_caixa) REFERENCES caixas (id_cai)
);

CREATE TABLE clientes (
    id_cli INT AUTO_INCREMENT PRIMARY KEY,
    nome_cli VARCHAR(300) NOT NULL,
    cpf_cli VARCHAR(20) NOT NULL UNIQUE,
    telefone_cli VARCHAR(20) NOT NULL
);

CREATE TABLE veiculos (
    id_vei INT AUTO_INCREMENT PRIMARY KEY,
    placa_vei VARCHAR(10) NOT NULL UNIQUE,
    modelo_vei VARCHAR(300) NOT NULL
);

CREATE TABLE entregas (
    id_ent INT AUTO_INCREMENT PRIMARY KEY,
    data_ent DATE NOT NULL,
    status_ent BOOL NOT NULL,
    fk_id_veiculo INT NOT NULL,
    FOREIGN KEY (fk_id_veiculo) REFERENCES veiculos (id_vei)
);

CREATE TABLE funcionarios (
    id_fun INT AUTO_INCREMENT PRIMARY KEY,
    nome_fun VARCHAR(300) NOT NULL,
    cargo_fun VARCHAR(300) NOT NULL,
    salario_fun DECIMAL(10,2) NOT NULL
);

CREATE TABLE compras (
    id_com INT AUTO_INCREMENT PRIMARY KEY,
    data_com DATE NOT NULL,
    valor_com DECIMAL(10,2),
    fk_id_fornecedor INT NOT NULL,
    fk_id_funcionario INT NOT NULL,
    FOREIGN KEY (fk_id_fornecedor) REFERENCES fornecedores (id_for),
    FOREIGN KEY (fk_id_funcionario) REFERENCES funcionarios (id_fun)
);

CREATE TABLE vendas (
    id_ven INT AUTO_INCREMENT PRIMARY KEY,
    data_ven DATE NOT NULL,
    valor_ven DECIMAL(10,2) NOT NULL,
    fk_id_cliente INT NOT NULL,
    fk_id_entrega INT,
    fk_id_funcionario INT NOT NULL,
    FOREIGN KEY (fk_id_cliente) REFERENCES clientes (id_cli),
    FOREIGN KEY (fk_id_entrega) REFERENCES entregas (id_ent),
    FOREIGN KEY (fk_id_funcionario) REFERENCES funcionarios (id_fun)
);

CREATE TABLE recebimentos (
    id_rec INT AUTO_INCREMENT PRIMARY KEY,
    valor_rec DECIMAL(10,2) NOT NULL,
    data_rec DATE NOT NULL,
    fk_id_venda INT NOT NULL,
    fk_id_caixa INT NOT NULL,
    FOREIGN KEY (fk_id_venda) REFERENCES vendas (id_ven),
    FOREIGN KEY (fk_id_caixa) REFERENCES caixas (id_cai)
);

CREATE TABLE itens_venda (
    id_itv INT AUTO_INCREMENT PRIMARY KEY,
    quantidade_itv INT NOT NULL,
    preco_unitario_itv DECIMAL(10,2) NOT NULL,
	fk_id_venda INT NOT NULL,
    fk_id_produto INT NOT NULL,
    FOREIGN KEY (fk_id_venda) REFERENCES vendas (id_ven),
    FOREIGN KEY (fk_id_produto) REFERENCES produtos (id_pro)
);

CREATE TABLE itens_compra (
    id_itc INT AUTO_INCREMENT PRIMARY KEY,
    quantidade_itc INT NOT NULL,
    preco_unitario_itc DECIMAL(10,2) NOT NULL,
    fk_id_compra INT NOT NULL,
    fk_id_produto INT NOT NULL,
    FOREIGN KEY (fk_id_compra) REFERENCES compras (id_com),
    FOREIGN KEY (fk_id_produto) REFERENCES produtos (id_pro)
);

INSERT INTO fornecedores (nome_for, cnpj_for, cpf_for, endereco_for, telefone_for) VALUES
('Distribuidora Resenha', '12.345.678/0001-01', NULL, 'Linha do km 14', '(69) 99994-2754'),
('Distribuidora Resenha', '12.345.678/0001-02', NULL, 'Linha do km 14', '(69) 99994-2754'),
('Distribuidora Resenha', '12.345.678/0001-03', NULL, 'Linha do km 14', '(69) 99994-2754');

INSERT INTO categorias (nome_cat, descricao_cat) VALUES
('Bebidas', 'Refrigerantes e sucos'),
('Alimentos', 'Produtos alimentícios');

INSERT INTO produtos (nome_pro, preco_pro, fk_id_categoria) VALUES
('Coca-Cola 2L', 12.50, 1),
('Arroz 5kg', 30.00, 2),
('Feijão 1kg', 8.50, 2);

SELECT * FROM recebimentos;

INSERT INTO estoques (fk_id_produto, quantidade_est) VALUES
(1, 100),
(2, 50),
(3, 200);

INSERT INTO caixas (saldo_cai) VALUES
(1000.00),
(500.00),
(2000.00);

INSERT INTO despesas (descricao_des, valor_des, data_des, fk_id_caixa) VALUES
('Conta de Luz', 350.00, '2026-02-01', 1),
('Internet', 150.00, '2026-02-02', 1),
('Manutenção', 200.00, '2026-02-03', 2);

INSERT INTO pagamentos (valor_pag, data_pag, fk_id_caixa) VALUES
(500.00, '2026-02-01', 1),
(300.00, '2026-02-02', 2),
(700.00, '2026-02-03', 3);

INSERT INTO clientes (nome_cli, cpf_cli, telefone_cli) VALUES
('Carlos Henrique', '111.222.333-44', '(69) 98888-1111'),
('Mariana Souza', '555.666.777-88', '(69) 98888-2222'),
('Pedro Lima', '999.888.777-66', '(69) 98888-3333');

INSERT INTO veiculos (placa_vei, modelo_vei) VALUES
('ABC1A23', 'Fiat Strada'),
('DEF4B56', 'Volkswagen Saveiro'),
('GHI7C89', 'Chevrolet Montana');

INSERT INTO entregas (data_ent, status_ent, fk_id_veiculo) VALUES
('2026-02-05', TRUE, 1),
('2026-02-06', FALSE, 2),
('2026-02-07', TRUE, 3);

INSERT INTO funcionarios (nome_fun, cargo_fun, salario_fun) VALUES
('Lucas Almeida', 'Vendedor', 2500.00),
('Fernanda Costa', 'Caixa', 2200.00),
('Rafael Mendes', 'Gerente', 4000.00);

INSERT INTO compras (data_com, valor_com, fk_id_fornecedor, fk_id_funcionario) VALUES
('2026-02-01', 1500.00, 1, 3),
('2026-02-02', 800.00, 2, 3),
('2026-02-03', 600.00, 3, 3);

INSERT INTO vendas (data_ven, valor_ven, fk_id_cliente, fk_id_entrega, fk_id_funcionario) VALUES
('2026-02-05', 125.00, 1, 1, 1),
('2026-02-06', 89.90, 2, NULL, 1),
('2026-02-07', 39.90, 3, 3, 2);

INSERT INTO recebimentos (valor_rec, data_rec, fk_id_venda, fk_id_caixa) VALUES
(125.00, '2026-02-05', 1, 1),
(89.90, '2026-02-06', 2, 2),
(39.90, '2026-02-07', 3, 3);

INSERT INTO itens_venda (quantidade_itv, preco_unitario_itv, fk_id_venda, fk_id_produto) VALUES
(5, 12.50, 1, 1),
(3, 28.90, 2, 2),
(10, 3.99, 3, 3);

INSERT INTO itens_compra (quantidade_itc, preco_unitario_itc, fk_id_compra, fk_id_produto) VALUES
(50, 10.00, 1, 1),
(30, 25.00, 2, 2),
(100, 2.50, 3, 3);










