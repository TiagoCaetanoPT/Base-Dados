/*   FICHA 4   */
@Z:\Base-Dados\2019\Ficha04_grupos_e_funcoes_de_grupo\Scripts\ficha2.sql

/*  Ex. 1   */
SELECT count(e.chefe) AS "Numero de Empregados com Chefe"
FROM empregado e;


/*  Ex. 2   */
SELECT COUNT(UNIQUE(e.chefe)) AS "Numero de Chefes na Empresa"
FROM empregado e;


/*  Ex. 3   */
SELECT COUNT(e.comissao) AS "Numero Comissoes (>0)"
FROM empregado e
WHERE e.comissao > 0;


/*  Ex. 4   */
SELECT COUNT(UNIQUE(numdep)) AS "Numero Dept. com Emp."
FROM empregado;


/*  Ex. 5   */
SELECT SUM(comissao) AS "Valor em Comissões"
FROM empregado;



/*  Ex. 6   */
SELECT
FROM
;



