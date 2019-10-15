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





                                          