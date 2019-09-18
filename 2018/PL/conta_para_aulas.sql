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


-- 6
SELECT e.nomeemp, e.funcao, e.salario, s.escala, d.nomedep
FROM empregado e JOIN departamento d ON (e.numdep = d.numdep)
                 JOIN escala_salarial s ON (e.salario >= s.minsal AND e.salario >= s.maxsal)
WHERE e.funcao <> 'Analista'
ORDER BY e.salario DESC;


-- 8 
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


-- 19
SELECT e.numemp, e.funcao, 'A exercer há ' || TRUNC(MONTHS_BETWEEN(SYSDATE, e.dtacontratacao)) ||  ' meses' AS "DURACAO", d.nomedep
FROM empregado e
INNER JOIN departamento d ON (d.numdep = e.numdep)
UNION
SELECT h.numemp, h.funcao, 'Exerceu durante ' || TRUNC(MONTHS_BETWEEN(h.dtafim, h.dtainicio)) || ' meses' AS "DURACAO", x.nomedep
FROM historico_funcao h
INNER JOIN departamento x ON (x.numdep = h.numdep)
ORDER BY 1;
