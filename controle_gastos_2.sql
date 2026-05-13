-- William da Silva Matsunaga

create database controle_gastos_2;
use controle_gastos_2;

create table controle (
id_cont int not null primary key auto_increment,
mes_cont varchar (100) not null,
saldo_anterior_cont float not null,
total_renda_cont float not null,
total_gastos_cont float not null,
saldo_final_cont float not null );

insert into controle values (null, 'Novembro/2025', 0, 1000, 0, 1000);

create table renda (
id_ren int not null primary key auto_increment,
referencia_ren varchar (100) not null,
valor_ren float not null,
data_ren date,
id_cont_fk int not null,
foreign key (id_cont_fk) references Controle (id_cont) );

create table gasto (
id_gas int not null primary key auto_increment,
referencia_gas varchar (100) not null,
valor_gas float not null,
data_gas date,
id_cont_fk int not null,
foreign key (id_cont_fk) references Controle (id_cont) );

-- Exercícios

-- 1. Crie gatilhos na tabela Renda que faça as seguintes ações após a inserção e exclusão de registros:
-- a) Atualize o total de renda na tabela Controle de acordo com operação (insert ou delete).
-- b) Atualize o saldo final na tabela Controle, sabendo que o saldo final é composto pela seguinte lógica: saldo final = saldo anterior + total de renda – total de gasto

delimiter $$
create trigger atualizar_controle_insert after insert on renda for each row
begin
	
    update controle set total_renda_cont = total_renda_cont + new.valor_ren
    where (id_cont = new.id_cont_fk);
    
    update controle set saldo_final_cont = saldo_anterior_cont + total_renda_cont - total_gastos_cont
    where (id_cont = new.id_cont_fk);

end;
$$ delimiter ;

delimiter $$
create trigger atualizar_controle_delete after delete on renda for each row
begin

    update controle set total_renda_cont = total_renda_cont - old.valor_ren
    where (id_cont = old.id_cont_fk);
    
    update controle set saldo_final_cont = saldo_anterior_cont + total_renda_cont - total_gastos_cont
    where (id_cont = old.id_cont_fk);

end;
$$ delimiter ;

insert into renda values (null, 'Salario 1', 4500.50, '2026-05-11', 1);
delete from renda where (id_ren = 2);

-- 2. Crie gatilhos na tabela Gasto que faça as seguintes ações após a inserção e exclusão de registros:
-- a) Atualize o total de gasto na tabela Controle de acordo com operação (insert ou delete).
-- b) Atualize o saldo final na tabela Controle, sabendo que o saldo final é composto pela seguinte lógica: saldo final = saldo anterior + total de renda – total de gasto

delimiter $$
create trigger atualizar_gasto_insert after insert on gasto for each row
begin
	update controle set total_gastos_cont = total_gastos_cont + new.valor_gas where (id_cont = new.id_cont_fk);
    update controle set saldo_final_cont = saldo_anterior_cont + total_renda_cont - total_gastos_cont where (id_cont = new.id_cont_fk);
end;
$$ delimiter ;

delimiter $$
create trigger atualizar_gasto_delete after delete on gasto for each row
begin
	update controle set total_gastos_cont = total_gastos_cont - old.valor_gas where (id_cont = old.id_cont_fk);
    update controle set saldo_final_cont = saldo_anterior_cont + total_renda_cont - total_gastos_cont where (id_cont = old.id_cont_fk);
end;
$$ delimiter ;

insert into gasto values (null, 'Conta de Luz', 250.75, '2026-05-12', 1);
insert into gasto values (null, 'Mercado', 500.00, '2026-05-12', 1);
insert into gasto values (null, 'Internet', 120.00, '2026-05-12', 1);

delete from gasto where id_gas = 2;

-- 3. Crie e teste um procedimento para inserir um novo Controle. Este novo procedimento deve receber como parâmetro de entrada apenas o mês de referência. 
-- - Não permita que seja inserido um Controle com o mês de referência igual, ou seja, que já exista na tabela Controle. 
-- - Saiba que o saldo anterior de um controle é igual ao saldo final do mês anterior. Assim, crie uma forma do procedimento buscar o saldo final do mês anterior 
-- e utilizar este valor como o saldo anterior na inserção. 
-- - Os valores de total de renda e total de gasto devem ser zerados. Já o valor saldo final deve ser igual ao valor do saldo anterior.

delimiter $$
create procedure inserirControle (mes varchar(100))
begin
	declare mes_existe int;
    declare saldo_anterior decimal;
	set mes_existe = (select count(mes_cont) from controle where mes_cont = mes); 
    set saldo_anterior = (select saldo_final_cont from controle order by id_cont desc limit 1);
    
    if (mes_existe = 0) then
		if (saldo_anterior is null) then
			set saldo_anterior = 0;
		end if;
        insert into controle (mes_cont, saldo_anterior_cont, total_renda_cont, total_gastos_cont, saldo_final_cont)
        values (mes, saldo_anterior, 0, 0, saldo_anterior);
        
        select 'Controle cadastrado com sucesso.' as mensagem;
    else
		select 'Mês já existente.';
	end if;
end;
$$ delimiter ;

call inserirControle('Dezembro/2025');

-- 4. Crie e teste um procedimento para inserir uma nova Renda. Faça uma verificação para garantir que o valor da renda inserida seja maior do que zero. 
-- Crie mensagens de confirmação ou alerta de acordo com o resultado da verificação. 

delimiter $$
create procedure inserirRenda (renferencia varchar(100), valor decimal, data date, cont_fk int)
begin
    if (valor > 0) then
		insert into renda (referencia_ren, valor_ren, data_ren, id_cont_fk) values (renferencia, valor, data, cont_fk) ;
        select 'Dados inseridos' Confirm;
	else
		select 'O valor deve ser maior que 0' Alert;
    end if;
end;
$$ delimiter ;

call inserirRenda('Salário', 3500, '2026-05-12', 1);

-- 5. Crie e teste um procedimento para excluir uma renda. Faça uma verificação para garantir que o ID da renda informado exista.

delimiter $$
create procedure excluirRenda (id int)
begin
	declare verificar int;
    set verificar = (select count(*) from renda where id_ren = id);
    
    if (verificar > 0) then
		delete from renda where id_ren = id;
        select 'Renda excluída com sucesso' Confirm;
    else
		select 'ID não ixistente' Alert;
	end if;
end;
$$ delimiter ;

call excluirRenda(256);

-- 6. Crie e teste um procedimento para inserir um novo Gasto. Faça uma verificação para garantir que não seja inserido gastos sem saldo disponível.

delimiter $$
create procedure inserirGasto (referencia varchar(100), valor float, data date, cont_fk int)
begin
	declare saldo_disponivel float;
    set saldo_disponivel = (select saldo_final_cont from controle where id_cont = cont_fk);
	if (valor <= saldo_disponivel and valor > 0) then
		insert into gasto (referencia_gas, valor_gas, data_gas, id_cont_fk) values (referencia, valor, data, cont_fk);
        
        select 'Saldo cadastrado com sucesso' Confirm;
    else
		select 'Sem saldo' Alerta;
	end if;
end;
$$ delimiter ;

call inserirGasto('Notebook', 5000, '2026-05-12', 1);

-- 7. Crie e teste um procedimento para excluir uma renda. Faça uma verificação para garantir que o ID da renda informado exista.

delimiter $$
create procedure excluirRenda2 (id int)
begin
	declare verificar int;
    set verificar = (select count(*) from renda where id_ren = id);
    if (verificar > 0) then
		delete from renda where id = id_ren;
        select 'Renda excluida' Confirm;
    else
		select 'Id não existe' Alert;
	end if;
end;
$$ delimiter ;

call excluirRenda(2);