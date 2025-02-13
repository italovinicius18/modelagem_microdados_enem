--Uma procedure que atualiza o status da redação de um candidato com base na nota final da redação.
--Por exemplo, se a nota final estiver abaixo de um limiar, atualiza o status para “2” (podendo representar, por exemplo, “Anulada”):


CREATE OR REPLACE PROCEDURE fbd.sp_atualizar_status_redacao(p_nu_inscricao BIGINT, p_threshold FLOAT8)
LANGUAGE plpgsql
AS $$
DECLARE
    v_nota FLOAT8;
BEGIN
    -- Obter a nota final da redação para o candidato
    SELECT NU_NOTA_REDACAO INTO v_nota
    FROM fbd.REDACAO
    WHERE NU_INSCRICAO = p_nu_inscricao;
    
    IF v_nota IS NULL THEN
        RAISE NOTICE 'Nenhuma redação encontrada para o candidato %', p_nu_inscricao;
    ELSIF v_nota < p_threshold THEN
        UPDATE fbd.REDACAO
        SET TP_STATUS_REDACAO = 2  -- Por exemplo, 2 = "Anulada"
        WHERE NU_INSCRICAO = p_nu_inscricao;
        RAISE NOTICE 'Status da redação atualizado para o candidato %', p_nu_inscricao;
    ELSE
        RAISE NOTICE 'A redação do candidato % apresenta nota adequada', p_nu_inscricao;
    END IF;
END;
$$;
