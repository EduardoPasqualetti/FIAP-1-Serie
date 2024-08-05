-- Resposta do Comando SQL item a)
INSERT INTO MC_DEPTO (NM_DEPTO,ST_DEPTO) VALUES
('COMERCIAL','A');
INSERT INTO MC_DEPTO (NM_DEPTO,ST_DEPTO) VALUES
('FINANCEIRO','A');
INSERT INTO MC_DEPTO (NM_DEPTO,ST_DEPTO) VALUES
('SAC','A');



-- Resposta do Comando SQL item b)
INSERT INTO MC_FUNCIONARIO VALUES
(DEFAULT,3,NULL,'GUSTAVO ALVES CORREA',TO_DATE('05/02/2003','DD/MM/YYYY'),'M','Masculino'
,'Assistente de Marketing',3500.00,'gustavoalves@live.com','A',TO_DATE('25/02/2023','DD/MM/YYYY'),NULL);

INSERT INTO MC_FUNCIONARIO VALUES
(DEFAULT,3,NULL,'BRUNO CENTURION FERNANDES',TO_DATE('15/04/2000','DD/MM/YYYY'),'M','Masculino',
'Coordenador de Atendimento',5800.50,'brunocenturion@gmail.com','A',TO_DATE('21/09/2019','DD/MM/YYYY'),NULL);

INSERT INTO MC_FUNCIONARIO VALUES
(DEFAULT,3,NULL,'ANA JULIA LIMA',TO_DATE('09/11/1997','DD/MM/YYYY'),'F','Feminino'
,'Agente de Atendimento ao Cliente',4280.00,'anajulia@hotmail.com','A',TO_DATE('02/11/2022','DD/MM/YYYY'),NULL);

INSERT INTO MC_FUNCIONARIO VALUES
(DEFAULT,2,NULL,'EDUARDO PASQUALETTI',TO_DATE('09/09/1995','DD/MM/YYYY'),'M','Masculino'
,'Diretor Financeiro',9820.90,'eduardopasqualetti@gmail.com','A',TO_DATE('02/11/2017','DD/MM/YYYY'),NULL);

INSERT INTO MC_FUNCIONARIO VALUES
(DEFAULT,2,NULL,'LUCCA MENDES COSTA',TO_DATE('28/08/2001','DD/MM/YYYY'),'M','Masculino'
,'Analista Financeiro',5200.00,'luccamendes@gmail.com','A',TO_DATE('15/01/2020','DD/MM/YYYY'),NULL);

INSERT INTO MC_FUNCIONARIO VALUES
(DEFAULT,2,NULL,'ROSANA CRISTINA BROIO',TO_DATE('04/12/1998','DD/MM/YYYY'),'F','Feminino'
,'Analista de Custos',4900.50,'rosanabroio@live.com','A',TO_DATE('11/05/2018','DD/MM/YYYY'),NULL);



-- Resposta do Comando SQL item c)
INSERT INTO MC_ESTADO VALUES
('SP','S�o Paulo');

INSERT INTO MC_ESTADO VALUES
('RJ','Rio de Janeiro');

--INSERIR 2 CIDADES PARA CADA ESTADO
INSERT INTO MC_CIDADE VALUES
(DEFAULT,'SP','Santo Andr�',3547809,011);

INSERT INTO MC_CIDADE VALUES
(DEFAULT,'SP','S�o Caetano do Sul',3548807,011);

INSERT INTO MC_CIDADE VALUES
(DEFAULT,'RJ','Arraial do Cabo',3300258,022);       

INSERT INTO MC_CIDADE VALUES
(DEFAULT,'RJ','Maca�',3302403,022);

-- INSERIR 1 BAIRRO PARA CADA CIDADE
INSERT INTO MC_BAIRRO VALUES
(DEFAULT,1,'Vila Palmares','Zona Sul');

INSERT INTO MC_BAIRRO VALUES
(DEFAULT,2,'Santa Maria','Zona Norte');

INSERT INTO MC_BAIRRO VALUES
(DEFAULT,3,'Praia dos Anjos','Zona leste');

INSERT INTO MC_BAIRRO VALUES
(DEFAULT,4,'Barra de Maca�','Zona Sul');

-- INSERIR 2 ENDERECOS PARA CADA BAIRRO
INSERT INTO MC_LOGRADOURO VALUES
(DEFAULT,1,'Rua S�o Gabriel',09061360);

INSERT INTO MC_LOGRADOURO VALUES
(DEFAULT,1,'Rua Olinda',09061340);

INSERT INTO MC_LOGRADOURO VALUES
(DEFAULT,2,'Rua Xingu',09560550);

INSERT INTO MC_LOGRADOURO VALUES
(DEFAULT,2,'Rua Tibagi',09560400);

INSERT INTO MC_LOGRADOURO VALUES
(DEFAULT,3,'Alameda Alcides',28930000);

INSERT INTO MC_LOGRADOURO VALUES
(DEFAULT,3,'Alameda Juarez Silva',24230580);

INSERT INTO MC_LOGRADOURO VALUES
(DEFAULT,4,'Rua Gavi�o Peixoto',24230101);

INSERT INTO MC_LOGRADOURO VALUES
(DEFAULT,4,'Alameda Jo�o Batista',24230330);



--  Resposta do Comando SQL item d)
INSERT INTO MC_END_FUNC VALUES 
(4,1,238,'Rua S�o Gabriel, 238 - Vila Palmares',TO_DATE('10/10/2020','DD/MM/YYYY'),NULL,'A');

INSERT INTO MC_END_FUNC VALUES
(1,5,1641,'Alameda Alcides, 1641 - Praia dos Anjos',TO_DATE('01/11/2018','DD/MM/YYYY'),NULL,'A');



-- Resposta do Comando SQL item e)
-- INSERIR 2 CLIENTE PESSOA FISICA E 1 PESSOA JURIDICA
INSERT INTO MC_CLIENTE VALUES
(DEFAULT,'Gustavo Pasqualetti',5,100,'A','gustavopasqualetti@gmail.com',11947134860,'GustavoPasqualetti','gu123');

INSERT INTO MC_CLIENTE VALUES
(DEFAULT,'Luis Gustavo Costa',4,70.3,'A','luisgustavo@gmail.com',11950395472,'Luisz','luis123');

INSERT INTO MC_CLIENTE VALUES
(DEFAULT,'Clor Multimarcas',5,340,'A','clormultimarcas@gmail.com',11983109872,'clorMultimarcas','clor123');

-- INSERIR OS DOIS CLIENTES PESSOA FISICA
INSERT INTO MC_CLI_FISICA VALUES
(1,TO_DATE('05/07/2002','DD/MM/YYYY'),'M','Masculino',49802006843);

INSERT INTO MC_CLI_FISICA VALUES
(2,TO_DATE('25/08/1999','DD/MM/YYYY'),'M','Masculino',41022267890);

-- INSERIR UM CLIENTE PESSOA JURIDICA
INSERT INTO MC_CLI_JURIDICA VALUES
(3,TO_DATE('01/12/2010','DD/MM/YYYY'),21282926000197,883266074009);

-- ASSOCIAR UM ENDERECO PARA CADA CLIENTE
INSERT INTO MC_END_CLI VALUES
(1,2,87,'Rua Olinda, 87 - Vila Palmares',TO_DATE('23/10/2015','DD/MM/YYYY'),NULL,'A');
INSERT INTO MC_END_CLI VALUES
(2,4,901,'Rua Tibagi, 901 - Santa Maria',TO_DATE('03/03/2020','DD/MM/YYYY'),NULL,'A');
INSERT INTO MC_END_CLI VALUES
(3,8,222,'Alameda Jo�o Batista, 222 - Barra de Maca�',TO_DATE('19/06/2018','DD/MM/YYYY'),NULL,'A');



-- Resposta do Comando SQL item f)       
INSERT INTO MC_CLIENTE VALUES
(DEFAULT,'Gustavo Pasqualetti',5,100,'A','gustavopasqualetti@gmail.com',11947134860,'GustavoPasqualetti','gu123');
-- NAO FOI POSSIVEL INSERIR OS DADOS, POIS FOI VIOLADA UMA RESTRICAO EXCLUSIVA, UMA CONSTRAINT UNIQUE PARA O NM_LOGIN
-- QUE DEVEM SER UNICO PARA CADA CLIENTE, IMPOSSIBILANDO MAIS DE UM IGUAL.



-- Resposta do Comando SQL item g)
INSERT INTO MC_CATEGORIA_PROD VALUES
(DEFAULT,'A','Eletr�nicos',TO_DATE('02/02/2024','DD/MM/YYYY'),NULL,'A');

INSERT INTO MC_CATEGORIA_PROD VALUES
(DEFAULT,'B','Esporte e Lazer',TO_DATE('18/08/2023','DD/MM/YYYY'),NULL,'A');

INSERT INTO MC_CATEGORIA_PROD VALUES
(DEFAULT,'A','Pet Shop',TO_DATE('11/12/2023','DD/MM/YYYY'),NULL,'A');



-- Resposta do Comando SQL item h)
INSERT INTO MC_PRODUTO VALUES
(DEFAULT,1,7391740927145,'Smartwatch',259.99,'Papel�o','A',89.99,
'Smartwatch de ultima gerac�o e o mais completo, Simplifique sua vida e eleve seu estilo');

INSERT INTO MC_PRODUTO VALUES
(DEFAULT,1,9184019481473,'Fones de Ouvido Bluetooth',189.99,'Papel�o','A',79.99,
'Fones de Ouvido Bluetooth com �udio de alta qualidade, design elegante e ergon�mico');

INSERT INTO MC_PRODUTO VALUES
(DEFAULT,2,5134879076512,'Raquetes de t�nis',329.99,'Tecido','A',99.99,
'Raquete de t�nis com uma pot�ncia explosiva, conforto aprimorado e durabilidade superior');

INSERT INTO MC_PRODUTO VALUES
(DEFAULT,2,0914876109351,'Patins',219.99,'Pl�stico','A',79.99,
'Patins projetados para proporcionar uma experi�ncia de patina��o excepcional, combinando estilo e conforto');

INSERT INTO MC_PRODUTO VALUES
(DEFAULT,3,1098314560193,'Coleiras Antipulgas',109.99,'Pl�stico','A',39.99,
'Coleira premium para c�es e gatos, materiais de alta qualidade, constru��o dur�vel e segura');



-- Resposta do Comando SQL item i)
INSERT INTO MC_CATEGORIA_PROD VALUES
(DEFAULT,'A','Instala��o do produto',TO_DATE('25/03/2024','DD/MM/YYYY'),NULL,'A');

INSERT INTO MC_CATEGORIA_PROD VALUES
(DEFAULT,'A','Uso no cotidiano',TO_DATE('25/03/2024','DD/MM/YYYY'),NULL,'A');



-- Resposta do Comando SQL item j)
INSERT INTO MC_SGV_PRODUTO_VIDEO VALUES
(2,DEFAULT,4,NULL,'Instalar',NULL,'A');

INSERT INTO MC_SGV_PRODUTO_VIDEO VALUES
(2,DEFAULT,5,NULL,'Uso',NULL,'A');



-- Resposta do Comando SQL item k)
INSERT INTO MC_SGV_VISUALIZACAO_VIDEO VALUES
(DEFAULT,1,2,1,TO_DATE('19-03-2024', 'DD-MM-YYYY'),13,35,56);

INSERT INTO MC_SGV_VISUALIZACAO_VIDEO VALUES
(DEFAULT,2,2,2,TO_DATE('11-11-2023', 'DD-MM-YYYY'),20,15,09);



-- Resposta do Comando SQL item i)
-- CONFIRMADO TODAS AS TRANSI��ES


-- Resposta do Comando SQL item m)
-- SELECIONAR UM FUNCIONARIO, MUDAR SEU CARGO E AUMENTAR O SALARIO EM 12%
UPDATE MC_FUNCIONARIO 
SET VL_SALARIO = VL_SALARIO * 1.12,
    DS_CARGO = 'Representante de Atendimento ao Cliente'
WHERE CD_FUNCIONARIO = 1;



-- Resposta do Comando SQL item n)
-- ATUALIZAR O NOME DE UM DEPARTAMENTO, FILTRANDO O NOME
UPDATE MC_DEPTO
SET NM_DEPTO = 'RECURSOS HUMANOS'
WHERE NM_DEPTO = 'COMERCIAL';



-- Resposta do Comando SQL item o)
-- ATUALIZE A DATA DE NASCIMENTO DE UM CLIENTE PARA 18/05/2002
UPDATE MC_CLI_FISICA
SET DT_NASCIMENTO= TO_DATE('18/05/2002','DD/MM/YYYY')
WHERE NR_CLIENTE = 1;



-- Resposta do Comando SQL item p)
-- COLOCAR UM FUNCIONARIO COMO INATIVO E COLOCANDO DATA DE DESLIGAMENTO PARA HOJE
UPDATE MC_FUNCIONARIO
SET ST_FUNC = 'I',
    DT_DESLIGAMENTO = TO_DATE(SYSDATE,'DD/MM/YYYY')
WHERE CD_FUNCIONARIO = 6;



-- Resposta do Comando SQL item q)
-- SELECIONAR UM ENDERECO DE CLIENTE E COLOCAR INATIVO E PREENCHER DATA TERMINO
SELECT * FROM MC_END_CLI;
UPDATE MC_END_CLI
SET ST_END = 'I',
    DT_TERMINO = TO_DATE('20/03/2024','DD/MM/YYYY')
WHERE NR_CLIENTE = 3;



-- Resposta do Comando SQL item r)
-- EXCLUIR UM ESTADO QUE TENHA UMA CIDADE CADASTRADA
DELETE MC_ESTADO
WHERE SG_ESTADO = 'RJ';
-- N�O FOI POSSIVEL, PELO FATO DE O ESTADO RJ POSSUIR REGISTRO DE FILHOS LOCALIZADOS, TABELAS QUE UTILIZAM COMO FOREIGN
-- KEY A SG_ESTADO DA TABELA MC_ESTADO



-- Resposta do Comando SQL item s)
-- ATUALIZAR O STATUS DE UM PRODUTO PARA X
UPDATE MC_PRODUTO
SET ST_PRODUTO = 'X'
WHERE CD_PRODUTO = 3;
-- NAO FOI POSSIVEL, DEVIDO A RESTRI��O DE VERIFICA��O, A CONSTRAINT DE CHECK DO ST_PRODUTO FOI VIOLADA, SENDO ASSIM
-- IMPOSSIVEL DE FAZER ESSA ALTERA��O



-- Resposta do Comando SQL item t)
-- TODAS AS TRANSA��ES FORAM CONFIRMADAS COM SUCESSO
