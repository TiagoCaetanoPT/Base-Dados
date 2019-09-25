/*   FICHA 2   */
/*  Ex. 1   */
@Z:\Base-Dados\2019\Ficha02_SQL\Scripts\ficha2.sql;


/*  Ex. 2   */
/*  Ex. 2 a)   */
SELECT *
FROM departamento;

/*  Ex. 2 b)   */
SELECT *
FROM empregado
ORDER BY numemp;

/*  Ex. 2 c)   */
SELECT *
FROM escala_salarial
ORDER BY escala;

/*  Ex. 2 d)   */
SELECT *
FROM historico_funcao
ORDER BY idhist;


/*  Ex. 3    */
SELECT DISTINCT funcao
FROM empregado
ORDER BY funcao ASC;


/*  Ex. 4    */
SELECT DISTINCT numdep
FROM empregado
ORDER BY numdep DESC;


/*  Ex. 5    */
SELECT nomeemp, salario,  NVL(to_char(comissao),'Não Tem')
FROM empregado
ORDER BY salario DESC, nomeemp;


/*  Ex. 6   */
SELECT numemp, nomeemp, salario
FROM empregado
WHERE salario > 2000;


/*  Ex. 7   */
SELECT nomeemp || ' é ' || funcao || ', no departamento ' || numdep || ', desde ' || TO_CHAR(dtacontratacao, 'DD') || ' de ' || TO_CHAR(dtacontratacao, 'Month') || ' de ' || TO_CHAR(dtacontratacao, 'YYYY') AS " Quem, Onde, Quando"
FROM empregado;

/*  Ex. 8   */
SELECT  'O ' || UPPER(nomeemp) || ' ganha ' || salario || ' mas queria ganhar ' || 3*salario AS "SALÁRIOS"
FROM empregado;


/*  Ex. 9   */
SELECT nomeemp, salario, comissao
FROM empregado
WHERE COMISSAO > salario
ORDER BY nomeemp ASC;


/*  Ex. 10   */
SELECT nomeemp, funcao
FROM empregado
WHERE UPPER(funcao) LIKE 'VENDEDOR' OR UPPER(funcao) LIKE 'DIRECTOR'
ORDER BY nomeemp;


/*  Ex. 11   */
SELECT nomeemp, funcao, numdep
FROM empregado
WHERE numdep = 10 OR numdep = 20;


/*  Ex. 12   */
SELECT nomeemp
FROM empregado
WHERE LOWER(nomeemp) LIKE 'm%';


/*  Ex. 13   */
SELECT nomeemp
FROM empregado
WHERE LOWER(nomeemp) LIKE '%do';


/*  Ex. 14   */
SELECT nomeemp
FROM empregado
WHERE UPPER(nomeemp) LIKE 'M%O';


/*  Ex. 15   */
SELECT nomeemp
FROM empregado
WHERE LOWER(nomeemp) LIKE '%o%'
ORDER BY nomeemp ASC;


/*  Ex. 16   */
SELECT nomeemp
FROM empregado
WHERE UPPER(nomeemp) NOT LIKE 'A%' AND UPPER(nomeemp) LIKE '%A%'
ORDER BY nomeemp ASC;


/*  Ex. 17   */
SELECT nomeemp
FROM empregado
WHERE LOWER(nomeemp) NOT LIKE '%o%';


/*  Ex. 18   */
SELECT LOWER(nomeemp), comissao
FROM empregado
WHERE comissao IS NOT NULL AND comissao <> 0;


/*  Ex. 19   */
SELECT numemp, nomeemp AS "NOME_EMPREGADO"
FROM empregado
WHERE chefe IS NULL;



/*  Ex. 20   */
SELECT nomeemp, salario
FROM empregado
WHERE salario > 3000 AND COMISSAO IS NULL;


/*  Ex. 21   */
SELECT nomeemp, ROUND(salario + salario*0.15) AS "Salário Futuro"
FROM empregado
ORDER BY salario DESC;



/*  Ex. 22  */
SELECT nomeemp, TO_CHAR(dtacontratacao, 'DD-MM-YYYY') AS "Data de Contratação", ADD_MONTHS(dtacontratacao,12) AS "Data Revisão"
FROM empregado
ORDER BY nomeemp ASC;


/*  Ex. 23  */
SELECT nomeemp, TO_CHAR(dtacontratacao, 'DD-MM-YYYY') AS "Data de Contratacao",  ' anos e ' || TRUNC(MONTHS_BETWEEN(SYSDATE, dtacontratacao)) || ' meses de serviço' AS "Tempo de Serviço"
FROM empregado
ORDER BY nomeemp ASC;


/*  Ex. 24  */
SELECT nomeemp AS "EMPREGADO", salario*14+NVL(comissao,0) AS "REMUNERAÇÃO ANUAL"
FROM empregado
ORDER BY nomeemp ASC;


/*  Ex. 25  */
SELECT nomeemp,  CASE
                  WHEN salario < 1500 THEN 'Menor que 1500' 
                  WHEN salario = 1500 THEN 'Valor Exato'
                  ELSE TO_CHAR(salario)
                 END AS "SAL"
FROM empregado
ORDER by nomeemp;





