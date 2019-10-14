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
SELECT SUM(comissao) AS "Valor em Comissões"
FROM empregado;



/*  Ex. 6   */
SELECT COUNT(numemp) AS "Numero de Diretores"
FROM empregado
WHERE LOWER(funcao) LIKE 'director';



/*  Ex. 7   */
SELECT numdep AS "Número Departamento", COUNT(funcao) AS "Número Diretores"
FROM empregado
WHERE UPPER(funcao) LIKE 'DIRECTOR'
GROUP BY numdep;


/*  Ex. 8   */
SELECT COUNT(funcao) AS "NUMERO de Vendedores (30 e 20)"
FROM empregado
WHERE UPPER(funcao) LIKE 'VENDEDOR' AND (numdep = 30 OR numdep = 20);



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
WHERE UPPER(funcao) LIKE 'ESCRITURÁRIO' AND numdep = 20
UNION
SELECT 'Escrit. Dept 10: ' || SUM(salario) AS SALARIOS
FROM empregado
WHERE UPPER(funcao) LIKE 'ESCRITURÁRIO' AND numdep = 10;



/*  Ex. 18  */
SELECT MAX(e.salario) AS "MAX", MIN(e.salario) AS "MIN"
FROM empregado e JOIN escala_salarial s ON e.salario BETWEEN s.minsal AND s.maxsal
                 JOIN departamento d ON e.numdep = d.numdep
WHERE s.escala = 4 AND (UPPER(d.localizacao) LIKE 'LISBOA' OR UPPER(d.localizacao) LIKE 'SANTARÉM'); 



/*  Ex. 19  */
SELECT DISTINCT(funcao), ROUND(AVG(salario)) AS "Média Salarial", SUM(14*salario+NVL(comissao, 0)) AS "Volume Salarial Anual"
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
SELECT numemp AS "Número do Director", nomeemp AS "Nome do Director", ROUND(SUM(14*salario+NVL(comissao, 0))*0.85) AS "Remuneração Anual Liquida"
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
SELECT 'No departamento ' || numdep || ' desempenham a função ' || funcao || ' ' || COUNT(*) || ' funcionário(s)  e há um diferencial de ' || (MAX(salario)-MIN(salario)) || ' € (Maior ' || MAX(salario) || ' € e Menor ' || MIN(salario) || ' €)'
FROM empregado
GROUP BY numdep, funcao
ORDER BY 1;


/*  Ex. 28  */
SELECT TO_CHAR(dtacontratacao, 'YYYY') AS "Ano de Contratacao", COUNT(*) AS "Número de Emp. Contratados"
FROM empregado
GROUP BY TO_CHAR(dtacontratacao, 'YYYY')
ORDER BY 2 DESC;



/*  Ex. 29  */
SELECT funcao AS "Funcao Desempenhada", MIN(salario) AS "Menor Salario", MAX(salario) AS "Maior Salario", ROUND(AVG(salario)) AS "Salario Medio"
FROM empregado
GROUP BY funcao
ORDER BY 1 ASC;


/*  Ex. 30  */
SELECT MAX(salario)-MIN(salario) AS "Diferença Maior e Menor", MAX(salario) AS "O Maior Salario", MIN(salario) AS "O Menor Salario"
FROM empregado;



/*  Ex. 31  */
SELECT funcao AS "FUNCAO_NO_DEPARTAMENTO", numdep AS "NUMERO_DO_DEPARTAMENTO", MIN(salario) AS "MENOR_SALARIO", MAX(salario) AS "MAIOR_SALARIO", AVG(salario) AS "SALARIO_MEDIO", COUNT(*) AS "NUMERO_FUNCIONARIOS"
FROM empregado
GROUP BY funcao, numdep
ORDER BY 1 ASC, 2 ASC;



/*  Ex. 32  */
SELECT MAX(salario)
FROM empregado
WHERE TO_CHAR(dtacontratacao, 'YYYY') = 1981;


/*  Ex. 33  */
SELECT TO_CHAR(dtacontratacao, 'DD-MM-YYYY') AS "Data de Contratação", COUNT(*) AS "Número Contratados"
FROM empregado
GROUP BY TO_CHAR(dtacontratacao, 'DD-MM-YYYY')
HAVING COUNT(*) > 1;




/*  Ex. 34  */
SELECT funcao AS "Emprego", CASE
                                WHEN ROUND(AVG(salario)) < 1800 THEN 'Menor que 1800'
                                ELSE TO_CHAR(ROUND(AVG(salario)))
                            END AS "Média salarial" 
FROM empregado
GROUP BY funcao
ORDER BY 2 DESC;



/*  Ex. 35  */
SELECT numdep AS "Número de departamento", COUNT(*) AS "Numero de empregados", ROUND(AVG(salario)) AS "Salário Médio"
FROM empregado
WHERE TO_CHAR(dtacontratacao, 'MM-YYYY') NOT LIKE '02-1981'
GROUP BY numdep
HAVING AVG(salario) < 2200;



/*  Ex. 36  */
SELECT d.nomedep AS "Nome de Departamento", COUNT(e.numemp) AS "Numero de empregados", ROUND(AVG(e.salario)) AS "Salário Médio"
FROM empregado e JOIN departamento d ON e.numdep=d.numdep
WHERE TO_CHAR(dtacontratacao, 'MM-YYYY') NOT LIKE '02-1981'
GROUP BY d.nomedep
HAVING AVG(e.salario) < 2200;



/*  Ex. 37  */
SELECT d.localizacao, NVL(COUNT(*), 0) AS "NUMERO"
FROM empregado e LEFT JOIN departamento d ON (e.numdep=d.numdep)
WHERE LOWER(e.funcao) LIKE 'escriturário'
GROUP BY d.localizacao
ORDER BY 1;




/*  Ex. 38  */
SELECT s.escala, COUNT(*) AS "Nº funcionarios"
FROM empregado e JOIN escala_salarial s ON (e.salario BETWEEN s.minsal AND s.maxsal)
GROUP BY s.escala
HAVING COUNT(*) > 2
ORDER BY 1 ASC;



/*  Ex. 39  */
SELECT s.escala, ROUND(AVG(e.salario)) || '€' AS "Média", SUM(e.salario) || '€' AS "Total"
FROM empregado e JOIN escala_salarial s ON (e.salario BETWEEN s.minsal AND s.maxsal)
GROUP BY s.escala;



/*  Ex. 40  */
SELECT COUNT(*) AS "Status Locais"
FROM historico_funcao h JOIN empregado e ON (h.numemp = e.numemp)
WHERE UPPER(e.funcao) LIKE 'PRESIDENTE';



/*  Ex. 41  */
SELECT d.localizacao, e.funcao, MAX(e.salario)-MIN(e.salario) AS "Diferencial", COUNT(*) AS "Numero_Funcionarios"
FROM empregado e JOIN departamento d ON (e.numdep = d.numdep)
GROUP BY d.localizacao, e.funcao
HAVING COUNT(*) > 1;



/*  Ex. 42  */
SELECT funcao ,chefe, MAX(salario)
FROM empregado
WHERE lower(funcao) NOT LIKE 'analista' OR lower(funcao) NOT LIKE 'presidente'
GROUP BY funcao, chefe;



/*  Ex. 43  */
SELECT aux.chefe, MAX(aux.salario) AS "MAIOR_SALARIO_DE_CADA_CHEFE"
FROM empregado e JOIN empregado aux ON (aux.chefe = e.numemp)
WHERE lower(e.funcao) NOT LIKE 'analista' AND lower(e.funcao) NOT LIKE 'presidente'
GROUP BY aux.chefe
ORDER BY 2;



/*  Ex. 44  */
SELECT aux.chefe, ROUND(AVG(aux.salario)) AS "MAIOR_SALARIO_DE_CADA_CHEFE"
FROM empregado e JOIN empregado aux ON (aux.chefe = e.numemp)
WHERE lower(e.funcao) NOT LIKE 'analista' AND lower(e.funcao) NOT LIKE 'presidente'
GROUP BY aux.chefe
ORDER BY 2;

