CREATE TABLE dept(
        deptno NUMBER(2,0),
        dname  VARCHAR2(14),
        loc    VARCHAR2(13),
        CONSTRAINT pk_dept PRIMARY KEY (deptno)
);

INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');


CREATE TABLE emp(
        empno    NUMBER(4,0),
        ename    VARCHAR2(10),
        job      VARCHAR2(9),
        mgr      NUMBER(4,0),
        hiredate DATE,
        sal      NUMBER(7,2),
        comm     NUMBER(7,2),
        deptno   NUMBER(2,0),
        CONSTRAINT pk_emp PRIMARY KEY (empno),
        CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
      );
      
INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        TO_DATE('17-DEZ-1980', 'DD-MON-YYYY'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        TO_DATE('20-FEV-1981', 'DD-MON-YYYY'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        TO_DATE('22-FEV-1981', 'DD-MON-YYYY'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('2-ABR-1981', 'DD-MON-YYYY'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('28-SET-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1-MAI-1981', 'DD-MON-YYYY'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('9-JUN-1981', 'DD-MON-YYYY'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('09-DEZ-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('8-SET-1981', 'DD-MON-YYYY'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('3-DEZ-1981', 'DD-MON-YYYY'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('3-DEZ-1981', 'DD-MON-YYYY'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);
        
        
        
SET SERVEROUTPUT ON
DECLARE
  v_nome    VARCHAR2(30);
  v_cargo   VARCHAR2(30);
BEGIN
  SELECT ename, job
  INTO v_nome, v_cargo
  FROM emp
  WHERE empno = 7934;
DBMS_OUTPUT.PUT_LINE(v_nome);
DBMS_OUTPUT.PUT_LINE(v_cargo);
END;
/


SET SERVEROUTPUT ON
DECLARE
    v_teste VARCHAR2(30):='Hello, World';
BEGIN           DBMS_OUTPUT.PUT_LINE(v_teste);
END;       
/


SET SERVEROUTPUT ON
DECLARE    
  v_soma_sal   NUMBER; 
  v_deptno	 NUMBER NOT NULL := 10;           
BEGIN
  SELECT	SUM(sal)  
  INTO		v_soma_sal
  FROM		emp
  WHERE	deptno = v_deptno;
DBMS_OUTPUT.PUT_LINE('A soma dos sal�rios do departamento ' || v_deptno || ' � ' || v_soma_sal);
END;
/


DECLARE
v_empno NUMBER := 11;
v_ename VARCHAR2(13) := 'SANDRA';
v_job VARCHAR2(13) := 'GERENTE';
v_deptno NUMBER := 10;
BEGIN
   INSERT INTO emp(empno, ename, job, deptno)
          VALUES (v_empno, v_ename, v_job, v_deptno);
END;
/

DECLARE
  v_sal_increase   NUMBER := 2000;
BEGIN
  UPDATE	emp
  SET		sal = sal + v_sal_increase
  WHERE	job = 'ANALYST';
END;
/

SELECT * FROM EMP;

DECLARE
  v_deptno   NUMBER := 10;               
BEGIN							
  DELETE FROM   emp
  WHERE         deptno = v_deptno;
END;
/



SELECT * FROM DEPT;
desc dept;

-- CONTROLE TRANSACIONAL

BEGIN
  INSERT INTO dept VALUES (90,'A','A');
  INSERT INTO dept VALUES (91,'B','C');
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN ROLLBACK;
END;
/



DECLARE
    v_valor2 CHAR(2) := '10';
    v_valor1 CHAR(2) := NULL;
    v_media NUMbER(02);
BEGIN 
v_media := (v_valor1 + v_valor2)/2;
DBMS_OUTPUT.PUT_LINE('v_media=>' || v_media);

END;