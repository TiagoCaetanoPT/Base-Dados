@ C:\aulas\Ficha2_scripts\ficha2.sql



-- ###################################################
--                  FICHA 2
-- ###################################################
/* ORDENAR ORDER BY ASC|DESC*/
-- 1
SELECT table_name 
FROM user_tables
ORDER BY table_name ASC;

-- 2 .a
SELECT *
FROM departamento
ORDER BY numdep;

-- 2 .b
SELECT * 
FROM empregado
ORDER BY numemp;

-- 2 .c
SELECT *
FROM escala_salarial
ORDER BY escala;

-- 2 .d
SELECT *
FROM historico_funcao
ORDER BY idhist;

-- 3
SELECT DISTINCT funcao
FROM empregado
ORDER BY funcao ASC;

-- 5
/* SUBSTITUIR VALOR DE COLUNAS NVL(to_char(comissao),'Não Tem') */
/* AS, altera nome coluna */
SELECT nomeemp, salario, NVL(to_char(comissao),'Não Tem') AS "COMISSÃO"
FROM empregado
ORDER BY salario DESC, nomeemp ASC;

-- 8
SELECT  'O ' || UPPER(nomeemp) || ' ganha ' || salario || ' mas queria ganhar ' || 3*salario AS "SALÁRIOS"
FROM empregado;

-- 9
SELECT nomeemp, salario, comissao
FROM empregado
WHERE NVL(comissao,0) > salario;

-- 15
SELECT nomeemp
FROM empregado
WHERE LOWER(nomeemp) LIKE '%o%'
ORDER BY nomeemp;

-- 17
SELECT nomeemp
FROM empregado
WHERE LOWER(nomeemp)NOT LIKE '%o%';

-- 20
SELECT nomeemp,salario
FROM empregado
WHERE comissao IS NULL 
AND salario > 3000;

-- 22
SELECT nomeemp,TO_CHAR(dtacontratacao, 'DD-MM-YYYY') AS "Data de Contratação", ADD_MONTHS(dtacontratacao,12) AS "Data Revisão"
FROM empregado
ORDER BY nomeemp ASC;

-- 24
SELECT nomeemp AS "EMPREGADO",  salario * 14 + NVL(comissao, 0) AS "REMUNERACAO ANUAL"
FROM empregado
ORDER BY nomeemp ASC;

-- 25
SELECT nomeemp,
CASE
  WHEN salario < 1500 THEN 'Menor que 1500' 
  WHEN salario = 1500 THEN 'Valor Exato' 
  ELSE to_char(salario)
END
AS "SAL"
FROM empregado
ORDER BY nomeemp ASC;


SELECT NOMEEMP, DECODE(SIGN(1500-SALARIO), 1, 'Menor que 1500',
                                           0, 'Valor Exato',
                                           TO_CHAR(SALARIO)) AS SAL
FROM EMPREGADO
ORDER BY NOMEEMP;




-- ###################################################
--                  FICHA 3
-- ###################################################
-- 1
SELECT e.nomeemp, e.numdep, d.numdep, d.nomedep, d.localizacao
FROM empregado e JOIN  departamento d
                 ON e.numdep = d.numdep
ORDER BY e.nomeemp ASC;

-- 2
SELECT e.nomeemp, e.salario, d.numdep, d.nomedep, d.localizacao
FROM empregado e JOIN departamento d
ON e.numdep = d.numdep
WHERE e.salario > 1500
ORDER BY e.nomeemp  ASC;

-- 3
SELECT e.nomeemp AS "NOME", h.funcao, TO_CHAR(h.dtainicio, 'DD-Mon-YYYY') AS "DATA INICIO", TO_CHAR(h.dtafim, 'DD-MON-YYYY') AS "DATA FIM", d.nomedep AS "DEPARTAMENTO"
FROM empregado e JOIN historico_funcao h ON (e.numemp = h.numemp)
                 JOIN departamento d ON (h.numdep = d.numdep)
ORDER BY e.nomeemp ASC, h.dtafim DESC;


--4 
SELECT t1.nomeemp, t1.funcao, t1.salario,t2.escala
FROM empregado t1
INNER JOIN escala_salarial t2 ON (t1.salario > t2.minsal AND t1.salario < t2.maxsal)
ORDER BY 3, 1;

-- 5
SELECT t1.nomeemp, t2.escala
FROM escala_salarial t2 JOIN empregado t1 ON (t1.salario BETWEEN 1400 AND 2001) AND t2.escala = 3;

-- 6
SELECT e.nomeemp, e.funcao, e.salario, s.escala, d.nomedep
FROM empregado e JOIN departamento d ON (e.numdep = d.numdep)
                 JOIN escala_salarial s ON (e.salario >= s.minsal AND e.salario >= s.maxsal)
WHERE e.funcao <> 'Analista'
ORDER BY e.salario DESC;

-- 7
SELECT t1.nomeemp, t1.funcao, t1.salario*12 AS "REMUNERACAO ANUAL"--, t2.escala
FROM empregado t1 
WHERE t1.salario*12 > 36000
;
                                                
                                            

-- 8 ********** REVER
SELECT e.numemp, e.nomeemp, h.chefe, h.nomeemp AS "NOME CHEFE"
FROM empregado e JOIN empregado h ON (e.chefe = h.numemp)
ORDER BY h.chefe DESC;
            
            
-- 11
SELECT e.nomeemp, d.numdep, d.nomedep, d.localizacao
FROM empregado e RIGHT JOIN  departamento d
                 ON e.numdep = d.numdep
ORDER BY e.nomeemp ASC;

            
-- 14
SELECT d.numdep
FROM departamento d
MINUS
SELECT e.numdep
FROM empregado e;


-- 16
SELECT e.numemp, e.nomeemp
FROM empregado e
WHERE e.numemp = e.chefe OR e.chefe IS NULL;


-- 17
SELECT '(' || e.numemp || ')' || e.nomeemp || ' ganha ' || e.salario AS "SALARIO_EMP", e2.salario AS "SALARIO_CHEFE" 
FROM empregado e JOIN empregado e2 ON e.chefe = e2.numemp
WHERE e.salario > e2.salario;
  
  --  UNION




-- 19
SELECT e.numemp, e.funcao, 'A exercer há ' || TRUNC(MONTHS_BETWEEN(SYSDATE, e.dtacontratacao)) ||  ' meses' AS "DURACAO", d.nomedep
FROM empregado e
INNER JOIN departamento d ON (d.numdep = e.numdep)
UNION
SELECT h.numemp, h.funcao, 'Exerceu durante ' || TRUNC(MONTHS_BETWEEN(h.dtafim, h.dtainicio)) || ' meses' AS "DURACAO", x.nomedep
FROM historico_funcao h
INNER JOIN departamento x ON (x.numdep = h.numdep)
ORDER BY 1;


-- ###################################################
--                  FICHA 4
-- ###################################################

-- 1
SELECT COUNT(chefe) AS "Numero de Empregados com Chefe"
FROM empregado;


--2
SELECT COUNT(distinct chefe) AS "Numero Chefes na Empresa"
FROM empregado;


-- 3
SELECT SUM(COUNT(*)) AS "Numero Comissões (>0)"
FROM empregado
GROUP BY comissao
HAVING comissao > 0;


-- 4
SELECT count(distinct(e.numdep)) AS "Número de Dept. com Emp."
FROM empregado e;


-- 5
SELECT SUM(comissao)
FROM empregado;


-- 6
SELECT COUNT(numemp) AS "Número de Directores"
FROM empregado
WHERE UPPER(funcao) = 'DIRECTOR';


--7
SELECT COUNT(funcao) AS "Numer de Diretores"
FROM empregado
WHERE UPPER(funcao) LIKE 'DIRECTOR';

-- 8
SELECT COUNT(funcao) AS "NUMERO de Vendedores (30 e 20)"
FROM empregado
WHERE UPPER(funcao) LIKE 'VENDEDOR' AND numdep = 30 AND numdep = 30;


-- 9
SELECT numdep AS "Numero do Departamento", COUNT(*) AS "Numero de Empregados"
FROM empregado
GROUP BY numdep
ORDER BY NUMDEP DESC;


-- 10
SELECT funcao, COUNT(*) AS "Quant. empregados"
FROM empregado
GROUP BY funcao
ORDER BY COUNT(*);


-- 11
SELECT distinct(numemp) AS "Numero de Empregado", numemp AS "Numero de Empregados"
FROM empregado;


--12
SELECT funcao, NVL(comissao,0) AS "Número de Comissões"
FROM empregado
GROUP BY funcao, comissao
ORDER BY comissao;


-- 13
SELECT numdep, COUNT(numemp)
FROM empregado
GROUP BY numdep
HAVING COUNT(numemp) > 3
ORDER BY 2 DESC;


-- 16
SELECT d.localizacao, COUNT(e.numemp), SUM(e.salario)
FROM empregado e
JOIN departamento d ON (e.numdep = d.numdep)
GROUP BY d.localizacao;


-- 18
SELECT MAX(SALARIO) "MAX", MIN(SALARIO) "MIN"
FROM EMPREGADO E JOIN ESCALA_SALARIAL S ON E.SALARIO BETWEEN MINSAL AND MAXSAL
                 JOIN DEPARTAMENTO D ON E.NUMDEP = D.NUMDEP
WHERE ESCALA LIKE 4 AND (UPPER(LOCALIZACAO) LIKE 'LISBOA' OR UPPER(LOCALIZACAO) LIKE 'SANTARÉM'); 


-- 19 TPC
SELECT DISTINCT FUNCAO, ROUND(AVG(SALARIO)), SUM(SALARIO * 14 + NVL(COMISSAO,0)) AS "Volume Salarial Anual"
FROM EMPREGADO
GROUP BY FUNCAO
ORDER BY FUNCAO;


-- 23
SELECT NUMDEP, FUNCAO, MAX(SALARIO), MIN(SALARIO), AVG(SALARIO) "SALARIO MÉDIO"
FROM EMPREGADO
WHERE NUMDEP = 20 OR NUMDEP = 30
GROUP BY FUNCAO, NUMDEP
ORDER BY NUMDEP DESC;


-- 24
SELECT NUMDEP, FUNCAO, MAX(SALARIO), MIN(SALARIO), TO_CHAR(AVG(SALARIO), '99,999') "SALARIO MÉDIO"
FROM EMPREGADO
WHERE NUMDEP = 20 OR NUMDEP = 30
GROUP BY FUNCAO, NUMDEP
HAVING MAX(SALARIO) > 1000
ORDER BY NUMDEP DESC;


-- 36
SELECT d.nomedep AS "Nome de Departamento", COUNT(e.numdep) AS "Número de empregados", ROUND(AVG(e.salario))
FROM empregado e JOIN departamento d ON (e.numdep = d.numdep)
WHERE TO_CHAR(e.DTACONTRATACAO, 'MM-RRRR') NOT LIKE  '02-1981'
GROUP BY d.nomedep
  HAVING (AVG(e.salario) < 2200) AND (COUNT(e.numdep) > 1);


-- 17 
SELECT 'Escrit. Dept 10:' || SUM(SALARIO) || '€' AS "SALARIOS"
FROM empregado
WHERE FUNCAO = 'Escriturário' AND numdep =10
  UNION
SELECT 'Escrit. Dept 20:' || SUM(SALARIO) || '€' AS "SALARIOS"
FROM empregado
WHERE FUNCAO = 'Escriturário' AND numdep = 20;



-- ###################################################
--                    FICHA 5
-- ###################################################

-- 1
SELECT nomeemp, numdep, salario
FROM empregado
WHERE salario > (SELECT AVG(salario)
                 FROM empregado);


-- 2
SELECT nomedep
FROM departamento
WHERE numdep = (SELECT numdep
                FROM empregado
                WHERE salario = (SELECT MIN(salario)
                                FROM empregado));


SELECT d.nomedep
FROM departamento d JOIN empregado e ON (d.numdep = e.numdep)
WHERE salario = (SELECT MIN(salario)
                  FROM empregado);



-- 3
SELECT nomedep
FROM departamento
WHERE numdep IN (SELECT numdep
FROM empregado
GROUP BY numdep
  HAVING (AVG(salario) < (SELECT AVG(salario)
                          FROM empregado)));

SELECT numdep
FROM empregado
GROUP BY numdep
  HAVING (AVG(salario) < (SELECT AVG(salario)
                          FROM empregado));


SELECT numdep, AVG(salario)
FROM empregado
GROUP BY numdep
  HAVING (AVG(salario) < 1800);


SELECT numdep, AVG(salario)
FROM empregado
GROUP BY numdep;


-- 4
SELECT nomedep
FROM departamento 
WHERE numdep NOT IN (SELECT DISTINCT(numdep)
                      FROM empregado);
                      
            -- OU
            
SELECT nomedep
FROM  departamento d
WHERE NOT EXISTS (SELECT *
                  FROM empregado
                  WHERE numdep = d.numdep);
            

                      
-- 5
SELECT COUNT(chefe) "Numero de Chefes"
FROM (SELECT DISTINCT(chefe)
      FROM empregado);

SELECT COUNT(distinct(chefe)) as "Numero de Chefes"
FROM empregado;


-- 7
SELECT COUNT(*) AS "Dpt. com mais de 3 Emp."
FROM( SELECT numdep
      FROM empregado
      GROUP BY numdep
        HAVING (COUNT(numdep) > 3));


-- 8
SELECT nomeemp , numdep, salario
FROM empregado e
WHERE salario > (SELECT AVG(salario)
                  FROM empregado
                  WHERE numdep = e.numdep)
ORDER BY salario DESC, nomeemp;
                  
            -- OU
        
SELECT e.nomeemp, e.numdep, e.salario
FROM empregado e JOIN (SELECT AVG(salario) AS "DEP SAL", numdep
                        FROM empregado
                        GROUP BY numdep) d
                  ON (d.numdep = e.numdep)
WHERE e.salario > d."DEP SAL"
ORDER BY e.salario DESC, e.nomeemp;


-- 10
SELECT numdep AS "Departamento", SUM(12*salario) AS "Encargo anual"
FROM empregado
GROUP BY numdep
  HAVING SUM(12*salario) = (SELECT MAX("valor")
                            FROM (SELECT SUM(12*salario) AS "valor"
                                  FROM empregado
                                  GROUP BY numdep));

-- 11

-- 14

-- 15

-- 16

-- 21

SELECT salario
FROM (SELECT salario
      FROM empregado
      ORDER BY salario)
WHERE ROWNUM <= 3;


-- 26

-- 28


-- ###################################################
--                    FICHA 6
-- ###################################################



-- 8

