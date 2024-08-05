-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-03-14 20:47:10 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE t_svg_avaliacao_produto CASCADE CONSTRAINTS;

DROP TABLE t_svg_categoria CASCADE CONSTRAINTS;

DROP TABLE t_svg_cliente CASCADE CONSTRAINTS;

DROP TABLE t_svg_departamento CASCADE CONSTRAINTS;

DROP TABLE t_svg_funcionario CASCADE CONSTRAINTS;

DROP TABLE t_svg_pes_fisica CASCADE CONSTRAINTS;

DROP TABLE t_svg_pes_juridica CASCADE CONSTRAINTS;

DROP TABLE t_svg_produto CASCADE CONSTRAINTS;

DROP TABLE t_svg_sac CASCADE CONSTRAINTS;

DROP TABLE t_svg_tipo_video CASCADE CONSTRAINTS;

DROP TABLE t_svg_video CASCADE CONSTRAINTS;

DROP TABLE t_svg_visualizacao_video CASCADE CONSTRAINTS;


CREATE TABLE t_svg_avaliacao_produto (
    cd_avaliacao    NUMBER(3) NOT NULL,
    cd_cliente      NUMBER(5) NOT NULL,
    cd_produto      VARCHAR2(5) NOT NULL,
    dt_hr_avaliacao DATE NOT NULL,
    nr_estrelas     CHAR(1) NOT NULL,
    ds_comentario   VARCHAR2(200)
);

COMMENT ON COLUMN t_svg_avaliacao_produto.cd_avaliacao IS
    'Atributo que representa o codigo da avaliacao de produto, chave primaria';

COMMENT ON COLUMN t_svg_avaliacao_produto.cd_cliente IS
    'Atributo que representa o codigo do cliente';

COMMENT ON COLUMN t_svg_avaliacao_produto.cd_produto IS
    'Atributo que representa o codigo do produto';

COMMENT ON COLUMN t_svg_avaliacao_produto.dt_hr_avaliacao IS
    'Atributo que representa a data e a hora que foi feita a avaliacao,  obrigatorio';

COMMENT ON COLUMN t_svg_avaliacao_produto.nr_estrelas IS
    'Atributo que representa o indice de estrelas pelo cliente, obrigatorio';

ALTER TABLE t_svg_avaliacao_produto ADD CONSTRAINT pk_svg_avaliacao_produto PRIMARY KEY ( cd_avaliacao );

CREATE TABLE t_svg_categoria (
    cd_categoria NUMBER(5) GENERATED ALWAYS AS IDENTITY,
    ds_categoria VARCHAR2(100) NOT NULL,
    nm_categoria VARCHAR2(50) NOT NULL,
    st_categoria CHAR(1) NOT NULL,
    dt_inicio    DATE NOT NULL,
    dt_termino   DATE
);

ALTER TABLE t_svg_categoria ADD CONSTRAINT ck_svg_cate_data CHECK ( dt_termino > dt_inicio );

ALTER TABLE t_svg_categoria ADD CONSTRAINT pk_svg_categoria PRIMARY KEY ( cd_categoria );

ALTER TABLE t_svg_categoria ADD CONSTRAINT un_svg_cate_desc UNIQUE ( ds_categoria );


CREATE TABLE t_svg_cliente (
    cd_cliente  NUMBER(5) NOT NULL,
    nm_cliente  VARCHAR2(50) NOT NULL,
    ds_email    VARCHAR2(100) NOT NULL,
    ds_senha    VARCHAR2(30) NOT NULL,
    st_login  CHAR(1) NOT NULL,
    nr_telefone NUMBER(11),
    nr_estrelas CHAR(1)
);

ALTER TABLE t_svg_cliente ADD CONSTRAINT pk_svg_cliente PRIMARY KEY ( cd_cliente );

ALTER TABLE t_svg_cliente ADD CONSTRAINT un_svg_cliente_nome UNIQUE ( nm_cliente );

CREATE TABLE t_svg_departamento (
    cd_depto NUMBER(5) NOT NULL,
    sg_depto CHAR(3) NOT NULL,
    nm_depto VARCHAR2(30) NOT NULL
);

ALTER TABLE t_svg_departamento ADD CONSTRAINT pk_svg_depto PRIMARY KEY ( cd_depto );

ALTER TABLE t_svg_departamento ADD CONSTRAINT un_svg_depto_sigla UNIQUE ( sg_depto );

CREATE TABLE t_svg_funcionario (
    cd_funcionario NUMBER(5) NOT NULL,
    cd_depto       NUMBER(5) NOT NULL,
    nr_cpf         NUMBER(11) NOT NULL,
    nm_funcionario VARCHAR2(50) NOT NULL,
    dt_nascimento  DATE NOT NULL,
    ds_cargo       VARCHAR2(20) NOT NULL
);

ALTER TABLE t_svg_funcionario ADD CONSTRAINT pk_svg_funcionario PRIMARY KEY ( cd_funcionario );

ALTER TABLE t_svg_funcionario ADD CONSTRAINT un_svg_func_cpf UNIQUE ( nr_cpf );

CREATE TABLE t_svg_pes_fisica (
    cd_cliente        NUMBER(5) NOT NULL,
    nr_cpf            NUMBER(11) NOT NULL,
    dt_nascimento     DATE NOT NULL,
    ds_sexo_biologico VARCHAR2(20) NOT NULL,
    ds_genero         VARCHAR2(20)
);

ALTER TABLE t_svg_pes_fisica ADD CONSTRAINT pk_svg_pes_fisica PRIMARY KEY ( cd_cliente );

ALTER TABLE t_svg_pes_fisica ADD CONSTRAINT un_svg_pesfis_cpf UNIQUE ( nr_cpf );

CREATE TABLE t_svg_pes_juridica (
    cd_cliente       NUMBER(5) NOT NULL,
    nr_cnpj          NUMBER(14),
    nr_insc_estadual VARCHAR2(9),
    nm_fantasia      VARCHAR2(50) NOT NULL,
    dt_fundacao      DATE
);

ALTER TABLE t_svg_pes_juridica ADD CONSTRAINT pk_svg_pes_juridica PRIMARY KEY ( cd_cliente );

ALTER TABLE t_svg_pes_juridica ADD CONSTRAINT un_svg_pesjur_cnpj UNIQUE ( nr_cnpj );

ALTER TABLE t_svg_pes_juridica ADD CONSTRAINT un_svg_pesjur_insc UNIQUE ( nr_insc_estadual );

CREATE TABLE t_svg_produto (
    cd_produto          NUMBER(5) GENERATED ALWAYS AS IDENTITY,
    cd_categoria        NUMBER(5) NOT NULL,
    cd_barras           NUMBER(13),
    ds_produto          VARCHAR2(30) NOT NULL,
    nm_produto          VARCHAR2(50) NOT NULL,
    ds_produto_completa VARCHAR2(500) NOT NULL,
    st_produto          CHAR(1) NOT NULL,
    vl_preco_unitario   NUMBER(8, 2) NOT NULL
);

COMMENT ON COLUMN t_svg_produto.cd_produto IS
    'Atributo que representa o codigo, a chave primaria do produto';

COMMENT ON COLUMN t_svg_produto.cd_categoria IS
    'Atributo que representa o codigo da categoria';

COMMENT ON COLUMN t_svg_produto.cd_barras IS
    'Atributo que representa o codigo de barras, nao obrigatorio';

COMMENT ON COLUMN t_svg_produto.ds_produto IS
    'Atributo que representa a descricao do produto, obrigatorio';

COMMENT ON COLUMN t_svg_produto.nm_produto IS
    'Atributo que representa o nome do produto, obrigatorio';

COMMENT ON COLUMN t_svg_produto.ds_produto_completa IS
    'Atributo que representa a descricao completa do produto, obrigatorio';

COMMENT ON COLUMN t_svg_produto.st_produto IS
    'Atributo que representa o status do produto, obrigatorio';

COMMENT ON COLUMN t_svg_produto.vl_preco_unitario IS
    'Atributo que representa o valor  do produto, obrigatorio';

ALTER TABLE t_svg_produto ADD CONSTRAINT pk_svg_produto PRIMARY KEY ( cd_produto );

ALTER TABLE t_svg_produto ADD CONSTRAINT un_svg_prod_cdbarras UNIQUE ( cd_barras );

ALTER TABLE t_svg_produto ADD CONSTRAINT un_svg_prod_desc UNIQUE ( ds_produto );

CREATE TABLE t_svg_sac (
    cd_sac                   NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    cd_cliente               NUMBER(5) NOT NULL,
    cd_funcionario           NUMBER(5) NOT NULL,
    cd_produto               VARCHAR2(5) NOT NULL,
    ds_tipo_chamado          VARCHAR2(20) NOT NULL,
    tx_chamado_abertura      VARCHAR2(4000) NOT NULL,
    dt_hr_chamado            DATE NOT NULL,
    st_chamado               CHAR(1) NOT NULL,
    qt_duracao_atend_minutos NUMBER(3) NOT NULL,
    qt_duracao_chamado_hrs   NUMBER(3) NOT NULL,
    dt_hr_atend              DATE,
    tx_chamado_retorno_func  VARCHAR2(1000),
    nr_satisfacao_cliente    NUMBER(2)
);

ALTER TABLE t_svg_sac ADD CONSTRAINT pk_svg_sac PRIMARY KEY ( cd_sac );

CREATE TABLE t_svg_tipo_video (
    cd_tipo_video NUMBER(3) NOT NULL,
    ds_tipo_video VARCHAR2(200) NOT NULL
);

ALTER TABLE t_svg_tipo_video ADD CONSTRAINT pk_svg_tipo_video PRIMARY KEY ( cd_tipo_video );

CREATE TABLE t_svg_video (
    cd_video      NUMBER(5) NOT NULL,
    cd_produto    VARCHAR2(5) NOT NULL,
    cd_tipo_video NUMBER(3) NOT NULL,
    nm_video      VARCHAR2(50) NOT NULL,
    dt_cadastro   DATE NOT NULL,
    st_video      CHAR(1) NOT NULL
);

ALTER TABLE t_svg_video
    ADD CONSTRAINT ck_svg_video_status CHECK ( st_video IN ( 'A', 'I' ) );

ALTER TABLE t_svg_video ADD CONSTRAINT pk_svg_video PRIMARY KEY ( cd_video );

CREATE TABLE t_svg_visualizacao_video (
    cd_visualizacao NUMBER(5) NOT NULL,
    cd_video        NUMBER(5) NOT NULL,
    cd_cliente      NUMBER(5) NOT NULL,
    dt_hr_visita    DATE NOT NULL
);

ALTER TABLE t_svg_visualizacao_video ADD CONSTRAINT pk_svg_visualizacao_video PRIMARY KEY ( cd_visualizacao );

ALTER TABLE t_svg_avaliacao_produto
    ADD CONSTRAINT fk_svg_avalprod_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_svg_cliente ( cd_cliente );

ALTER TABLE t_svg_avaliacao_produto
    ADD CONSTRAINT fk_svg_avalprod_prod FOREIGN KEY ( cd_produto )
        REFERENCES t_svg_produto ( cd_produto );

ALTER TABLE t_svg_funcionario
    ADD CONSTRAINT fk_svg_func_depto FOREIGN KEY ( cd_depto )
        REFERENCES t_svg_departamento ( cd_depto );

ALTER TABLE t_svg_pes_fisica
    ADD CONSTRAINT fk_svg_pesfis_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_svg_cliente ( cd_cliente );

ALTER TABLE t_svg_pes_juridica
    ADD CONSTRAINT fk_svg_pesjur_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_svg_cliente ( cd_cliente );

ALTER TABLE t_svg_produto
    ADD CONSTRAINT fk_svg_prod_cate FOREIGN KEY ( cd_categoria )
        REFERENCES t_svg_categoria ( cd_categoria );

ALTER TABLE t_svg_sac
    ADD CONSTRAINT fk_svg_sac_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_svg_cliente ( cd_cliente );

ALTER TABLE t_svg_sac
    ADD CONSTRAINT fk_svg_sac_func FOREIGN KEY ( cd_funcionario )
        REFERENCES t_svg_funcionario ( cd_funcionario );

ALTER TABLE t_svg_sac
    ADD CONSTRAINT fk_svg_sac_prod FOREIGN KEY ( cd_produto )
        REFERENCES t_svg_produto ( cd_produto );

ALTER TABLE t_svg_video
    ADD CONSTRAINT fk_svg_video_prod FOREIGN KEY ( cd_produto )
        REFERENCES t_svg_produto ( cd_produto );

ALTER TABLE t_svg_video
    ADD CONSTRAINT fk_svg_video_tipovideo FOREIGN KEY ( cd_tipo_video )
        REFERENCES t_svg_tipo_video ( cd_tipo_video );

ALTER TABLE t_svg_visualizacao_video
    ADD CONSTRAINT fk_svg_vizuvideo_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_svg_cliente ( cd_cliente );

ALTER TABLE t_svg_visualizacao_video
    ADD CONSTRAINT fk_svg_vizuvideo_video FOREIGN KEY ( cd_video )
        REFERENCES t_svg_video ( cd_video );


ALTER TABLE t_svg_categoria
    ADD CONSTRAINT ck_svg_categoria_status CHECK (
    (st_categoria = 'A' AND dt_termino IS NULL) OR
    (st_categoria = 'I' AND dt_termino IS NOT NULL)
);

ALTER TABLE t_svg_cliente
    ADD CONSTRAINT ck_svg_cliente_login CHECK (
    st_login IN ('Y', 'N')
    );
