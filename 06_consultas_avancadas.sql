use restaurante;

/*
 - Crie uma view chamada resumo_pedido do join entre essas tabelas
*/

create  view resumo_pedido as 
select c.nome as nome_cliente, c.email, pe.id_pedido, pe.quantidade ,
 pe.data_pedido, f.nome as nome_funcionario, pr.nome as nome_produto, pr.preco
from clientes c
join pedidos pe on pe.id_cliente =  c.id_cliente
join funcionarios f on f.id_funcionario = pe.id_funcionario
join produtos pr on pr.id_produto = pe.id_produto;

select * from resumo_pedido limit 10;

/*
Selecione o id do pedido, nome do cliente e o total
 (quantidade * preco) de cada pedido da view resumo_pedido
*/

select  id_pedido, nome_cliente, (quantidade * preco) as total_pedido
from  resumo_pedido;

/*
Atualiza o view resumo pedido, adicionando campo total
*/

create or replace view resumo_pedido as 
select c.nome as nome_cliente, c.email, pe.id_pedido, pe.quantidade ,
 pe.data_pedido, f.nome as nome_funcionario, pr.nome as nome_produto, pr.preco, (pe.quantidade * pr.preco) as total_pedido
from clientes c
join pedidos pe on pe.id_cliente =  c.id_cliente
join funcionarios f on f.id_funcionario = pe.id_funcionario
join produtos pr on pr.id_produto = pe.id_produto;

/*
Repita a consulta da questão 3, utilizando o campo total adicionado
*/
select  id_pedido, nome_cliente, total_pedido
from  resumo_pedido;

/*
Repita a consulta da pergunta anterior, com uso do EXPLAIN para verificar e compreender o 
JOIN que está oculto na nossa query
*/

  EXPLAIN  select  id_pedido, nome_cliente, total_pedido
from  resumo_pedido;


/*
Crie uma função chamada ‘BuscaIngredientesProduto’, que irá retornar os ingredientes da tabela info produtos,
 quando passar o id de produto como argumento (entrada) da função.
*/

delimiter //
create function BuscaIngredientesProduto(idproduto int)
returns varchar(255)
reads sql data
begin 
 declare ingredientes_produto varchar(255);
select ingredientes into ingredientes_produto
from info_produtos
where idproduto = id_produto;
return  ingredientes_produto;
end //
delimiter ;

/*
Execute a função ‘BuscaIngredientesProduto’ com o id de produto 10
*/

select BuscaIngredientesProduto(10);


/*
Crie uma função chamada ‘mediaPedido’ que irá retornar uma mensagem dizendo que o total do pedido é acima,
 abaixo ou igual a média de todos os pedidos, quando passar o id do pedido como argumento da função
*/
delimiter //
create function mediaPedido(idpedido int)
returns varchar(255)
reads sql data 
begin
declare total_pedido decimal(10,2);
declare media_total decimal(10,2);
declare resultado varchar(250);

select sum(quantidade * preco) into total_pedido
from pedidos
  where id_pedido = idpedido;


select avg(quantidade * preco) into media_total
from pedidos;

   if total_pedido > media_total then
        set resultado = 'O total do pedido é acima da média de todos os pedidos';
    elseif total_pedido < media_total then
        set resultado = 'O total do pedido é abaixo da média de todos os pedidos';
    else
        set resultado = 'O total do pedido é igual à média de todos os pedidos';
    end if;

    return resultado;
end //
delimiter ;



/*
Execute a função ‘mediaPedido’ com o id de pedido 5 e depois 6.
*/

select mediaPedido(5);
select mediaPedido(6);


