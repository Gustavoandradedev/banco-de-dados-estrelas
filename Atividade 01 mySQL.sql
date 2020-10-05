/* 1- Criando a tabela cidade. */

create table estrelas.cidade (
nome varchar(50) not null,
cep varchar(8) not null primary key,
numero_habitantes int not null,
capital boolean not null,
uf varchar(2) not null,
renda_percapita decimal(8,2) not null,
data_fundacao date not null
);
/* 2- Inserindo as 5 cidades*/

insert into estrelas.cidade (
nome,
cep,
numero_habitantes,
capital,
uf,
renda_percapita,
data_fundacao)
values
('Campinas','13087018',1080113, FALSE, 'SP', 3657.5, '1797-11-04'),
('Valinhos','13270000',120258, FALSE, 'SP', 2800, '1856-05-28'),
('Abaeté','35620000',4419, FALSE, 'MG', 1900, '1895-09-10'),
('São Paulo','01010010',11253503, TRUE, 'SP', 4493.3, '1558-09-05'),
('Rio de Janeiro','23799326',6320446, TRUE, 'RJ', 4300.5, '1565-03-01');

/* 3- Removendo a cidade pela chave primária*/

delete from estrelas.cidade
where cep = '35620000';

/* 4- Modifiquei a  tabela adicionando 10% de habitantes em 2 cidades*/

update estrelas.cidade
set numero_habitantes = (120258 + 12025.8)
where cep = '13270000';

update estrelas.cidade
set numero_habitantes = (1080113 + 108011.3)
where cep = '13087018';

/* 5- Criei a tabela estado */

create table estrelas.estado (
uf varchar(02) not null primary key,
nome varchar(30) not null
);

/* 6- Inserir os estados */

insert into estrelas.estado (
uf,
nome)
values
 ('SP', 'São Paulo'),
 ('RJ', 'Rio de Janeiro');

/* 7- Alterei a tabela estado para chave primária*/

alter table estrelas.cidade
add foreign key (uf) references estado(uf);

/* 8- Alterei a tabela estado e adicionei o campo região*/ 

alter table estrelas.estado
add column regiao varchar(30);

/* Incremento - Para não deixar a tabela em branco eu adicionei a região*/

update estrelas.estado
set regiao = 'Sudeste'
where uf = 'SP' or uf = 'RJ';

select * from cidade

