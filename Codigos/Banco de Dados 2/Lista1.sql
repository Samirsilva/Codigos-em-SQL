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
SELECT MAX(F.DURACAO_DA_LOCACAO) FROM FILME F;

/*20. Quantos filmes possuem a maior duração de locação?*/

/*21. Quantos filmes do idioma "JAPANESE" ou "GERMAN" possuem a maior duração de locação?*/

/*22. Qual a quantidade de filmes por classificação e preço da locação?*/

/*23. Qual o maior tempo de duração de filme por categoria?*/

/*24. Listar a quantidade de filmes por categoria.*/

/*25. Listar a quantidade de filmes classificados como "G" por categoria.*/

/*26. Listar a quantidade de filmes classificados como "G" OU "PG" por categoria.*/

/*27. Listar a quantidade de filmes por categoria e classificação.*/

/*28. Qual a quantidade de filmes por Ator ordenando decrescente por quantidade?*/

/*29. Qual a quantidade de filmes por ano de lançamento ordenando por quantidade crescente?*/

/*30. Listar os anos de lançamento que possuem mais de 400 filmes?*/

/*31. Listar os anos de lançamento dos filmes que possuem mais de 100 filmes com preço da locação maior que a média do preço da locação dos filmes da categoria "Children"?*/

/*32. Quais as cidades e seu pais correspondente que pertencem a um país que inicie com a Letra “E”?*/

/*31. Qual a quantidade de cidades por pais em ordem decrescente?*/

/*32. Qual a quantidade de cidades que iniciam com a Letra “A” por pais em ordem crescente?*/

/*33. Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A”?*/

/*34. Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A” ou tenha "R" ordenando por quantidade crescente?*/

/*35. Quais os clientes moram no país “United States”?*/

/*36. Quantos clientes moram no país “Brazil”?*/

/*37. Qual a quantidade de clientes por pais?*/

/*38. Quais países possuem mais de 10 clientes?*/

/*39. Qual a média de duração dos filmes por idioma?*/

/*40. Qual a quantidade de atores que atuaram nos filmes do idioma “English”?*/

/*41. Quais os atores do filme “BLANKET BEVERLY”?*/

/*42. Quais categorias possuem mais de 60 filmes cadastrados?*/

/*43. Quais os filmes alugados (sem repetição) para clientes que moram na “Argentina”?*/

/*44. Qual a quantidade de filmes alugados por Clientes que moram na “Chile”?*/

/*45. Qual a quantidade de filmes alugados por funcionario?*/

/*46. Qual a quantidade de filmes alugados por funcionario para cada categoria?*/

/*47. Quais Filmes possuem preço da Locação maior que a média de preço da locação?*/

/*48. Qual a soma da duração dos Filmes por categoria?*/

/*49. Qual a quantidade de filmes locados mês a mês por ano?*/

/*50. Qual o total pago por classificação de filmes alugados no ano de 2006?*/

/*51. Qual a média mensal do valor pago por filmes alugados no ano de 2005?*/

/*52. Qual o total pago por filme alugado no mês de Junho de 2006 por cliente?*/
