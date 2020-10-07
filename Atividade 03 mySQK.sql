insert into estrelas.estado (
uf,
nome)
values
 ('MG', 'Minas Gerais'),
 ('GO', 'Goiás');

insert into estrelas.cidade (
nome,
cep,
numero_habitantes,
capital,
uf,
renda_percapita,
data_fundacao)
values
('Alfenas','35620101',73774, FALSE, 'MG', 2717, '1881-10-15'),
('Barro Alto','56986320',79058, FALSE, 'GO', 1900, '1959-11-14'),
('Sumaré','13150000',241311, FALSE, 'SP', 2105, '1868-07-26'),
('Paulinia','13140000',82146, false, 'SP', 5123, '1944-11-30'),
('Limeira','13487031',276022, false, 'SP', 6800, '1826-09-15');


/*1 -Selecione o nome, o estado e o número de habitantes das cidades que pertencem aos estados
de São Paulo, Minas Gerais e Goiás.*/

select c.nome, c.uf, c.numero_habitantes
from cidade c, estado e
where c.uf = e.uf 
and e.nome in ('São Paulo', 'Minas Gerais', 'Goiás');

/*2- Selecione os dados das cidades que não ficam em São Paulo, Minas Gerais e Paraíba.*/

select c.*
from cidade c
where c.uf not in ('SP','MG','PB');

/*3- Selecione os dados das cidades cujos nomes dos estados à que elas pertencem começam
com a letra M.*/

select c.*
from cidade c, estado e 
where c.uf = e.uf
and e.nome like 'M%';

/*4- Conte quantas cidades ficam na região Centro-Oeste e tem mais do que 400 mil habitantes.*/

select count(*)
from cidade c, estado e
where c.uf = e.uf
and e.regiao = 'Centro-Oeste'
and c.numero_habitantes > 400000;

/*5- Obtenha o total da população da região Sudeste.*/

select sum(c.numero_habitantes) as 'Total Região Sudeste'
from cidade c, estado e
where c.uf = e.uf
and e.regiao = 'Sudeste';

/*6- Obtenha a renda per capita média da região Nordeste.*/

select avg(c.renda_percapita) as 'Renda Per Capita do Nordeste'
from cidade c, estado e
where c.uf = e.uf
and e.regiao = 'Nordeste';

/*7 -Obtenha a maior população entre as cidades da região Centro-Oeste.*/

select max(c.numero_habitantes)
from cidade c, estado e
where c.uf = e.uf
and e.regiao = 'Centro-Oeste';

/*8- Obtenha a média da renda per capita das capitais.*/

select round(avg(c.renda_percapita), 2)
from cidade c
where c.capital = 1;

/*9- Obtenha a data de fundação da cidade mais antiga entre as cidades da região Sudeste que
não sejam capitais e que tenham a população maior do que 100 mil habitantes.*/

select min(c.data_fundacao) 
from  cidade c, estado e
where c.uf = e.uf
and e.regiao = 'Sudeste'
and c.capital is false
and c.numero_habitantes > 100000;

/*10- Obtenha a média da renda per capita das cidades que não se encontram na região Sudeste e
Nordeste que tenham sido fundadas depois de 01 de Abril de 1500 e que tenham o nome
começado pela letra S.*/

select round(avg(c.renda_percapita),2)
from cidade c, estado e
where c.uf = e.uf
and e.regiao not in ('Centro-Oeste', 'Nordeste')
and c.data_fundacao > '1500-04-01'
and c.nome like 'S%';

select * from cidade