/*   FICHA 4   */
@Z:\Base-Dados\2019\Praticas\Ficha04_grupos_e_funcoes_de_grupo\Scripts\ficha2.sql

/*  Ex. 1   */
SELECT count(e.chefe) AS "Numero de Empregados com Chefe"
FROM empregado e;



/*  Ex. 2   */
SELECT COUNT(DISTINCT e.chefe) AS "Numero de Chefes na Empresa"
FROM empregado e;



/*  Ex. 3   */
SELECT COUNT(e.comissao) AS "Numero Comissoes (>0)"
FROM empregado e
WHERE NVL(e.comissao,0) > 0;



/*  Ex. 4   */
SELECT COUNT(UNIQUE(numdep)) AS "Numero Dept. com Emp."
FROM empregado;



/*  Ex. 5   */
SELECT SUM(comissao) AS "Valor em Comiss�es"
FROM empregado;



/*  Ex. 6   */
SELECT COUNT(numemp) AS "Numero de Diretores"
FROM empregado
WHERE LOWER(funcao) LIKE 'director';



/*  Ex. 7   */



/*  Ex. 8   */
SELECT COUNT(funcao) AS "NUMERO de Vendedores (30 e 20)"
FROM empregado
WHERE UPPER(funcao) LIKE 'VENDEDOR' AND numdep = 30 AND numdep = 30;



/*  Ex. 9   */
SELECT numdep AS "Numero do Departamento", COUNT(*) AS "Numero de Empregados"
FROM empregado
GROUP BY numdep
ORDER BY NUMDEP DESC;



/*  Ex. 10   */
SELECT funcao, COUNT(*) AS "Quant. Empregados"
FROM empregado
GROUP BY funcao;


/*  Ex. 11   */
SELECT numemp, COUNT(*) AS "Numero_Ocorrencias"
FROM empregado
GROUP BY numemp;


/*  Ex. 12   */
SELECT DISTINCT(funcao), COUNT(comissao) AS "Numero de Comissoes"
FROM empregado
GROUP BY funcao
ORDER BY 2 DESC;


/*  Ex. 13   */
SELECT UNIQUE(numdep) AS "Numero do Departamento", COUNT(numdep) AS "Numero de Empregados"
FROM empregado
GROUP BY numdep
HAVING COUNT(numdep)>3;



/*  Ex. 14  */
SELECT chefe AS "Numero do Chefe", COUNT(*) AS "Numero de Empregados Chefiados"
FROM empregado
GROUP BY chefe
HAVING chefe IS NOT NULL
ORDER BY 2 DESC; 



/*  Ex. 15  */
SELECT chefe AS "Numero do Chefe", COUNT(*) AS "Numero de Empregados Chefiados", MAX(salario) AS "Maior Salario Chefiados", MIN(salario) AS "Menor Salario Chefiados", ROUND(AVG(salario)) AS "Salario Medio Chefiados"
FROM empregado
WHERE salario > 1000
GROUP BY chefe
HAVING chefe IS NOT NULL
ORDER BY 5 DESC;



/*  Ex. 16  */
SELECT d.localizacao, COUNT(e.numemp) AS "Funcionarios", SUM(e.salario) AS "Volume_Mensal_Salario"
FROM empregado e
JOIN departamento d ON (e.numdep = d.numdep)
GROUP BY d.localizacao;


/*  Ex. 17  */
SELECT 'Escrit. Dept 20: ' || SUM(salario) AS SALARIOS
FROM empregado
WHERE UPPER(funcao) LIKE 'ESCRITUR�RIO' AND numdep = 20
UNION
SELECT 'Escrit. Dept 10: ' || SUM(salario) AS SALARIOS
FROM empregado
WHERE UPPER(funcao) LIKE 'ESCRITUR�RIO' AND numdep = 10;



/*  Ex. 18  */
SELECT MAX(e.salario) AS "MAX", MIN(e.salario) AS "MIN"
FROM empregado e JOIN escala_salarial s ON e.salario BETWEEN s.minsal AND s.maxsal
                 JOIN departamento d ON e.numdep = d.numdep
WHERE s.escala = 4 AND (UPPER(d.localizacao) LIKE 'LISBOA' OR UPPER(d.localizacao) LIKE 'SANTAR�M'); 



/*  Ex. 19  */
SELECT DISTINCT(funcao), ROUND(AVG(salario)) AS "M�dia Salarial", SUM(14*salario+NVL(comissao, 0)) AS "Volume Salarial Anual"
FROM empregado
GROUP BY funcao
ORDER BY 1;



/*  Ex. 20  */
SELECT SUM(14*salario+NVL(comissao,0)) AS "Remuneracao Salarial Anual"
FROM empregado
WHERE LOWER(funcao) LIKE 'vendedor' AND comissao > 0
;



/*  Ex. 21  */
SELECT DISTINCT(funcao) AS "Funcao Desemprenhada (dept 30)", SUM(14*salario+NVL(comissao, 0))
FROM empregado
WHERE numdep = 30
GROUP BY funcao
ORDER BY 2 DESC;



/*  Ex. 22  */
SELECT numemp AS "N�mero do Director", nomeemp AS "Nome do Director", ROUND(SUM(14*salario+NVL(comissao, 0))*0.85) AS "Remunera��o Anual Liquida"
FROM empregado
WHERE UPPER(funcao) LIKE 'DIRECTOR'
GROUP BY numemp, nomeemp
ORDER BY 2;



/*  Ex. 23  */
SELECT numdep AS "Numero do Departamento", funcao AS "Funcao Desempenhada", MAX(salario) AS "Maior Salario", MIN(salario) AS "Menor Salario", TO_CHAR(AVG(salario), 'FM999,999,990.00') AS "Salario Medio"
FROM empregado
WHERE numdep = 20 OR numdep = 30
GROUP BY numdep, funcao
ORDER BY 1 DESC, 2 ASC;



/*  Ex. 24  */
SELECT numdep AS "Numero do Departamento", funcao AS "Funcao Desempenhada", MAX(salario) AS "Maior Salario", MIN(salario) AS "Menor Salario", TO_CHAR(AVG(salario), 'FM999,999,990.00') AS "Salario Medio"
FROM empregado
WHERE (numdep = 20 OR numdep = 30)
GROUP BY numdep, funcao
HAVING MAX(salario) > 1000
ORDER BY 1 DESC, 2 ASC;



/*  Ex. 25  */
SELECT numdep AS "Numero do Departamento", funcao AS "Funcao Desempenhada", MAX(salario) AS "Maior Salario", MIN(salario) AS "Menor Salario", TO_CHAR(AVG(salario), 'FM999,999,990.00') AS "Salario Medio"
FROM empregado
WHERE numdep = 20 OR numdep = 30
GROUP BY numdep, funcao
HAVING MAX(salario) = AVG(salario)
ORDER BY 1 DESC, 2 ASC;



/*  Ex. 26  */
SELECT numdep AS "Numero do Departamento", MAX(salario) AS "Maior Salario", MIN(salario) AS "Menor Salario", MAX(salario)- MIN(salario) AS "Diferencial de Salarios"
FROM empregado
GROUP BY numdep;



/*  Ex. 27  */





