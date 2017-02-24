/*LISTA DE BANCO DE DADOS COM SAKILA TRADUZIDO PARA PORTUGUÊS*/



/*1. Quais os países cadastrados?*/
SELECT * FROM PAIS;


/*2. Quantos países estão cadastrados?*/
SELECT COUNT(*) 
FROM PAIS;


/*3. Quantos países que terminam com a letra "A" estão cadastrados?*/
SELECT COUNT(*) 
FROM PAIS 
WHERE PAIS LIKE '%A';


/*4. Listar, sem repetição, os anos que houveram lançamento de filme.*/
SELECT DISTINCT ANO_DE_LANCAMENTO 
FROM FILME;


/*5. Alterar o ano de lançamento igual 2007 para filmes que iniciem com a Letra "B".*/
UPDATE FILME 
SET ANO_DE_LANCAMENTO=2007 
WHERE TITULO 
LIKE 'B%';


/*6. Listar os filmes que possuem duração do filme maior que 100 e classificação igual a "G". */
SELECT TITULO 
FROM FILME 
WHERE DURACAO_DO_FILME > 100 
AND CLASSIFICACAO = 'G';


/*7. Alterar o ano de lançamento igual 2008 para filmes que possuem duração da locação menor que 4 e classificação igual a "PG". */
UPDATE FILME 
SET ANO_DE_LANCAMENTO=2008 
WHERE DURACAO_DA_LOCACAO < 4 
AND CLASSIFICACAO='PG';


/*8. Listar a quantidade de filmes que estejam classificados como "PG-13" e preço da locação maior que 2.40.*/
SELECT COUNT(*) 
FROM FILME 
WHERE CLASSIFICACAO = 'PG-13' 
AND PRECO_DA_LOCACAO > 2.40;


/*9. Quais os idiomas que possuem filmes cadastrados? */
SELECT NOME 
FROM IDIOMA I, FILME F 
WHERE I.IDIOMA_ID = F.IDIOMA_ID;


/*10. Alterar o idioma para "GERMAN" dos filmes que possuem preço da locação maior que 4.*/
UPDATE IDIOMA I, FILME F 
SET I.NOME='GERMAN' 
WHERE F.PRECO_DA_LOCACAO > 4;


/*11. Alterar o idioma para "JAPANESE" dos filmes que possuem preço da locação igual 0.99.*/
UPDATE IDIOMA I, FILME F 
SET I.NOME='JAPANESE'
WHERE F.PRECO_DA_LOCACAO = 0.99;


/*12. Listar a quantidade de filmes por classificação.*/
SELECT COUNT(*), CLASSIFICACAO 
FROM FILME 
GROUP BY CLASSIFICACAO; 


/*13. Listar, sem repetição, os preços de locação dos filmes cadastrados.*/
SELECT DISTINCT PRECO_DA_LOCACAO
FROM FILME;


/*14. Listar a quantidade de filmes por preço da locação.*/
SELECT COUNT(TITULO), PRECO_DA_LOCACAO 
FROM FILME
GROUP BY PRECO_DA_LOCACAO;


/*15. Listar os precos da locação que possuam mais de 340 filmes.*/
SELECT PRECO_DA_LOCACAO, COUNT(TITULO)
FROM FILME 
GROUP BY PRECO_DA_LOCACAO
HAVING COUNT(TITULO) > 340; 


/*16. Listar a quantidade de atores por filme ordenando por quantidade de atores crescente.*/
SELECT COUNT(A.ATOR_ID), F.TITULO 
FROM ATOR A, FILME F, FILME_ATOR FA
WHERE A.ATOR_ID = FA.ATOR_ID
AND F.FILME_ID = FA.FILME_ID
GROUP BY TITULO
ORDER BY 1 ASC;

/*17. Listar a quantidade de atores para os filmes que possuem mais de 5 atores ordenando por quantidade de atores decrescente.*/
SELECT COUNT(A.ATOR_ID), F.TITULO
FROM ATOR A, FILME_ATOR FA, FILME F
WHERE A.ATOR_ID = FA.ATOR_ID
AND F.FILME_ID =  FA.FILME_ID
GROUP BY TITULO
HAVING COUNT(A.ATOR_ID) > 5
ORDER BY 1 ASC;

/*18. Listar o título e a quantidade de atores para os filmes que possuem o idioma "ENGLISH" e mais de 10 atores ordenando por ordem alfabética de título e ordem crescente de quantidade de atores.*/
SELECT F.TITULO, COUNT(A.ATOR_ID)
FROM FILME F, ATOR A, FILME_ATOR FA, IDIOMA I
WHERE I.IDIOMA_ID = F.IDIOMA_ID
AND F.FILME_ID = FA.FILME_ID
AND A.ATOR_ID = FA.ATOR_ID
AND I.NOME ='JAPANESE'
GROUP BY F.TITULO
HAVING COUNT(A.ATOR_ID) > 10
ORDER BY F.TITULO ASC;

/*19. Qual a maior duração da locação dentre os filmes?*/
SELECT MAX(F.DURACAO_DA_LOCACAO) 
FROM FILME F;

/*20. Quantos filmes possuem a maior duração de locação?*/
SELECT TITULO 
FROM FILME 
WHERE DURACAO_DA_LOCACAO=(SELECT MAX(F.DURACAO_DA_LOCACAO) FROM FILME F);

/*21. Quantos filmes do idioma "JAPANESE" ou "GERMAN" possuem a maior duração de locação?*/
SELECT count(F.TITULO)
FROM FILME F, IDIOMA I
WHERE F.DURACAO_DA_LOCACAO=(SELECT MAX(F.DURACAO_DA_LOCACAO) FROM FILME F)
AND F.IDIOMA_ID = I.IDIOMA_ID
AND  I.NOME = 'JAPANESE' OR I.NOME='GERMAN'; 

/*22. Qual a quantidade de filmes por classificação e preço da locação?*/
SELECT COUNT(TITULO), CLASSIFICACAO, PRECO_DA_LOCACAO 
FROM FILME
GROUP BY CLASSIFICACAO, PRECO_DA_LOCACAO;

/*23. Qual o maior tempo de duração de filme por categoria?*/
SELECT MAX(F.DURACAO_DO_FILME), C.NOME 
FROM FILME F, FILME_CATEGORIA FA, CATEGORIA C
WHERE F.FILME_ID = FA.FILME_ID
AND C.CATEGORIA_ID = FA.CATEGORIA_ID
GROUP BY C.CATEGORIA_ID;

/*24. Listar a quantidade de filmes por categoria.*/
SELECT COUNT(F.TITULO), C.NOME
FROM FILME F, FILME_CATEGORIA FA, CATEGORIA C
WHERE F.FILME_ID = FA.FILME_ID
AND C.CATEGORIA_ID = FA.CATEGORIA_ID
GROUP BY C.CATEGORIA_ID;

/*25. Listar a quantidade de filmes classificados como "G" por categoria.*/
SELECT COUNT(F.TITULO), C.NOME
FROM FILME F, FILME_CATEGORIA FA, CATEGORIA C
WHERE F.FILME_ID = FA.FILME_ID
AND C.CATEGORIA_ID = FA.CATEGORIA_ID
AND F.CLASSIFICACAO ='G'
GROUP BY C.CATEGORIA_ID;

/*26. Listar a quantidade de filmes classificados como "G" OU "PG" por categoria.*/
SELECT COUNT(F.TITULO), C.NOME
FROM FILME F, FILME_CATEGORIA FC,CATEGORIA C
WHERE F.FILME_ID = FC.FILME_ID
AND C.CATEGORIA_ID = FC.CATEGORIA_ID
AND F.CLASSIFICACAO ='G' OR 'PG'
GROUP BY C.CATEGORIA_ID;

/*27. Listar a quantidade de filmes por categoria e classificação.*/
SELECT COUNT(F.TITULO), C.NOME, F.CLASSIFICACAO
FROM FILME F, FILME_CATEGORIA FC, CATEGORIA C
WHERE F.FILME_ID = FC.FILME_ID
AND C.CATEGORIA_ID = FC.CATEGORIA_ID
GROUP BY C.CATEGORIA_ID, F.CLASSIFICACAO; 

/*28. Qual a quantidade de filmes por Ator ordenando decrescente por quantidade?*/
SELECT COUNT(F.TITULO), A.PRIMEIRO_NOME, A.ULTIMO_NOME
FROM FILME F, FILME_ATOR FA, ATOR A
WHERE F.FILME_ID = FA.FILME_ID
AND A.ATOR_ID = FA.ATOR_ID
GROUP BY A.ATOR_ID
ORDER BY 1 DESC;

/*29. Qual a quantidade de filmes por ano de lançamento ordenando por quantidade crescente?*/
SELECT COUNT(F.TITULO), F.ANO_DE_LANCAMENTO
FROM FILME F
GROUP BY F.ANO_DE_LANCAMENTO
ORDER BY 1 ASC;

/*30. Listar os anos de lançamento que possuem mais de 400 filmes?*/
SELECT ANO_DE_LANCAMENTO, COUNT(TITULO)
FROM FILME
GROUP BY ANO_DE_LANCAMENTO
HAVING COUNT(FILME_ID) >400;

/*31. Listar os anos de lançamento dos filmes que possuem mais de 100 filmes com preço da locação maior que a média do preço da locação dos filmes da categoria "Children"?*/
SELECT F.ANO_DE_LANCAMENTO, COUNT(F.TITULO)
FROM FILME F, FILME_CATEGORIA FC, CATEGORIA C
WHERE F.FILME_ID = FC.FILME_ID
AND C.CATEGORIA_ID = FC.CATEGORIA_ID
AND F.PRECO_DA_LOCACAO > (SELECT AVG(F.PRECO_DA_LOCACAO) FROM FILME F, FILME_CATEGORIA FC, CATEGORIA C WHERE F.FILME_ID = FC.FILME_ID AND C.CATEGORIA_ID = FC.CATEGORIA_ID AND C.NOME='CHILDREN')
GROUP BY F.ANO_DE_LANCAMENTO
HAVING COUNT(F.FILME_ID) > 100;

/*32. Quais as cidades e seu pais correspondente que pertencem a um país que inicie com a Letra “E”?*/
SELECT C.CIDADE, P.PAIS 
FROM PAIS P, CIDADE C
WHERE P.PAIS_ID = C.PAIS_ID
AND P.PAIS LIKE 'E%';

/*33. Qual a quantidade de cidades por pais em ordem decrescente?*/
SELECT COUNT(C.CIDADE), P.PAIS
FROM PAIS P, CIDADE C
WHERE P.PAIS_ID = C.PAIS_ID
GROUP BY P.PAIS
ORDER BY 1 DESC;

/*34. Qual a quantidade de cidades que iniciam com a Letra “A” por pais em ordem crescente?*/
SELECT COUNT(C.CIDADE), P.PAIS
FROM PAIS P, CIDADE C
WHERE P.PAIS_ID = C.PAIS_ID
AND C.CIDADE LIKE 'A%'
GROUP BY P.PAIS
ORDER BY P.PAIS ASC;

/*35. Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A”?*/
SELECT P.PAIS, COUNT(C.CIDADE)
FROM PAIS P, CIDADE C
WHERE P.PAIS_ID = C.PAIS_ID
AND C.CIDADE LIKE 'A%'
GROUP BY P.PAIS
HAVING COUNT(C.CIDADE) >3;

/*36. Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A” ou tenha "R" ordenando por quantidade crescente?*/
SELECT P.PAIS, COUNT(C.CIDADE)
FROM PAIS P, CIDADE C
WHERE P.PAIS_ID = C.PAIS_ID
AND C.CIDADE LIKE 'A%' OR '%R%'
GROUP BY P.PAIS
HAVING COUNT(C.CIDADE) >3
ORDER BY 1 ASC;

/*37. Quais os clientes moram no país “United States”?*/
SELECT C.PRIMEIRO_NOME
FROM CLIENTE C, PAIS P, CIDADE CI, ENDERECO E
WHERE P.PAIS_ID = CI.PAIS_ID
AND CI.CIDADE_ID = E.CIDADE_ID
AND E.ENDERECO_ID = C.ENDERECO_ID
AND P.PAIS = 'UNITED STATES';

/*38. Quantos clientes moram no país “Brazil”?*/
SELECT COUNT(C.CLIENTE_ID)
FROM CLIENTE C, PAIS P, CIDADE CI, ENDERECO E
WHERE C.ENDERECO_ID = E.ENDERECO_ID
AND E.CIDADE_ID = CI.CIDADE_ID
AND CI.PAIS_ID = P.PAIS_ID
AND P.PAIS ='BRAZIL';

/*39. Qual a quantidade de clientes por pais?*/
SELECT COUNT(C.CLIENTE_ID), P.PAIS
FROM CLIENTE C, PAIS P, CIDADE CI, ENDERECO E
WHERE C.ENDERECO_ID = E.ENDERECO_ID
AND E.CIDADE_ID = CI.CIDADE_ID
AND CI.PAIS_ID = P.PAIS_ID
GROUP BY P.PAIS;

/*40. Quais países possuem mais de 10 clientes?*/
SELECT P.PAIS, COUNT(C.CLIENTE_ID)
FROM CLIENTE C, PAIS P, CIDADE CI, ENDERECO E
WHERE C.ENDERECO_ID = E.ENDERECO_ID
AND E.CIDADE_ID = CI.CIDADE_ID
AND CI.PAIS_ID = P.PAIS_ID
GROUP BY P.PAIS
HAVING COUNT(C.CLIENTE_ID) > 10;

/*41. Qual a média de duração dos filmes por idioma?*/
SELECT I.NOME, AVG(F.DURACAO_DO_FILME)
FROM FILME F, IDIOMA I
WHERE F.IDIOMA_ID = I.IDIOMA_ID
GROUP BY I.NOME;

/*42. Qual a quantidade de atores que atuaram nos filmes do idioma “English”?*/
SELECT COUNT(A.ATOR_ID), F.TITULO
FROM ATOR A, FILME F, FILME_ATOR FA, IDIOMA I
WHERE I.IDIOMA_ID = F.IDIOMA_ID
AND F.FILME_ID = FA.FILME_ID
AND A.ATOR_ID = FA.ATOR_ID
AND I.NOME ='JAPANESE'
GROUP BY F.TITULO;

/*43. Quais os atores do filme “BLANKET BEVERLY”?*/
SELECT A.PRIMEIRO_NOME, A.ULTIMO_NOME
FROM FILME F, FILME_ATOR FA, ATOR A
WHERE F.FILME_ID = FA.FILME_ID
AND A.ATOR_ID = FA.ATOR_ID
AND F.TITULO ='BLANKET BEVERLY';

/*44. Quais categorias possuem mais de 60 filmes cadastrados?*/
SELECT C.NOME, COUNT(F.FILME_ID)
FROM CATEGORIA C, FILME F, FILME_CATEGORIA FC
WHERE C.CATEGORIA_ID = FC.CATEGORIA_ID
AND F.FILME_ID = FC.FILME_ID
GROUP BY C.CATEGORIA_ID
HAVING COUNT(F.FILME_ID) >60;

/*45. Quais os filmes alugados (sem repetição) para clientes que moram na “Argentina”?*/
SELECT DISTINCT F.TITULO, C.PRIMEIRO_NOME
FROM FILME F, INVENTARIO I, ALUGUEL A, CLIENTE C, ENDERECO E, CIDADE CI, PAIS P
WHERE F.FILME_ID = I.FILME_ID
AND I.INVENTARIO_ID = A.INVENTARIO_ID
AND A.CLIENTE_ID = C.CLIENTE_ID
AND C.ENDERECO_ID = CI.CIDADE_ID
AND CI.PAIS_ID = P.PAIS_ID
AND P.PAIS='ARGENTINA';

/*46. Qual a quantidade de filmes alugados por Clientes que moram na “Chile”?*/
SELECT COUNT(F.TITULO), P.PAIS
FROM FILME F, INVENTARIO I, ALUGUEL A, CLIENTE C, ENDERECO E, CIDADE CI, PAIS P
WHERE F.FILME_ID = I.FILME_ID
AND I.INVENTARIO_ID = A.INVENTARIO_ID
AND A.CLIENTE_ID = C.CLIENTE_ID
AND C.ENDERECO_ID = CI.CIDADE_ID
AND CI.PAIS_ID = P.PAIS_ID
AND P.PAIS='CHILE';

/*47. Qual a quantidade de filmes alugados por funcionario?*/
SELECT COUNT(F.TITULO)
FROM FILME F, INVENTARIO I, ALUGUEL A, FUNCIONARIO FUN
WHERE F.FILME_ID = I.FILME_ID
AND I.INVENTARIO_ID = A.INVENTARIO_ID
AND A.FUNCIONARIO_ID = FUN.FUNCIONARIO_ID;

/*48. Qual a quantidade de filmes alugados por funcionario para cada categoria?*/
SELECT COUNT(F.TITULO), C.NOME
FROM FILME F, INVENTARIO I, ALUGUEL A, FUNCIONARIO FUN, CATEGORIA C, FILME_CATEGORIA FC
WHERE F.FILME_ID = I.FILME_ID
AND I.INVENTARIO_ID = A.INVENTARIO_ID
AND A.FUNCIONARIO_ID = FUN.FUNCIONARIO_ID
AND C.CATEGORIA_ID = FC.CATEGORIA_ID
AND F.FILME_ID = FC.FILME_ID
GROUP BY C.CATEGORIA_ID;

/*49. Quais Filmes possuem preço da Locação maior que a média de preço da locação?*/
SELECT TITULO, PRECO_DA_LOCACAO 
FROM FILME
WHERE PRECO_DA_LOCACAO > (SELECT AVG(PRECO_DA_LOCACAO) FROM FILME);

/*50. Qual a soma da duração dos Filmes por categoria?*/
SELECT SUM(F.DURACAO_DO_FILME), C.NOME
FROM FILME F, FILME_CATEGORIA FC, CATEGORIA C
WHERE F.FILME_ID = FC.FILME_ID
AND C.CATEGORIA_ID = FC.CATEGORIA_ID
GROUP BY C.CATEGORIA_ID;

/*51. Qual a quantidade de filmes locados mês a mês por ano?*/

/*52. Qual o total pago por classificação de filmes alugados no ano de 2006?*/

/*53. Qual a média mensal do valor pago por filmes alugados no ano de 2005?*/

/*54. Qual o total pago por filme alugado no mês de Junho de 2006 por cliente?*/
