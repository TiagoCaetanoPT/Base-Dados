/*   FICHA 5   */
@Z:\Base-Dados\2019\Praticas\Ficha05_SQL_Subconsultas\Scripts\ficha2.sql


/*  Ex. 1   */
SELECT nomeemp, numdep, salario
FROM empregado
WHERE salario > (SELECT AVG(salario)
                  FROM empregado);


/*  Ex. 2   */
SELECT nomedep
FROM departamento
WHERE numdep = (SELECT numdep
                FROM empregado
                WHERE salario = (SELECT MIN(salario)
                                  FROM empregado));
                                  
                                  
/*  Ex. 3   */
SELECT nomedep
FROM departamento
WHERE numdep = (SELECT numdep
                FROM empregado
                GROUP BY numdep
                HAVING (AVG(salario) < (SELECT AVG(salario)
                                          FROM empregado)));
                                          
                                          
                                          
/*  Ex. 4   */
SELECT nomedep
FROM departamento
WHERE numdep NOT IN (SELECT numdep
                     FROM empregado);



/*  Ex. 5   */
SELECT COUNT(*) AS "Número de Chefes"
FROM (SELECT DISTINCT(aux.numemp)
      FROM empregado e JOIN empregado aux ON (e.chefe = aux.numemp));



/*  Ex. 6   */
SELECT ROUND(MAX(AVG(salario)),2) AS "Maior Salario Médio"
FROM empregado
GROUP BY numdep;



/*  Ex. 7  */
SELECT COUNT(*) AS "Dept. com mais de 3 Emp."
FROM (SELECT COUNT(*)
      FROM empregado
      GROUP BY numdep
      HAVING COUNT(*) > 3);
 
      
      
/*  Ex. 8  */
SELECT e.nomeemp , e.numdep, e.salario
FROM empregado e
WHERE e.salario > (SELECT AVG(salario)
                   FROM empregado
                   WHERE numdep = e.numdep)
ORDER BY 2 ASC, 3 DESC;


/*  Ex. 9  */
SELECT d.nomedep, e.nomeemp, e.dtacontratacao
FROM departamento d JOIN empregado e ON (d.numdep = e.numdep)
WHERE e.dtacontratacao > ALL(SELECT r.dtacontratacao
                              FROM empregado r
                              WHERE r.numdep=e.numdep AND r.dtacontratacao <> e.dtacontratacao)
ORDER BY 3;



/*  Ex. 10  */
SELECT numdep AS "Departamento", SUM(12*salario) AS "Encargo anual"
FROM empregado
GROUP BY numdep
HAVING SUM(12*salario) = (SELECT MAX("valor")
                          FROM (SELECT SUM(12*salario) AS "valor"
                                FROM empregado
                                GROUP BY numdep));


/*  Ex. 11  */
SELECT TO_CHAR(dtacontratacao, 'YYYY') AS "ANO", COUNT(*) AS "Número de empregados"
FROM empregado
GROUP BY TO_CHAR(dtacontratacao, 'YYYY')
HAVING COUNT(*) = (SELECT MAX("valor") 
                   FROM (SELECT COUNT(*) AS "valor"
                         FROM empregado
                         GROUP BY TO_CHAR(dtacontratacao, 'YYYY')));


/*  Ex. 12  */
SELECT e.nomeemp, e.dtacontratacao, e.salario, e.comissao AS "COM"
FROM empregado e;





