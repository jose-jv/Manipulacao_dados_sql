use restaurante;

select  * from pedidos where id_funcionario = 4 and status = 'Pendente'; 

select * from pedidos where not status = 'ConcluÃ­do';

select * from pedidos where id_produto   in (1, 3, 5, 7 ,8);

select * from clientes where nome like'c%';

select * from info_produtos
 where ingredientes like 'frango%' or  ingredientes like 'carne%';

select * from produtos where preco between 20 and 30;

update pedidos set status = null where id_pedido = 6;
select * from pedidos where status is null; 

select id_pedido,status, ifnull(status,'cancelado') from pedidos;

select nome,cargo,salario, case
when salario > 3000 then 'Acima da mÃ©dia' 
else 'Abaixo da mÃ©dia' end as media_salario
from funcionarios