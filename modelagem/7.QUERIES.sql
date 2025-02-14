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


--Esta consulta gera, para cada escola, o ranking dos candidatos com base
--na média das notas (calculada a partir dos componentes do exame).

WITH media_por_candidato AS (
  SELECT 
    c.nu_inscricao,
    c.co_escola,
    (r.nu_nota_cn + r.nu_nota_ch + r.nu_nota_lc + r.nu_nota_mt + r.nu_nota_redacao) / 5.0 AS media_notas
  FROM fbd.candidato c
  JOIN fbd.resultado r ON c.nu_inscricao = r.nu_inscricao
  WHERE (r.nu_nota_cn + r.nu_nota_ch + r.nu_nota_lc + r.nu_nota_mt + r.nu_nota_redacao) IS NOT NULL
),
ranking_por_escola AS (
  SELECT 
    nu_inscricao,
    co_escola,
    media_notas,
    RANK() OVER (PARTITION BY co_escola ORDER BY media_notas DESC) AS rank_escola
  FROM media_por_candidato
)
SELECT 
  co_escola,
  nu_inscricao,
  media_notas,
  rank_escola
FROM ranking_por_escola
ORDER BY co_escola, rank_escola;


--Esta consulta apresenta, para cada estado, o total de candidatos, a média e o desvio padrão da média dos exames,
--além de identificar o candidato com a melhor média em cada estado.

WITH candidato_notas AS (
  SELECT 
    e.sg_uf,
    c.nu_inscricao,
    (r.nu_nota_cn + r.nu_nota_ch + r.nu_nota_lc + r.nu_nota_mt + r.nu_nota_redacao) / 5.0 AS media_notas
  FROM fbd.candidato c
  JOIN fbd.resultado r ON c.nu_inscricao = r.nu_inscricao
  JOIN fbd.escola esc ON c.co_escola = esc.co_escola
  JOIN fbd.municipio m ON esc.co_municipio = m.co_municipio
  JOIN fbd.estado e ON m.co_uf = e.co_uf
),
melhor_candidato AS (
  SELECT 
    sg_uf,
    nu_inscricao,
    media_notas,
    RANK() OVER (PARTITION BY sg_uf ORDER BY media_notas DESC) AS rank_estado
  FROM candidato_notas
)
SELECT 
  cn.sg_uf,
  COUNT(*) AS total_candidatos,
  AVG(cn.media_notas) AS media_estado,
  STDDEV(cn.media_notas) AS desvio_estado,
  (SELECT nu_inscricao 
     FROM melhor_candidato mc 
     WHERE mc.sg_uf = cn.sg_uf AND mc.rank_estado = 1
     LIMIT 1) AS candidato_melhor
FROM candidato_notas cn
GROUP BY cn.sg_uf
ORDER BY cn.sg_uf;

--Esta consulta agrega todas as respostas de um candidato em um objeto JSON,
--onde cada chave é o código da pergunta e o valor é a opção escolhida.

SELECT 
  q.nu_inscricao,
  json_object_agg(p.codigo::TEXT, r.opcao) AS respostas_json
FROM fbd.questionario q
JOIN fbd.perguntas p ON q.co_pergunta = p.co_pergunta
JOIN fbd.respostas r ON q.co_resposta = r.co_resposta
GROUP BY q.nu_inscricao
ORDER BY q.nu_inscricao;



