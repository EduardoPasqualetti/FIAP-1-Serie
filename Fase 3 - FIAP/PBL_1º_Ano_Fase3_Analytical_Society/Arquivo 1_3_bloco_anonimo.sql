SET SERVEROUTPUT ON;

DECLARE 
    CURSOR sgv_cursor is
        SELECT SAC.nr_sac NR_SAC, SAC.dt_abertura_sac DT_ABERTURA_SAC, SAC.hr_abertura_sac HR_ABERTURA_SAC,
        SAC.tp_sac TIPO_SAC, PROD.cd_produto CD_PRODUTO, PROD.ds_produto NM_PRODUTO, PROD.vl_unitario VL_PRODUTO,
        PROD.vl_perc_lucro PERCENTUAL_LUCRO, CLI.nr_cliente NR_CLIENTE , CLI.nm_cliente NM_CLIENTE
        FROM 
            MC_SGV_SAC SAC
        JOIN 
            MC_PRODUTO PROD ON SAC.cd_produto = PROD.cd_produto
        JOIN 
            MC_CLIENTE CLI ON SAC.nr_cliente = CLI.nr_cliente;
            
    
    ocorrencia_sac MC_SGV_OCORRENCIA_SAC%rowtype;
    v_vl_icms_produto NUMBER(10,2);
    
BEGIN
    FOR sac_info in sgv_cursor LOOP
    
        ocorrencia_sac.NR_OCORRENCIA_SAC := sac_info.NR_SAC;
        ocorrencia_sac.DT_ABERTURA_SAC := sac_info.DT_ABERTURA_SAC;
        ocorrencia_sac.HR_ABERTURA_SAC := sac_info.HR_ABERTURA_SAC;
        ocorrencia_sac.CD_PRODUTO := sac_info.CD_PRODUTO;
        ocorrencia_sac.DS_PRODUTO := sac_info.NM_PRODUTO;
        ocorrencia_sac.VL_UNITARIO_PRODUTO := sac_info.VL_PRODUTO;
        ocorrencia_sac.VL_PERC_LUCRO := sac_info.PERCENTUAL_LUCRO;
        ocorrencia_sac.NR_CLIENTE := sac_info.NR_CLIENTE;
        ocorrencia_sac.NM_CLIENTE := sac_info.NM_CLIENTE;
        
        
        CASE sac_info.TIPO_SAC
            WHEN 'S' THEN ocorrencia_sac.DS_TIPO_CLASSIFICACAO_SAC := 'SUGESTÃO';
            WHEN 'D' THEN ocorrencia_sac.DS_TIPO_CLASSIFICACAO_SAC := 'DÚVIDA';
            WHEN 'E' THEN ocorrencia_sac.DS_TIPO_CLASSIFICACAO_SAC := 'ELOGIO';
            ELSE ocorrencia_sac.DS_TIPO_CLASSIFICACAO_SAC := 'CLASSIFICAÇÃO INVÁLIDA';
        END CASE;
        
        
        ocorrencia_sac.VL_UNITARIO_LUCRO_PRODUTO := (sac_info.PERCENTUAL_LUCRO / 100) * sac_info.VL_PRODUTO;


        SELECT est.sg_estado, est.nm_estado INTO ocorrencia_sac.SG_ESTADO, ocorrencia_sac.NM_ESTADO
        FROM 
            MC_END_CLI ENDCLI 
        JOIN
            MC_LOGRADOURO LOGR ON ENDCLI.cd_logradouro_cli = LOGR.cd_logradouro
        JOIN
            MC_BAIRRO BAI ON LOGR.cd_bairro = BAI.cd_bairro
        JOIN
            MC_CIDADE CID ON BAI.cd_cidade = CID.cd_cidade
        JOIN
            MC_ESTADO EST ON CID.sg_estado = EST.sg_estado
        WHERE nr_cliente = sac_info.NR_CLIENTE;
        
        SELECT fun_mc_gera_aliquota_media_icms_estado(ocorrencia_sac.SG_ESTADO) INTO v_vl_icms_produto FROM dual;
        ocorrencia_sac.VL_ICMS_PRODUTO := (v_vl_icms_produto / 100) * sac_info.VL_PRODUTO;

        dbms_output.put_line('Número da ocorrência do SAC: ' || ocorrencia_sac.NR_OCORRENCIA_SAC);
        dbms_output.put_line('Data de abertura do SAC: ' || ocorrencia_sac.DT_ABERTURA_SAC);
        dbms_output.put_line('Hora de abertura do SAC: ' || ocorrencia_sac.HR_ABERTURA_SAC);
        dbms_output.put_line('Tipo do SAC: ' || ocorrencia_sac.DS_TIPO_CLASSIFICACAO_SAC);
        dbms_output.put_line('Código do produto: ' || ocorrencia_sac.CD_PRODUTO);
        dbms_output.put_line('Nome do produto: ' || ocorrencia_sac.DS_PRODUTO);
        dbms_output.put_line('Valor unitário do produto: R$' || ocorrencia_sac.VL_UNITARIO_PRODUTO);
        dbms_output.put_line('Percentual do lucro unitário do produto: R$' || ocorrencia_sac.VL_PERC_LUCRO);
        dbms_output.put_line('Valor unitário do lucro do produto: R$' || ocorrencia_sac.VL_UNITARIO_LUCRO_PRODUTO);
        dbms_output.put_line('Estado: ' || ocorrencia_sac.NM_ESTADO || ' - ' || ocorrencia_sac.SG_ESTADO);
        dbms_output.put_line('Número do Cliente: ' || ocorrencia_sac.NR_CLIENTE);
        dbms_output.put_line('Nome do Cliente: ' || ocorrencia_sac.NM_CLIENTE);
        dbms_output.put_line('Valor do ICMS do produto: R$' || ocorrencia_sac.VL_ICMS_PRODUTO);
        dbms_output.put_line('');
        dbms_output.put_line('');
        
    END LOOP;
    
    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Deu Erro: ' || SQLERRM);
        ROLLBACK;
END;