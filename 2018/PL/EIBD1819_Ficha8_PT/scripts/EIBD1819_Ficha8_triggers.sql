CREATE OR REPLACE TRIGGER tbi_pessoa
BEFORE INSERT ON t_pessoa
FOR EACH ROW
BEGIN
-- gera��o do valor da chave prim�ria
   :NEW.id:=seq_pessoa_pk.NEXTVAL;
END; 
/

