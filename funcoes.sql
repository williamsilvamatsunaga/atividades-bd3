-- William da Silva Matsunaga

## Exercícios

create database bd_nosql;
use bd_nosql;

-- 1. Crie uma função chamada calcula_media que receba três números como parâmetros e
-- retorne a média aritmética desses números. A função deve ser utilizada em uma consulta
-- para calcular a média de três valores fornecidos pelo usuário.

delimiter $$ 
create function calcula_media (num1 int, num2 int, num3 int) returns float deterministic
begin
	declare resultado float;
    set resultado = (num1 + num2 + num3) / 3;
    return resultado;
end $$ 
delimiter ;

select calcula_media(10, 8, 6);

-- 2. Crie uma função chamada verifica_paridade que receba um número inteiro como
-- parâmetro e retorne 'Par' se o número for par e 'Ímpar' se o número for ímpar. Utilize a
-- função em uma consulta para verificar a paridade de diferentes números.

delimiter $$
create function verifica_paridade (num1 int) returns varchar(100) deterministic
begin
declare resultado varchar(100);
	if (num1 % 2 = 0) then
		set resultado = 'Par';
	else
		set resultado = 'Ímpar';
	end if;
    
    return resultado;
end;
$$ delimiter ;

select verifica_paridade(11);

-- 3. Crie uma função chamada converte_moeda que receba um valor monetário em reais e um
-- fator de conversão (como o valor do dólar) e retorne o valor convertido para dólares.
-- Utilize a função em uma consulta para converter valores.

delimiter $$
create function converter_moedas (reais float, cotacao float) returns float deterministic
begin
	declare valor_convercao float;
    set valor_convercao = reais / cotacao;
    return valor_convercao;
end $$
delimiter ;

select converter_moedas (100, 5.00) as valor_em_dolar;

-- 4. Crie uma função chamada verifica_maioridade que receba a data de nascimento de uma
-- pessoa e retorne 'Maior de Idade' se a pessoa tiver 18 anos ou mais, ou 'Menor de Idade'
-- se tiver menos de 18 anos. A função deve ser utilizada em uma consulta para verificar a
-- maioridade de diferentes pessoas.

delimiter $$
create function verificar_maioridade (data_nasc date) returns varchar(100) deterministic
begin
	declare idade int;
    set idade = year(curdate()) - year(data_nasc);
    if (idade >= 18) then
		return 'Maior de Idade';
	else
		return 'Menor de Idade';
	end if;
end $$
delimiter ;

select verificar_maioridade('2000/05/10') as resultado;

-- 5. Crie uma função chamada calcula_juros que receba um valor principal, uma taxa de juros e
-- um período de tempo em anos, e retorne o valor dos juros simples calculados. Utilize a
-- função em uma consulta para calcular os juros de diferentes valores.

delimiter $$
create function calcula_juros (valor float, taxa float, anos int) returns float deterministic
begin
	declare juros float;
    set juros = valor * taxa * anos;
    return juros;
end $$
delimiter ;

select calcula_juros(1000, 0.10, 2) as juros;

-- 6. Crie uma função chamada validar_cpf que receba um cpf com mascara na chamada e retorne se 
-- esse CPF é valido ou não, de acordo com a regra matemática de validação de CPF.

delimiter $$
create function validar_cpf (cpf varchar(100)) returns varchar(100) deterministic
begin
	set cpf = replace(replace(replace(cpf, '.', ''),'-', ''), ' ', ''); 
    
    if(length(cpf) = 11) then
		return 'CPF Válido';
	else
		return 'CPF Invalido';
	end if;
end$$
delimiter ;

select validar_cpf('529.982.247-25');