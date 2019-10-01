/*   FICHA 3   */
@Z:\Base-Dados\2019\Ficha03_SQL_joins\Scripts\ficha2.sql;

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
ORDER BY 1 ASC, 4 DESC;
    



/*  Ex. 4  */
SELECT e.nomeemp, e.funcao, e.salario, s.escala
FROM empregado e JOIN escala_salarial s ON (e.salario BETWEEN s.minsal AND s.maxsal)
ORDER BY 3, 1;




/*  Ex. 5  */
SELECT e.nomeemp, s.escala
FROM empregado e JOIN escala_salarial s ON (e.salario BETWEEN s.minsal AND s.maxsal)
WHERE s.escala = 3;



