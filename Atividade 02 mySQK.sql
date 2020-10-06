
/*1 Selecione o nome e a renda per capita das cidades com mais de 5000 habitantes.*/

SELECT c.nome, c.renda_percapita
FROM cidade c
WHERE c.numero_habitantes > 5000;

/*2 Selecione todos os dados das cidades que foram fundadas depois de 12 março de 1432.  */

select c.*
from cidade c
where c.data_fundacao > '1432-01-01';

/*3 Selecione a cidade cujo cep é 38180000.  */

select c.*
from cidade c
where c.cep = 13087018;

/*4 Selecione o nome das cidades do estado de São Paulo.  */

select c.nome
from cidade c, estado e 
where c.uf = e.uf
and c.uf = 'SP';

/*5 Selecione todos os dados das cidades que ficam no estado de São Paulo e que possuam mais
do que 100 mil habitantes.  */

select c.*
from cidade c, estado e 
where c.uf = e.uf
and c.uf = 'SP'
and c.numero_habitantes > 100000; 

/*6 Selecione o nome das cidades que são capitais e tem mais do que 3000 de renda per capita.  */

select c.nome
from cidade c
where c.capital = 1
and c.renda_percapita > 3000;

/*7 Selecione o nome da cidade e o nome do estado cuja sigla é sp.  */

select c.nome, e.nome
from cidade c, estado e 
where c.uf = e.uf
and e.uf = 'SP';

/*8 Selecione a região, o nome do estado, o nome da cidade e a quantidade de habitantes das
cidades com renda per capita maior do que 20000 e que não são capitais.  */

select e.regiao, e.nome as estado, c.nome as cidade, c.numero_habitantes
from cidade c, estado e
where c.uf = e.uf
and c.renda_percapita > 2000
and capital = 0;

/*9 Selecione todos os dados das cidades que pertencem a região sudeste.  */

select c.*
from cidade c, estado e 
where c.uf = e.uf
and e.regiao = 'Sudeste';

/*10 Selecione o nome e a quantidade de habitantes das cidades da região sudeste que não sejam
capitais, que não sejam do estado cuja sigla é mg e que tenham a renda per capita maior do
que 1500.  */

select c.nome as cidade, c.numero_habitantes
from cidade c, estado e
where c.uf = e.uf
and e.regiao = 'Sudeste'
and e.uf <> 'MG'
and c.renda_percapita > 1500
and c.capital = 0;


