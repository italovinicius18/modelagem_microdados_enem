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

--Esta consulta agrega os dados da tabela QUESTIONARIO (com junção em PERGUNTAS e RESPOSTAS) para cada questão,
--calculando a contagem e o percentual de cada opção.

WITH respostas_por_questao AS (
  SELECT 
    p.codigo,
    p.questao,
    r.opcao,
    r.descricao,
    COUNT(*) AS qtd_respostas
  FROM fbd.questionario q
  JOIN fbd.perguntas p ON q.co_pergunta = p.co_pergunta
  JOIN fbd.respostas r ON q.co_resposta = r.co_resposta
  GROUP BY p.codigo, p.questao, r.opcao, r.descricao
), total_por_questao AS (
  SELECT codigo, SUM(qtd_respostas) AS total
  FROM respostas_por_questao
  GROUP BY codigo
)
SELECT 
  rpq.questao,
  rpq.descricao,
  rpq.qtd_respostas,
  tpq.total,
  ROUND((rpq.qtd_respostas::numeric / tpq.total::numeric) * 100, 2) AS percentual
FROM respostas_por_questao rpq
JOIN total_por_questao tpq ON rpq.codigo = tpq.codigo
ORDER BY rpq.codigo, rpq.opcao;
