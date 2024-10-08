INSERT INTO MC_SGV_SAC(NR_SAC, NR_CLIENTE, CD_PRODUTO, CD_FUNCIONARIO, DS_DETALHADA_SAC, DT_ABERTURA_SAC,
HR_ABERTURA_SAC, TP_SAC, ST_SAC)
VALUES (SQ_MC_SGV_SAC.NEXTVAL, 7, 3, 23, 'Cliente sugeriu uma melhora na organiza��o das pe�as',
TO_DATE('10/05/2024','DD/MM/YYYY'), 20, 'S', 'A');

UPDATE MC_SGV_SAC  SET DS_DETALHADA_RETORNO_SAC = '',
DT_ATENDIMENTO = TO_DATE('11/04/2024','DD/MM/YYYY'), HR_ATENDIMENTO_SAC = 14, NR_TEMPO_TOTAL_SAC = 1
WHERE NR_SAC = 2;




INSERT INTO MC_SGV_SAC(NR_SAC, NR_CLIENTE, CD_PRODUTO, CD_FUNCIONARIO, DS_DETALHADA_SAC, DT_ABERTURA_SAC,
HR_ABERTURA_SAC, TP_SAC, ST_SAC)
VALUES (SQ_MC_SGV_SAC.NEXTVAL, 10, 20, 16, 'Cliente com problemas para abrir servi�os de streaming',
TO_DATE('28/04/2024','DD/MM/YYYY'), 11, 'D', 'A');

UPDATE MC_SGV_SAC  SET DS_DETALHADA_RETORNO_SAC = 'Auxiliamos o cliente e apresentamos alguns videos ja feitos pela empresa',
DT_ATENDIMENTO = TO_DATE('29/04/2024','DD/MM/YYYY'), HR_ATENDIMENTO_SAC = 10, NR_TEMPO_TOTAL_SAC = 2
WHERE NR_SAC = 3;




INSERT INTO MC_SGV_SAC(NR_SAC, NR_CLIENTE, CD_PRODUTO, CD_FUNCIONARIO, DS_DETALHADA_SAC, DT_ABERTURA_SAC,
HR_ABERTURA_SAC, TP_SAC, ST_SAC)
VALUES (SQ_MC_SGV_SAC.NEXTVAL, 2, 2, 11, 'Cliente concluiu que o fone tem uma otima qualidade e durabilidade',
TO_DATE('13/05/2024','DD/MM/YYYY'), 09, 'E', 'A');

UPDATE MC_SGV_SAC  SET DS_DETALHADA_RETORNO_SAC = 'Agradecemos pela sugest�o, por�m a empresa j� acha bem organizado',
DT_ATENDIMENTO = TO_DATE('14/04/2024','DD/MM/YYYY'), HR_ATENDIMENTO_SAC = 8, NR_TEMPO_TOTAL_SAC = 1
WHERE NR_SAC = 4;