CREATE TABLE tabela1
(col1 VARCHAR2(30));

INSERT INTO tabela1
  VALUES ('Tamanho alterado para 30 bytes');

SET SERVEROUTPUT ON

DECLARE
  v_col1 VARCHAR2(18);
BEGIN
  SELECT col1 INTO v_col1
    FROM tabela1;
  DBMS_OUTPUT.PUT_LINE ('Valor = ' || v_col1);
END;
/

-- col1 DEFINIDA COM TAMANHO DE 30, POREM A VARIAVEL FOI DECLARADA COM TAMANHO 18, OCASIONANDO ERRO

SELECT  COL1 FROM TABELA1;

DECLARE
  v_col1 tabela1.col1%TYPE;
BEGIN
  SELECT col1 INTO v_col1
    FROM tabela1;
  DBMS_OUTPUT.PUT_LINE ('Valor = ' || v_col1);
END;
/
-- %TYPE RECUPERA O TIPO DE DADO A COLUNA, SETANDO O MESMO NA VARIAVEL, SEM TER PROBLEMA COM TAMANHO





-- USO DE IF THEN, ELSIF E ELSE

DECLARE
  v_col1    tabela1.col1%TYPE;   
  v_tamanho NUMBER(3); 
BEGIN   
  SELECT LENGTH(col1), col1 INTO v_tamanho, v_col1     
    FROM tabela1;   
  IF v_tamanho > 25 THEN      
    DBMS_OUTPUT.PUT_LINE ('Texto = ' || v_col1);
  ELSIF v_tamanho > 20 THEN
     DBMS_OUTPUT.PUT_LINE ('Texto maior que 20');
  ELSIF v_tamanho > 15 THEN
     DBMS_OUTPUT.PUT_LINE ('Texto maior que 15');
  ELSE
     DBMS_OUTPUT.PUT_LINE ('Texto menor ou igual a 15');
  END IF; 
END;
/

UPDATE TABELA1
SET COL1 = '123456789012345676123540000';



-- USO DED AND E OR


DECLARE
  v_tamanho NUMBER(3); 
BEGIN   
  SELECT LENGTH(col1) INTO v_tamanho     
    FROM tabela1;   
  IF v_tamanho > 25 AND
     TO_CHAR(SYSDATE, 'YYYY') > 1999 THEN  
     DBMS_OUTPUT.PUT_LINE ('Maior que 25 bytes e século XXI');
  END IF; 
END;
/



-- ESTRUTURAS DE REPETICAO


DECLARE
  v_contador NUMBER(2) :=1; 
BEGIN   
  LOOP
    INSERT INTO tabela1
    VALUES ('Inserindo texto numero ' || v_contador);
    v_contador := v_contador + 1;   
  EXIT WHEN v_contador > 10;   
  END LOOP;
END;
/



-- USANDO FOR
BEGIN   
  FOR i IN 1..10 LOOP
    INSERT INTO tabela1
    VALUES ('Inserindo texto numero ' || i);
  END LOOP;
END;
/


-- USANDO WHILE
DECLARE
  v_contador NUMBER(2) :=1; 
BEGIN   
  WHILE v_contador <= 10 LOOP
    INSERT INTO tabela1
    VALUES ('Inserindo texto numero ' || v_contador);
    v_contador := v_contador + 1;   
  END LOOP;
END;


DECLARE
    v_teste BOOLEAN := TRUE;
    v_registro NUMBER(2);
BEGIN
    WHILE v_teste = true LOOP
        INSERT INTO tabela1
        VALUES('DECIMO PRIMEIRO');
        
        SELECT COUNT(*)
        INTO v_registro
        FROM tabela1;
        
        IF v_registro = 11 THEN
            v_teste := false;
        END IF;
    END LOOP;
END;
/




-- LOOP ALINHADO

BEGIN   
  FOR i IN 1..3 LOOP
    FOR j IN 1..5 LOOP
        INSERT INTO tabela1
        VALUES ('Inserindo texto numero ' || i || j);
    END LOOP;
  END LOOP;
END;
/


-- POSSIVEL COLOCAR UM IF DENTRO DOS LOOPS
BEGIN   
  FOR i IN 1..3 LOOP
    FOR j IN 1..5 LOOP
        IF i = 2 then
            INSERT INTO tabela1
            VALUES ('Inserindo texto numero ' || i || j);
        END IF;
    END LOOP;
  END LOOP;
END;
/

TRUNCATE TABLE TABELA1;
SELECT * FROM TABELA1;



