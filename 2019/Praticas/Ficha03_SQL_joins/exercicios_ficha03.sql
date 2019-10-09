/*   FICHA 3   */
@Z:\Base-Dados\2019\Ficha03_SQL_joins\Scripts\ficha2.sql

/*  Ex. 1   */
SELECT e.nomeemp, e.numdep, d.nomedep, d.localizacao
FROM empregado e JOIN departamento d
                 ON e.numdep = d.numdep
ORDER BY e.nomeemp ASC;



/*  Ex. 2   */
SELECT e.nomeemp AS "NOME_EMP", e.salario, d.nomedep AS "NOME_DEP", d.localizacao
FROM empregado e JOIN departamento d
                  ON (e.numdep = d.numdep)
WHERE e.salario > 1500
ORDER BY e.nomeemp ASC;




/*  Ex. 3  */
SELECT e.nomeemp AS "NOME", h.funcao AS "FUNCAO", TO_CHAR(h.dtainicio, 'DD-Mon-YYYY') AS "DTAINICIO", TO_CHAR(h.dtafim, 'DD-MON-YYYY') AS "DTAFIM", d.nomedep AS "DEPARTAMENTO"
FROM empregado e JOIN historico_funcao h ON (e.numemp = h.numemp)
                 JOIN departamento d  ON (d.numdep = h.numdep)
ORDER BY e.nomeemp ASC, 4 DESC;
    



/*  Ex. 4  */
SELECT e.nomeemp, e.funcao, e.salario, s.escala
FROM empregado e JOIN escala_salarial s ON (e.salario BETWEEN s.minsal AND s.maxsal)
ORDER BY 3, 1;




/*  Ex. 5  */
SELECT e.nomeemp, s.escala
FROM empregado e JOIN escala_salarial s ON (e.salario BETWEEN s.minsal AND s.maxsal)
WHERE s.escala = 3;



/*  Ex. 6  */
SELECT e.nomeemp, e.funcao, e.salario, s.escala, d.nomedep
FROM empregado e JOIN escala_salarial s ON (e.salario BETWEEN s.minsal AND s.maxsal)
                JOIN departamento d ON (e.numdep = d.numdep)
ORDER BY e.salario DESC, e.nomeemp;



/*  Ex. 7  */
SELECT e.nomeemp, e.funcao, (e.salario)*14 AS "REMUNERACAO ANUAL", s.escala, d.nomedep
FROM empregado e JOIN escala_salarial s ON (e.salario BETWEEN s.minsal AND s.maxsal)
                JOIN departamento d ON (e.numdep = d.numdep)
WHERE (e.salario*14) >= 36000 OR LOWER(e.funcao) LIKE 'escriturário'
ORDER BY e.salario DESC, e.nomeemp;



/*  Ex. 8  */
SELECT e.numemp AS "NUMERO EMPREGADO", e.nomeemp AS "NOME EMPREGADO", e.chefe AS "NUMERO DO SEU CHEFE", aux.nomeemp AS "NOME CHEFE"
FROM empregado e JOIN empregado aux ON (e.chefe = aux.numemp)
ORDER BY 3 ASC;


/*  Ex. 9  */
SELECT e.numemp AS "NUM_FUNC", e.nomeemp AS "NOME_FUNC", TO_CHAR(e.dtacontratacao, 'YYYY.MM.DD') AS "DATA_FUNC", e.chefe AS "NUM_CHEFE", aux.nomeemp AS "NOME_CHEFE", TO_CHAR(aux.dtacontratacao, 'YYYY.MM.DD') AS "DATA_CHEFE"
FROM empregado e JOIN empregado aux ON (e.chefe = aux.numemp)
WHERE e.dtacontratacao < aux.dtacontratacao;



/*  Ex. 10  */
SELECT e.numemp AS "NUM_FUNC", e.nomeemp AS "NOME_FUNC", TO_CHAR(e.dtacontratacao, 'DD.MON.YYYY') AS "DATA_FUNC", e.chefe AS "NUM_CHEFE", aux.nomeemp AS "NOME_CHEFE", TO_CHAR(aux.dtacontratacao, 'DD-MON-YYYY') AS "DATA_CHEFE"
FROM empregado e LEFT JOIN empregado aux ON (e.chefe = aux.numemp)
WHERE e.dtacontratacao < aux.dtacontratacao OR e.chefe IS NULL
ORDER BY 2 ASC;



/*  Ex. 11  */      
SELECT NVL(e.nomeemp, ' ') AS "NOME", d.numdep AS "NUMERO", d.nomedep, d.localizacao
FROM empregado e RIGHT JOIN departamento d ON e.numdep = d.numdep
ORDER BY e.nomeemp ASC;            



/*  Ex. 12  */
SELECT e.nomeemp, TO_CHAR(e.dtacontratacao, 'YYYY'), aux.nomeemp, TO_CHAR(aux.dtacontratacao, 'YYYY')
FROM empregado e JOIN empregado aux ON (e.chefe = aux.numemp)
WHERE TO_CHAR(e.dtacontratacao, 'YYYY') = TO_CHAR(aux.dtacontratacao, 'YYYY')
ORDER BY 1;



/*  Ex. 13  */
SELECT UNIQUE(d.localizacao) AS "LOCAL_DIRETOR"
FROM departamento d JOIN empregado e ON (d.numdep = e.numdep)
ORDER BY 1 DESC;



/*  Ex. 14  */
SELECT d.numdep
FROM empregado e RIGHT JOIN departamento d ON (e.numdep=d.numdep)
WHERE e.numdep IS NULL;
-- OU
SELECT numdep
FROM departamento
MINUS
SELECT DISTINCT(numdep)
FROM empregado;



/*  Ex. 15  */
SELECT 'COM: chefe: ' || COUNT(e.chefe) AS "#empregado"
FROM empregado e
UNION
SELECT 'SEM: chefe: ' || COUNT(NVL(aux.chefe, 0)) AS "#empregado"
FROM empregado aux
WHERE NVL(aux.chefe, 0) = 0;



/*  Ex. 16  */
SELECT e2.numemp, e2.nomeemp
FROM empregado e1 JOIN empregado e2 ON (e1.chefe = e2.numemp)
WHERE e1.numdep = e2.numdep
INTERSECT
SELECT e2.numemp, e2.nomeemp
FROM empregado e1 JOIN empregado e2 ON (e1.chefe = e2.numemp)
WHERE e1.numdep <> e2.numdep;



/*  Ex. 17  */
SELECT '(' || e.numemp || ') ' || e.nomeemp || ' ganha ' || e.salario AS "SALARIO_EMP", NVL(TO_CHAR(aux.salario), '<Não Tem Chefe>') AS "SALARIO_CHEFE"
FROM empregado e LEFT JOIN empregado aux ON (e.chefe = aux.numemp)
WHERE e.salario > aux.salario OR e.chefe IS NULL;



/*  Ex. 18  */
SELECT h.funcao AS "Histórico de funcoes"
FROM historico_funcao h JOIN empregado e ON (e.numemp = h.numemp)
WHERE e.numdep = 30;



/*  Ex. 19  */
SELECT e.numemp, e.funcao, 'A exercer há ' || TRUNC(MONTHS_BETWEEN(SYSDATE, e.dtacontratacao)) || ' meses' AS "DURACAO", d.nomedep
FROM empregado e JOIN departamento d ON (e.numdep = d.numdep)
UNION
SELECT h.numemp, h.funcao, 'Exerceu durante ' || TRUNC(MONTHS_BETWEEN(h.dtafim, h.dtainicio)) || ' meses' AS "DURACAO", d.nomedep
FROM historico_funcao h JOIN departamento d ON (h.numdep = d.numdep)
ORDER BY 1 ASC;



/*  Ex. 20  */
SELECT e.nomeemp, h.funcao, h.numdep, e.funcao, e.numdep
FROM empregado e JOIN historico_funcao h ON (e.numemp = h.numemp)
WHERE e.funcao LIKE h.funcao AND e.numdep <> h.numdep;



/*  Ex. 21  */
SELECT e.numemp
FROM empregado e
MINUS
SELECT h.numemp
FROM historico_funcao h
ORDER BY 1 ASC;
