-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-02-23 21:21:48 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE t_sit_departamento CASCADE CONSTRAINTS;

DROP TABLE t_sit_dependente CASCADE CONSTRAINTS;

DROP TABLE t_sit_funcionario CASCADE CONSTRAINTS;

DROP TABLE t_sit_implantacao CASCADE CONSTRAINTS;

DROP TABLE t_sit_projeto CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_sit_departamento (
    cd_departamento NUMBER(3) NOT NULL,
    nm_departamento VARCHAR2(30) NOT NULL,
    sg_departamento CHAR(3) NOT NULL
);

ALTER TABLE t_sit_departamento ADD CONSTRAINT pk_t_sit_departamento PRIMARY KEY ( cd_departamento );

ALTER TABLE t_sit_departamento ADD CONSTRAINT un_sit_depto_nome UNIQUE ( nm_departamento );

ALTER TABLE t_sit_departamento ADD CONSTRAINT un_sit_depto_sigla UNIQUE ( sg_departamento );

CREATE TABLE t_sit_dependente (
    cd_dependente NUMBER NOT NULL,
    nm_dependente VARCHAR2(50) NOT NULL,
    nr_matricula  VARCHAR2(5) NOT NULL,
    dt_nascimento DATE NOT NULL
);

ALTER TABLE t_sit_dependente ADD CONSTRAINT pk_t_sit_dependente PRIMARY KEY ( cd_dependente,
                                                                              nr_matricula );

CREATE TABLE t_sit_funcionario (
    nr_matricula    VARCHAR2(5) NOT NULL,
    cd_departamento NUMBER(3) NOT NULL,
    nm_funcionario  VARCHAR2(50) NOT NULL,
    vl_salario      NUMBER(7, 2) NOT NULL,
    dt_admissao     DATE NOT NULL,
    dt_nascimento   DATE NOT NULL,
    ds_endereco     VARCHAR2(50) NOT NULL
);

ALTER TABLE t_sit_funcionario
    ADD CONSTRAINT ck_sit_func_salario CHECK ( vl_salario >= 1.412 );

ALTER TABLE t_sit_funcionario ADD CONSTRAINT pk_t_sit_funcionario PRIMARY KEY ( nr_matricula );

CREATE TABLE t_sit_implantacao (
    cd_projeto     NUMBER(5) NOT NULL,
    cd_implantacao NUMBER(5) NOT NULL,
    nr_matricula   VARCHAR2(5) NOT NULL,
    dt_entrada     DATE NOT NULL,
    dt_saida       DATE
);

ALTER TABLE t_sit_implantacao ADD CONSTRAINT ck_sit_implant_data CHECK ( dt_saida > dt_entrada );

ALTER TABLE t_sit_implantacao ADD CONSTRAINT pk_t_sit_implantacao PRIMARY KEY ( cd_implantacao,
                                                                                cd_projeto );

CREATE TABLE t_sit_projeto (
    cd_projeto NUMBER(5) NOT NULL,
    nm_projeto VARCHAR2(50) NOT NULL,
    dt_inicio  DATE NOT NULL,
    dt_termino DATE
);

ALTER TABLE t_sit_projeto ADD CONSTRAINT ck_sit_projeto_data CHECK ( dt_termino > dt_inicio );

ALTER TABLE t_sit_projeto ADD CONSTRAINT pk_t_sit_projeto PRIMARY KEY ( cd_projeto );

ALTER TABLE t_sit_implantacao
    ADD CONSTRAINT fk_implant_func FOREIGN KEY ( nr_matricula )
        REFERENCES t_sit_funcionario ( nr_matricula );

ALTER TABLE t_sit_implantacao
    ADD CONSTRAINT fk_implant_projeto FOREIGN KEY ( cd_projeto )
        REFERENCES t_sit_projeto ( cd_projeto );

ALTER TABLE t_sit_dependente
    ADD CONSTRAINT fk_sit_dependente_func FOREIGN KEY ( nr_matricula )
        REFERENCES t_sit_funcionario ( nr_matricula );

ALTER TABLE t_sit_funcionario
    ADD CONSTRAINT fk_sit_func_depto FOREIGN KEY ( cd_departamento )
        REFERENCES t_sit_departamento ( cd_departamento );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
