-- CAP 3

-- COMO FUNCIONA UMA PROCEDURE

-- CREATE [ OR REPLACE] nome_procedimento
--  [parâmetro [{in, out, in out}] tipo_parâmetro,
--  ...
-- {IS ou AS}

-- BEGIN
-- corpo_do_procedimento
		
--  END [nome_procedimento];

SET SERVEROUTPUT ON

-- EXEMPLO BASICO
CREATE OR REPLACE PROCEDURE sp_quadrado
(p_num IN NUMBER :=0)
IS
BEGIN
DBMS_OUTPUT.PUT_LINE (p_num*p_num );
END sp_quadrado;


EXECUTE sp_quadrado(5);


-- ERRO DE COMPILACAO
SHOW ERRORS;


-- PARAMETROS


CREATE OR REPLACE PROCEDURE sp_reajuste
(p_codigo_emp IN emp.empno%type,
p_porcentagem IN NUMBER DEFAULT 25)
IS 
BEGIN
    UPDATE emp
        set sal = sal + (sal *(p_porcentagem / 100))
    WHERE empno = p_codigo_emp;
COMMIT;
END sp_reajuste;


SELECT empno, sal
  FROM emp
 WHERE empno = 7839;

EXECUTE sp_reajuste(7839);
-- com valor default nao precisa obrigatoriamente colocar o parametro


-- PARAMETRO DE SAIDA
CREATE OR REPLACE PROCEDURE sp_consulta_emp
(p_id IN emp.empno%TYPE,
 p_nome OUT emp.ename%TYPE,
 p_salario OUT emp.sal%TYPE)
IS 
BEGIN
    SELECT ename, sal INTO
           p_nome, p_salario
      FROM emp
     WHERE empno  = p_id;
END sp_consulta_emp;
/

SET SERVEROUTPUT ON

DECLARE
   v_nome    emp.ename%TYPE;
   v_salario emp.sal%TYPE;
BEGIN
   sp_consulta_emp(7839, v_nome, v_salario);
   DBMS_OUTPUT.PUT_LINE(v_nome);
   DBMS_OUTPUT.PUT_LINE(v_salario);
END;
/



-- PASSAGEM DE PARAMETRO
CREATE OR REPLACE PROCEDURE sp_incluir_dept
(p_cod  IN dept.deptno%TYPE DEFAULT '50',
 p_nome IN dept.dname%TYPE DEFAULT 'FIAP',
 p_loc  IN dept.loc%TYPE DEFAULT 'SP')
IS
BEGIN
  INSERT INTO dept(deptno, dname, loc)
  VALUES(p_cod, p_nome, p_loc);
END sp_incluir_dept;
/

EXECUTE sp_incluir_dept;


BEGIN
   sp_incluir_dept (p_cod => 60, p_nome => 'Doze', p_loc => 'RJ’);
END;
