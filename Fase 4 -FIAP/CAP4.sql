-- CAP4


-- FUNCOES  
--CREATE [ OR REPLACE] FUNCTION nome_função
--[(parâmetro [in] tipo_parâmetro,
--  ...
--return tipo_do_retorno

--{IS ou AS}

--BEGIN
--   corpo_da_função
--END nome_função;

-- DESCOBRIR SALARIO DE FUNCIONARIOS
CREATE OR REPLACE FUNCTION fn_descobrir_salario (
   p_id   IN emp.empno%TYPE
) RETURN NUMBER IS
   v_salario   emp.sal%TYPE := 0;
BEGIN
   SELECT  sal
   INTO    v_salario
   FROM    emp
   WHERE   empno = p_id;

   RETURN v_salario;
   
END fn_descobrir_salario;
/

SELECT empno, fn_descobrir_salario(empno)
FROM   emp;

SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line(fn_descobrir_salario(7900) );
END;
/


-- DESCOBRIR QUANTOS DEPTOS EXISTEM
CREATE OR REPLACE FUNCTION fn_contadept
RETURN NUMBER IS
    total NUMBER(7) := 0;
BEGIN
    SELECT COUNT(*)
    INTO   total
    FROM   dept;

    RETURN total;
END;
/


CREATE OR REPLACE FUNCTION fn_sal_anual (
   p_sal NUMBER,
-- valor qualquer se existir
   p_comm NUMBER
) RETURN NUMBER
   IS
BEGIN
-- NVL = se o parametro for nulo, o valor dele sera 0
   RETURN ( p_sal + NVL(p_comm,0) ) * 12;
END fn_sal_anual;
/


CREATE OR REPLACE FUNCTION fn_ordinal (
   p_numero NUMBER
) RETURN VARCHAR2
   IS
BEGIN
   CASE
       p_numero
       WHEN 1 THEN
           RETURN 'primeiro';
       WHEN 2 THEN
           RETURN 'segundo';
       WHEN 3 THEN
           RETURN 'terceiro';
       WHEN 4 THEN
           RETURN 'quarto';
       WHEN 5 THEN
           RETURN 'quinto';
       WHEN 6 THEN
           RETURN 'sexto';
       WHEN 7 THEN
           RETURN 'sétimo';
       WHEN 8 THEN
           RETURN 'oitavo';
       WHEN 9 THEN
           RETURN 'nono';
       ELSE
           RETURN 'não previsto';
   END CASE;
END fn_ordinal;
/

BEGIN
    dbms_output.put_line(fn_ordinal);
END;