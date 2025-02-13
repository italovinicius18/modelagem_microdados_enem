--Uma view que reúne informações de candidato, escola e resultado
--Por exemplo, exibindo os dados do candidato, o nome do município da escola e as notas do exame

CREATE OR REPLACE VIEW fbd.vw_candidato_detalhe AS
SELECT 
    c.nu_inscricao,
    c.tp_faixa_etaria,
    c.tp_sexo,
    c.tp_estado_civil,
    c.tp_cor_raca,
    c.tp_nacionalidade,
    c.in_treineiro,
    esc.co_escola,
    m.no_municipio AS escola_municipio,
    r.nu_nota_cn,
    r.nu_nota_ch,
    r.nu_nota_lc,
    r.nu_nota_mt,
    r.nu_nota_redacao
FROM fbd.candidato c
LEFT JOIN fbd.escola esc ON c.co_escola = esc.co_escola
LEFT JOIN fbd.municipio m ON esc.co_municipio = m.co_municipio
LEFT JOIN fbd.resultado r ON c.co_prova = r.co_prova;


select *
from fbd.vw_candidato_detalhe;