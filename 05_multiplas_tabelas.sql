use restaurante;

select p.id_produto, p.nome, p.descricao, ip.ingredientes
from produtos p
join  info_produtos ip  on ip.id_produto = p.id_produto;


 select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome,  c.email
from pedidos pe
join  clientes c on c.id_cliente = pe.id_cliente;


select pe.id_pedido, pe.quantidade ,pe.data_pedido, c.nome as nome_cliente,
 c.email as email_cliente , f.nome as nome_funcionario
from pedidos pe
join clientes c on c.id_cliente = pe.id_cliente 
join funcionarios f on f.id_funcionario = pe.id_funcionario;


select pe.id_pedido, pe.quantidade, pe.data_pedido,
 c.nome as nome_cliente ,c.email  as email_cliente,
 f.nome as nome_funcionario,
 p.nome as nome_produto, p.preco as preco_produto
 from pedidos pe 
 join clientes c on c.id_cliente = pe.id_cliente
 join funcionarios f on f.id_funcionario  = pe.id_funcionario
 join produtos p on p.id_produto = pe.id_produto;
 
 
select c.nome
from clientes c
join pedidos p on c.id_cliente = p.id_cliente
WHERE p.status = 'Pendente'
order by p.id_pedido desc;


select c.id_cliente, c.nome
from clientes c
left join pedidos pe on c.id_cliente = pe.id_cliente
where pe.id_pedido is null;


select nome as nome_cliente,
(select count(*) from pedidos where pedidos.id_cliente = clientes.id_cliente) as total_pedido_cliente
from clientes;



select c.nome, pe.quantidade,p.preco, sum(pe.quantidade*p.preco) as preco_total
from clientes c 
left join pedidos pe on c.id_cliente =  pe.id_cliente
left join produtos p on p.id_produto = pe.id_produto
group by c.nome, pe.id_pedido;






