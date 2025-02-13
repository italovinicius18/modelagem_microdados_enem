--Para a tabela REDACAO que implementa uma regra de negócio mais robusta.
--Neste exemplo, vamos supor que a soma das notas dos componentes (NU_NOTA_COMP1 a NU_NOTA_COMP5) não pode ultrapassar 100 pontos e,
--além disso, que a nota final da redação (NU_NOTA_REDACAO) deve estar próxima (por exemplo, dentro de 10 pontos) da soma dos componentes,
--caso contrário, a inserção/atualização será abortada.


CREATE OR REPLACE FUNCTION fbd.fn_validar_redacao()
RETURNS trigger AS $$
DECLARE
    v_total INT;
BEGIN
    -- Calcula a soma dos componentes (usando COALESCE para tratar valores nulos)
    v_total := COALESCE(NEW.NU_NOTA_COMP1, 0)
             + COALESCE(NEW.NU_NOTA_COMP2, 0)
             + COALESCE(NEW.NU_NOTA_COMP3, 0)
             + COALESCE(NEW.NU_NOTA_COMP4, 0)
             + COALESCE(NEW.NU_NOTA_COMP5, 0);
    
    -- Regra 1: a soma dos componentes não deve ultrapassar 100 pontos
    IF v_total > 100 THEN
        RAISE EXCEPTION 'A soma das notas dos componentes (%.2f) ultrapassa o limite permitido de 100 pontos', v_total;
    END IF;
    
    -- Regra 2: se a nota final não estiver informada, pode ser definida automaticamente como a soma dos componentes
    IF NEW.NU_NOTA_REDACAO IS NULL THEN
        NEW.NU_NOTA_REDACAO := v_total;
    ELSE
        -- Se estiver informada, ela deve estar próxima (por exemplo, dentro de 10 pontos) da soma dos componentes
        IF ABS(NEW.NU_NOTA_REDACAO - v_total) > 10 THEN
            RAISE EXCEPTION 'A nota final da redação (%.2f) difere significativamente da soma dos componentes (%.2f)', NEW.NU_NOTA_REDACAO, v_total;
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_validar_redacao
BEFORE INSERT OR UPDATE ON fbd.REDACAO
FOR EACH ROW
EXECUTE FUNCTION fbd.fn_validar_redacao();
