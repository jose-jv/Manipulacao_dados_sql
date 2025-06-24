use restaurante;
select * from produtos;

select nome, categoria, preco  from  produtos where preco >30;

select  nome, telefone , data_nascimento from clientes where year(data_nascimento) <1985;

select id_produto, descricao from produtos where descricao = 'carne';

select nome,categoria from produtos order by categoria asc, nome asc;

select nome, preco from produtos order by preco desc limit 5;

select nome,categoria from produtos where categoria ='Prato Principal' limit 2 offset 5;

create table backup_pedidos as select * from pedidos;












