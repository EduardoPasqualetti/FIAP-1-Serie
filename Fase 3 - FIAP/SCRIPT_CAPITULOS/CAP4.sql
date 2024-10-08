-- CAP 4 - FUNCOES

-- EXEMPLO � FUN��ES LOWER(), UPPER() e INITCAP()
SELECT F.NM_FUNCIONARIO           "COMO EST� GRAVADO"  ,
 LOWER(F.NM_FUNCIONARIO)    "MINUSCULAS (LOWER)" ,
 UPPER(F.NM_FUNCIONARIO)    "MAIUSCULAS (UPPER)" ,
 INITCAP(F.NM_FUNCIONARIO)  "MAIUSCULA/MINUSCULA (INITCAP)"      
  FROM T_SIP_FUNCIONARIO F;
  
  -- EXEMPLO � FUN��ES ASCII() e CHR()
SELECT ASCII('R'), 
       CHR(82) 
  FROM DUAL;
  
  -- CONTATENACAO DE PALAVRAS
  -- EXEMPLO � FUN��O CONCAT()
SELECT CONCAT(CONCAT(F.NR_MATRICULA,'-'),F.NM_FUNCIONARIO)           
  FROM T_SIP_FUNCIONARIO F;
  
  -- EXEMPLO � FUN��O LENGTH ()
SELECT F.NM_FUNCIONARIO , 
       LENGTH(F.NM_FUNCIONARIO)    
  FROM T_SIP_FUNCIONARIO F;
  
  -- EXEMPLO � FUN��ES RPAD() e LPAD()
SELECT F.NM_FUNCIONARIO                ,
       F.VL_SALARIO_MENSAL             ,
       RPAD(F.NM_FUNCIONARIO,60)       ,
       RPAD(F.NM_FUNCIONARIO,60,'.')   ,
       LPAD(F.VL_SALARIO_MENSAL,10,'*')   
  FROM T_SIP_FUNCIONARIO F;
  
-- EXEMPLO � FUN��ES NVL() e NVL2()
SELECT F.DT_NASCIMENTO                   ,
       NVL(F.DT_NASCIMENTO,'01/01/1900') ,
       NVL2(F.DT_NASCIMENTO,SYSDATE,'01/01/1900')       
  FROM T_SIP_FUNCIONARIO F;
  
  -- EXEMPLO � FUN��O REPLACE()
SELECT F.NM_FUNCIONARIO                ,
       REPLACE(F.NM_FUNCIONARIO,'A','*')
  FROM T_SIP_FUNCIONARIO F;
  
  -- EXEMPLO � FUN��O SUBSTR()
SELECT F.NM_FUNCIONARIO                ,
       SUBSTR(F.NM_FUNCIONARIO,3)      ,
       SUBSTR(F.NM_FUNCIONARIO,3, 5)      
  FROM T_SIP_FUNCIONARIO F;
  
  
  -- EXEMPLO � FUN��ES NUM�RICAS
SELECT F.VL_SALARIO_MENSAL           ,
       ROUND(F.VL_SALARIO_MENSAL)    ,
       ROUND(F.VL_SALARIO_MENSAL,1)  ,
       TRUNC(F.VL_SALARIO_MENSAL)    ,
       TRUNC(F.VL_SALARIO_MENSAL,1)  ,
       MOD(F.VL_SALARIO_MENSAL,3)    ,
       ABS(F.VL_SALARIO_MENSAL)      ,
       SQRT(F.VL_SALARIO_MENSAL)
      FROM T_SIP_FUNCIONARIO F;
      
      
          
      
      
-- EXEMPLO � FUN��ES DE CONVERS�O � TO_CHAR()
SELECT F.VL_SALARIO_MENSAL ,
       TO_CHAR(F.VL_SALARIO_MENSAL, 'L9999999.99') "SIMBOLO MOEDA LOCAL" ,
       TO_CHAR(F.VL_SALARIO_MENSAL, 'C99,999.99') "SIMBOLO MOEDA ISO" ,
       TO_CHAR(F.VL_SALARIO_MENSAL, '99,999.99')  ,
       F.NR_MATRICULA ,
       TO_CHAR(F.NR_MATRICULA, '0099999')       
  FROM T_SIP_FUNCIONARIO F;
  
  
  -- EXEMPLO � FUN��ES DE CONVERS�O � TO_NUMBER()
SELECT TO_NUMBER('103')      ,
       TO_NUMBER('103') + 30 ,
       TO_NUMBER('-$12,345.99','$99,999.99')
  FROM DUAL;
  
  
-- EXEMPLO � FUN��ES DE CONVERS�O � TO_DATE()
SELECT F.DT_ADMISSAO ,
       TO_DATE(F.DT_ADMISSAO,'DD/MM/YYYY')  
  FROM T_SIP_FUNCIONARIO F;
  
  
  -- EXEMPLO � FUN��ES DE CONVERS�O � CAST()
-- CONVERTER VALORES LITERAIS EM TIPOS ESPEC�FICOS
SELECT 
        CAST( 12345.67 AS VARCHAR2(10) ) ,        
        CAST( '29/09/2013' AS DATE )     ,
        CAST( 12345.678 AS NUMBER(10,2)) 
  FROM DUAL;
  
-- EXEMPLO � FUN��ES DE CONVERS�O � CAST()
-- CONVERTER VALORES DE COLUNA DE UM TIPO PARA OUTRO
SELECT 
       CAST ( F.VL_SALARIO_MENSAL AS VARCHAR2(10) ) ,
       CAST ( F.VL_SALARIO_MENSAL + 1000 AS NUMBER (8,2) )
  FROM T_SIP_FUNCIONARIO F;
  
  
  -- EXEMPLO � SYSDATE
SELECT SYSDATE FROM DUAL;

-- EXEMPLO � FUN��ES DE DATA � ADD_MONTHS()
SELECT SYSDATE                 "DATA ATUAL"  ,
       ADD_MONTHS(SYSDATE, 1)  "PR�XIMO M�S" ,
       ADD_MONTHS(SYSDATE, -1) "M�S ANTERIOR"
  FROM DUAL;
  
  -- EXEMPLO � FUN��ES DE DATA � ADD_MONTHS()
SELECT DT_ADMISSAO ,
       ADD_MONTHS(DT_ADMISSAO,1) 
  FROM T_SIP_FUNCIONARIO;
  
  -- EXEMPLO � FUN��ES DE DATA � LAST_DAY()
-- EXEMPLO � FUN��ES DE DATA � LAST_DAY()
SELECT DT_ADMISSAO ,
       LAST_DAY(DT_ADMISSAO) 
  FROM T_SIP_FUNCIONARIO;
  
  
  -- EXEMPLO � FUN��ES DE DATA � MONTHS_BETWEEN()
SELECT DT_ADMISSAO ,
       SYSDATE     , 
       MONTHS_BETWEEN(SYSDATE, DT_ADMISSAO) ,
       TRUNC(MONTHS_BETWEEN(SYSDATE, DT_ADMISSAO)) || ' MESES'
  FROM T_SIP_FUNCIONARIO;
  
  -- EXEMPLO � FUN��ES DE DATA � NEXT_DAY()
SELECT SYSDATE ,
       NEXT_DAY(SYSDATE, 1) "PR�XIMO DOMINGO" ,
       NEXT_DAY(SYSDATE, 2) "PR�XIMA SEGUNDA" ,
       NEXT_DAY(SYSDATE, 3) "PR�XIMA TER�A"   ,
       NEXT_DAY(SYSDATE, 4) "PR�XIMA QUARTA"  ,
       NEXT_DAY(SYSDATE, 5) "PR�XIMA QUINTA"  ,
       NEXT_DAY(SYSDATE, 6) "PR�XIMA SEXTA"   ,
       NEXT_DAY(SYSDATE, 7) "PR�XIMO S�BADO" 
  FROM DUAL;
  
  
  -- EXEMPLO � FUN��ES DE DATA 
SELECT DT_ADMISSAO ,
       TO_CHAR(DT_ADMISSAO, 'YYYY')     "ANO CONTRATACAO"       ,
        TO_CHAR(DT_ADMISSAO, 'MM/YYYY') "M�S E ANO CONTRATACAO"  ,
        TO_CHAR(DT_ADMISSAO, 'DD/MM') "DIA E M�S DA CONTRATACAO" ,
        TO_CHAR(DT_ADMISSAO, 'DD " de " fmMONTH " de " YYYY', 'NLS_DATE_LANGUAGE=PORTUGUESE') "DATA POR EXTENSO"
  FROM T_SIP_FUNCIONARIO;
  
  
  -- EXEMPLO � FUN��ES DE DATA 
 SELECT DT_ADMISSAO ,
        TO_DATE(DT_ADMISSAO , 'DD/MM/YYYY') - 5
  FROM  T_SIP_FUNCIONARIO;
  
  -- EXEMPLO � FUN��ES DE DATA 
 SELECT DT_ADMISSAO ,
        TO_DATE(DT_ADMISSAO,'DD/MM/YYYY HH:MI:SS') + 6/24
   FROM T_SIP_FUNCIONARIO;