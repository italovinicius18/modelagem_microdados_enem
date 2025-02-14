-- Esta view exibe, para cada candidato, seu número de inscrição, sexo, descrição da faixa etária,
-- o município e a sigla do estado da escola, juntamente com a média das notas do exame calculada
-- a partir dos cinco componentes, ordenando os candidatos em ordem decrescente de média.

CREATE OR REPLACE VIEW fbd.vw_candidato_media AS
WITH cte_media AS (
  SELECT 
      c.nu_inscricao,
      c.tp_sexo,
      f_e.descricao,
      m.no_municipio,
      e.sg_uf,
      ((r.nu_nota_cn + r.nu_nota_ch + r.nu_nota_lc + r.nu_nota_mt + r.nu_nota_redacao) / 5.0) AS media
  FROM fbd.candidato c
  JOIN fbd.resultado r ON c.nu_inscricao = r.nu_inscricao
  JOIN fbd.escola esc ON c.co_escola = esc.co_escola
  JOIN fbd.municipio m ON esc.co_municipio = m.co_municipio
  JOIN fbd.estado e ON m.co_uf = e.co_uf
  JOIN fbd.faixa_etaria f_e ON c.tp_faixa_etaria = f_e.nivel
)
SELECT *
FROM cte_media
WHERE media IS NOT NULL
ORDER BY media DESC;


select *
from fbd.vw_candidato_media;