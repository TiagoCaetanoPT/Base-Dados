--11 
CREATE SEQUENCE seq_instituicao
  START WITH 4
  INCREMENT BY 1
  MAXVALUE 999999
;

CREATE OR REPLACE TRIGGER tbi_instituicao
BEFORE INSERT ON t_instituicao
FOR EACH ROW
-- bloco PL/SQL

BEGIN
  :NEW.id := seq_instituicao.NEXTVAL;
  
  IF :NEW.deensino = 'S' THEN
    :NEW.numalunos := 0;
    :NEW.numdocs := 0;  
    ELSE
      :NEW.numalunos := NULL;  
      :NEW.numdocs := NULL;  
  END IF;

END tbi_instituicao;
/

-- INSERT INTO t_instituicao VALUES (100,'TesteNOP','N',20,30);


-- *************************************************************************************
-- *************************************************************************************

-- 12
CREATE OR REPLACE TRIGGER tbiu_pessoa
BEFORE INSERT OR UPDATE OF dataRegisto ON t_pessoa
FOR EACH ROW
  BEGIN
    IF :new.dataRegisto > SYSDATE THEN
      RAISE_APPLICATION_ERROR (-2000, 'Data inválida: deve ser inferior ou igual à data atual');
    END IF;
    IF INSERTING THEN
      -- geracao chave primaria
      :NEW.id := seq_pessoa_pk.NEXTVAL;
    END IF;
END tbiu_pessoa;

-- INSERT INTO t_pessoa VALUES (100,'Nome de Teste','F',999999999,919191919,'D',2);


-- *************************************************************************************
-- *************************************************************************************


-- 13
create or replace TRIGGER tai_integridade
AFTER INSERT OR UPDATE OF idInst OR DELETE ON t_pessoa
FOR EACH ROW
  BEGIN
    IF INSERTING THEN
      IF :NEW.tipo = 'D' THEN
        UPDATE t_instituicao SET numDocs = numDocs+1 WHERE id=:NEW.idInst;
      END IF;
    
    ELSIF DELETING THEN
      IF :OLD.tipo = 'D' THEN
        UPDATE t_instituicao SET numDocs = numDocs-1 WHERE id=:OLD.idInst;
      END IF;
    
    ELSIF UPDATING AND :OLD.idInst <>:NEW.idInst AND :OLD.tipo = 'D' THEN
      UPDATE t_instituicao SET numDocs = numDocs-1 WHERE id=:OLD.idInst;
    END IF;
  END tai_integridade;




-- INSERT INTO t_pessoa VALUES (100,'Carlos Matos','M',555555555,91919199,'D',2);
-- INSERT INTO t_instituicao VALUES (100,'TesteNOP','N',20,30);


-- *************************************************************************************
-- *************************************************************************************


-- 15
CREATE OR REPLACE FUNCTION func_tipo_inst
  (pCodI t_instituicao.id%TYPE)
RETURN INTEGER
IS
   resultado t_instituicao.deEnsino%TYPE;

BEGIN
   -- descobre se instituição recebida por parâmetro é ou não instituição de Ensino
      SELECT deEnsino
      INTO resultado
      FROM t_instituicao
      WHERE id=pCodI;

      IF UPPER(resultado)='S' THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
EXCEPTION
     WHEN NO_DATA_FOUND THEN
         RETURN -1;
END;

-- Testes
SELECT id, func_tipo_inst(id)
FROM t_instituicao;



-- *************************************************************************************
-- *************************************************************************************


-- 16
CREATE OR REPLACE TRIGGER tbiu_pessoa
BEFORE INSERT OR UPDATE OF dataRegisto, idInst ON t_pessoa
FOR EACH ROW

DECLARE
  e_inexist EXCEPTION;
  e_nao_de_ensino EXCEPTION;
  tipoInst INTEGER;

BEGIN
  IF :NEW.dataRegisto>SYSDATE THEN
    RAISE_APPLICATION_ERROR (-20001, 'Data inválida: deve ser inferior à do sistema.');
  END IF;
  -- protecção
  tipoInst := func_tipo_inst (:new.idInst);
  IF INSERTING AND tipoInst=1 THEN
    -- geração do valor da chave primaria
    :NEW.id:=seq_pessoa_pk.NEXTVAL;
  ELSIF tipoInst=-1 THEN
    RAISE e_inexist;
  ELSE
    RAISE e_nao_de_ensino;
  END IF;

EXCEPTION
  WHEN e_inexist THEN
    RAISE_APPLICATION_ERROR (-20020,'ERRO: a instituição não existe.');
  WHEN e_nao_de_ensino THEN
    RAISE_APPLICATION_ERROR (-20021,'ERRO: a instituição não é de ensino.');
END tbiu_pessoa;




-- *************************************************************************************
-- *************************************************************************************



-- 18
create or replace TRIGGER tbi_docente
AFTER INSERT OR UPDATE OF id OR DELETE ON t_
FOR EACH ROW
  BEGIN
    IF INSERTING THEN
      IF :NEW.tipo = 'D' THEN
        INSERT t_docente VALUES(:NEW.id,:NEW.nome,'F',999999999,919191919,'D',2););
      END IF;
    
   
  END tbi_docente;


































