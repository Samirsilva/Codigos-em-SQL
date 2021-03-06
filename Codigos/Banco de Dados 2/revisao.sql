/*1 - QUAIS ATORES POSSUEM MAIS DE 5 FILME?*/

SELECT CONCAT(A.PRIMEIRO_NOME, " ", A.ULTIMO_NOME), COUNT(*)
FROM ATOR A JOIN FILME_ATOR FA
ON A.ATOR_ID = FA.ATOR_ID
GROUP BY A.ATOR_ID
HAVING COUNT(*) > 5;


/*QUAIS ATORES POSSUEM MAIS DE 5 FILMES DA CATEGORIA "ACTION" ? */

SELECT CONCAT(A.PRIMEIRO_NOME, " ", A.ULTIMO_NOME), COUNT(*)
FROM ATOR A JOIN FILME_ATOR FA JOIN FILME F JOIN FILME_CATEGORIA FC JOIN CATEGORIA C
ON A.ATOR_ID = FA.ATOR_ID
AND FA.FILME_ID = F.FILME_ID
AND F.FILME_ID = FC.FILME_ID
AND C.CATEGORIA_ID = FC.CATEGORIA_ID
WHERE C.NOME = "ACTION"
GROUP BY 1
HAVING COUNT(*) > 5;


/*QUAIS ATORES POSSUEM MAIS DE 5 FILMES COM MEDIA DO PRECO_DA_LOCACAO MAIOR QUE A MÉDIA DE TODOS OS FILMES?*/
SELECT CONCAT(A.PRIMEIRO_NOME, " ", A.ULTIMO_NOME), COUNT(*)
FROM ATOR A JOIN FILME_ATOR FA JOIN FILME F
ON A.ATOR_ID = FA.ATOR_ID
AND FA.FILME_ID = F.FILME_ID
WHERE F.PRECO_DA_LOCACAO > (SELECT AVG(PRECO_DA_LOCACAO) FROM FILME)
GROUP BY 1
HAVING COUNT(*) > 5;


/*QUAIS OS FILMES ALUGADOS POR CLIENTES DA ARGENTINA?*/



/*QUAL O VALOR TOTAL PAGO PELA LOCACAO DOS FILMES POR CLIENTE?*/
SELECT C.PRIMEIRO_NOME, SUM(VALOR)
FROM CLIENTE C JOIN ALUGUEL A JOIN PAGAMENTO P
ON C.cliente_id = A.cliente_id
AND A.aluguel_id = P.aluguel_id
GROUP BY 1;
