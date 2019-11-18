CREATE OR REPLACE TRIGGER tbi_pessoa
BEFORE INSERT ON t_pessoa
FOR EACH ROW
BEGIN
-- geração do valor da chave primária
   :NEW.id:=seq_pessoa_pk.NEXTVAL;
END; 
/

