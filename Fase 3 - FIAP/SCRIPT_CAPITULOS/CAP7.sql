SET SERVEROUTPUT ON

DECLARE
  v_empno    emp.empno%TYPE;
  v_ename    emp.ename%TYPE;
  v_job      emp.job%TYPE;
  v_mgr      emp.mgr%TYPE;
  v_hiredate emp.hiredate%TYPE;
  v_sal      emp.sal%TYPE;
  v_comm     emp.comm%TYPE;
  v_deptno   emp.deptno%TYPE;

BEGIN
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
  INTO v_empno, v_ename, v_job, v_mgr, v_hiredate, v_sal, v_comm, v_deptno
  FROM emp
 WHERE empno = 7844;
 dbms_output.put_line('Codigo   = ' || v_empno);
 dbms_output.put_line('Nome     = ' || v_ename);
 dbms_output.put_line('Cargo    = ' || v_job);
 dbms_output.put_line('Gerente  = ' || v_mgr);
 dbms_output.put_line('Data     = ' || v_hiredate);
 dbms_output.put_line('Sala     = ' || v_sal);
 dbms_output.put_line('Comissao = ' || v_comm);
 dbms_output.put_line('Depart.  = ' || v_deptno);  
END;
/

select * from emp;


-- JEITO MAIS FACIL DE SER FEITO:
SET SERVEROUTPUT ON;

DECLARE
  emprec emp%rowtype;
--SALVA TODAS AS INFORMACOES DENTRO DE UMA UNICA VARIAVEL
BEGIN
SELECT *
  INTO emprec
  FROM emp
 WHERE empno = 7844;
 dbms_output.put_line('Codigo   = ' || emprec.empno);
 dbms_output.put_line('Nome     = ' || emprec.ename);
 dbms_output.put_line('Cargo    = ' || emprec.job);
 dbms_output.put_line('Gerente  = ' || emprec.mgr);
 dbms_output.put_line('Data     = ' || emprec.hiredate);
 dbms_output.put_line('Sala     = ' || emprec.sal);
 dbms_output.put_line('Comissao = ' || emprec.comm);
 dbms_output.put_line('Depart.  = ' || emprec.deptno);  
END;
/


BEGIN
   DELETE FROM emp
   WHERE deptno = 10;
   dbms_output.put_line('Linhas apagadas = ' || SQL%ROWCOUNT);
   ROLLBACK;
END;
/
-- SQL%ROWCOUNT EXIBE QUANTAS LINHAS FORAM AFETADAS
-- SQL%FOUND RETORNA TRUE SE FOR AFETADO ALGUMA LINHA













-- CURSOR EXPLICITO

-- CRIANDO E ABRINDO UM CURSOR
DECLARE   
  CURSOR cursor_emp IS 
         SELECT deptno, SUM(sal)             
         FROM emp        
      GROUP BY deptno;
BEGIN
   OPEN cursor_emp;
END;
/




DECLARE
  emprec emp%rowtype;   
  CURSOR cursor_emp IS 
         SELECT deptno, SUM(sal)             
          FROM emp        
        GROUP BY deptno;
BEGIN
   OPEN cursor_emp;
   LOOP                                                  -- NECESSARIO DO LOOP PARA NAO PEGAR APENAS UM
      FETCH cursor_emp INTO emprec.deptno, emprec.sal;   -- FETCH PEGA APENAS O PRIMEIRO ITEM LISTADO, NAO UMA LISTA 
      EXIT WHEN cursor_emp%notfound;   -- EXIT(SAIR) WHEN CURSOR NAO FOR ENCONTRADO, SE NAO EXISTIR MAIS RETORNO SAI DO LOOP
      dbms_output.put_line
        ('Departamento: ' || emprec.deptno);
      dbms_output.put_line
        ('Salario     : ' || emprec.sal);
   END LOOP;
   CLOSE cursor_emp;
END;
/




-- LAÇO FOR

DECLARE   
  CURSOR cursor_emp IS               -- CURSOR DECLARADAO
    SELECT deptno, SUM(sal) soma     -- DADOS QUE SERAO EXIBIDOS     
    FROM emp                         -- TABELA
  GROUP BY deptno;                   -- AGRUPAMENTO
BEGIN    
  FOR emprec IN cursor_emp LOOP      -- FOR QUE DEFINE A VARIAVEL EMPREC(QUE FAZ REFERENCIA COM TODAS COLUNAS DA TABELA)
                                     -- ENTAO FAZ UM LOOP DA EMPREC, LENDO-AS NO CURSOR  
    dbms_output.put_line             -- INICIA O LOOP, EXIBE AS INFORMACOES E FINALIZA O LOOP
      ('Departamento: ' || emprec.deptno);       
    dbms_output.put_line
      ('Salario     : ' || emprec.soma);    
  END LOOP; 
END; 
/

select * from emp;

-- MAIS SIMPLIFICADA
BEGIN    
  FOR emprec IN (SELECT deptno, SUM(sal) soma      --REALIZA UMA SUBCONSULTA DENTRO DO IN, ONDE FICARIA O CURSOR
    FROM emp GROUP BY deptno)                      -- PEGA TABELA E AGRUPA, REALIZA O LOOP
  LOOP        
    dbms_output.put_line
      ('Departamento: ' || emprec.deptno);        
    dbms_output.put_line
      ('Salario     : ' || emprec.soma);    
  END LOOP; 
END; 
/