CREATE OR REPLACE TRIGGER TBI_pessoa
BEFORE INSERT ON pessoa
FOR EACH ROW
BEGIN
  :NEW.dtaRegisto := SYSDATE;
  :NEW.id := sq_id_pessoa.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TBI_pessoa_tipo
BEFORE UPDATE OF tipo ON pessoa
FOR EACH ROW
BEGIN
  IF :NEW.tipo != :old.tipo THEN
    RAISE_APPLICATION_ERROR(-20001,'Não pode alterar o tipo!');
  END IF;
END;
/

