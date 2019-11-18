-- Inserir dados na tabela DEPARTAMENTO
INSERT INTO departamento (numdep,nomedep,localizacao) VALUES (10,'Contabilidade','Lisboa');
INSERT INTO departamento (numdep,nomedep,localizacao) VALUES (20,'Pesquisa','Leiria');
INSERT INTO departamento (numdep,nomedep,localizacao) VALUES (30,'Vendas','Santarém');
INSERT INTO departamento (numdep,nomedep,localizacao) VALUES (40,'Operações','Coimbra');

-- Inserir dados na tabela EMPREGADO
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7839,'Frederico','Presidente',NULL,TO_DATE('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7566,'João','Director',7839,TO_DATE('02-04-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7782,'Carlos','Director',7839,TO_DATE('09-06-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7698,'Bernardo','Director',7839,TO_DATE('01-05-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7788,'Sebastião','Analista',7566,TO_DATE('19-04-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7844,'Tiago','Vendedor',7698,TO_DATE('08-09-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7900,'Jaime','Escriturário',7698,TO_DATE('03-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7902,'Fernando','Analista',7566,TO_DATE('03-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7369,'Silva','Escriturário',7902,TO_DATE('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7499,'Alexandre','Vendedor',7698,TO_DATE('20-02-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7521,'Armando','Vendedor',7698,TO_DATE('22-02-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7654,'Marco','Vendedor',7698,TO_DATE('28-09-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7876,'António','Escriturário',7788,TO_DATE('23-05-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO empregado(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7934,'Mário','Escriturário',7782,TO_DATE('23-01-1982','dd-mm-yyyy'),1300,NULL,10);

-- Inserir dados na tabela ESCALA_SALARIAL
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (1,700,1200);
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (2,1201,1400);
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (3,1401,2000);
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (4,2001,3000);
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES (5,3001,9999);

-- Inserir dados na tabela HISTORICO_FUNCAO
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (254,7934, 'Escriturário', TO_DATE('23-01-1982','dd-mm-yyyy'), TO_DATE('23-05-1987','dd-mm-yyyy'), 20);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (123, 7566, 'Director', TO_DATE('02-04-1981','dd-mm-yyyy'), TO_DATE('22-06-1981','dd-mm-yyyy'), 10);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (124, 7782, 'Vendedor', TO_DATE('09-06-1981','dd-mm-yyyy'), TO_DATE('19-10-1982','dd-mm-yyyy'), 30);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (315, 7839, 'Vendedor', TO_DATE('17-11-1981','dd-mm-yyyy'), TO_DATE('02-04-1989','dd-mm-yyyy'), 40);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (601, 7839, 'Director', TO_DATE('03-04-1989','dd-mm-yyyy'), TO_DATE('17-01-1996','dd-mm-yyyy'), 30);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (602, 7698, 'Escriturário', TO_DATE('01-05-1981','dd-mm-yyyy'), TO_DATE('17-01-1996','dd-mm-yyyy'), 40);
INSERT INTO historico_funcao (IDhist, numemp, funcao, dtaInicio, dtaFim, numdep)
VALUES (586, 7788, 'Vendedor', TO_DATE('19-04-1987','dd-mm-yyyy'),TO_DATE('02-11-1992','dd-mm-yyyy'), 30);


-- Confirmar as inserções realizadas
COMMIT;
