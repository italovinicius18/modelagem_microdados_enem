--Esta consulta calcula, para cada candidato, a média das cinco notas e gera um ranking global (usando uma função janela).

WITH candidato_media AS (
  SELECT 
    c.nu_inscricao,
    (r.nu_nota_cn + r.nu_nota_ch + r.nu_nota_lc + r.nu_nota_mt + r.nu_nota_redacao) / 5 AS media_notas,
    ROW_NUMBER() OVER (ORDER BY (r.nu_nota_cn + r.nu_nota_ch + r.nu_nota_lc + r.nu_nota_mt + r.nu_nota_redacao) / 5 DESC) AS rank_global
  FROM fbd.candidato c
  JOIN fbd.resultado r 
    ON c.nu_inscricao = r.nu_inscricao
  WHERE (r.nu_nota_cn + r.nu_nota_ch + r.nu_nota_lc + r.nu_nota_mt + r.nu_nota_redacao) IS NOT NULL
)
SELECT nu_inscricao, media_notas, rank_global
FROM candidato_media
ORDER BY rank_global;
