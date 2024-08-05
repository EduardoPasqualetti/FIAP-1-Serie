-- CAP 5

-- PACKAGES

-- CREATE [ OR REPLACE ] PACKAGE nome_pacote
--{IS ou AS}

--[ variáveis ]

--[ especificação dos cursores ]

--[ especificação dos módulos ]

--END [nome_pacote ];


CREATE OR REPLACE PACKAGE pkg_faculdade AS
cNOME CONSTANT VARCHAR2(4) := 'FIAP';
cFONE CONSTANT VARCHAR2(13) := '(11)3385-8010';
cNOTA CONSTANT NUMBER(2) := 10;
END pkg_faculdade;
/


SET SERVEROUTPUT ON

DECLARE
 melhor VARCHAR2(30);
BEGIN
  melhor := faculdade.cnome || ', a melhor faculdade';
  dbms_output.put_line(melhor);
END;
/


