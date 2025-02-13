SET search_path TO fbd;

-----------------------------------------------------
-- 1. FAIXA_ETARIA (para TP_FAIXA_ETARIA)
-----------------------------------------------------
INSERT INTO FAIXA_ETARIA (NIVEL, DESCRICAO) VALUES
  (1,  'Menor de 17 anos'),
  (2,  '17 anos'),
  (3,  '18 anos'),
  (4,  '19 anos'),
  (5,  '20 anos'),
  (6,  '21 anos'),
  (7,  '22 anos'),
  (8,  '23 anos'),
  (9,  '24 anos'),
  (10, '25 anos'),
  (11, 'Entre 26 e 30 anos'),
  (12, 'Entre 31 e 35 anos'),
  (13, 'Entre 36 e 40 anos'),
  (14, 'Entre 41 e 45 anos'),
  (15, 'Entre 46 e 50 anos'),
  (16, 'Entre 51 e 55 anos'),
  (17, 'Entre 56 e 60 anos'),
  (18, 'Entre 61 e 65 anos'),
  (19, 'Entre 66 e 70 anos'),
  (20, 'Maior de 70 anos');

-----------------------------------------------------
-- 2. DEP_ADM (para TP_DEPENDENCIA_ADM_ESC)
-----------------------------------------------------
INSERT INTO DEP_ADM (NIVEL, DESCRICAO) VALUES
  (1, 'Federal'),
  (2, 'Estadual'),
  (3, 'Municipal'),
  (4, 'Privada');

-----------------------------------------------------
-- 3. SIT_FUNC (para TP_SIT_FUNC_ESC)
-----------------------------------------------------
INSERT INTO SIT_FUNC (NIVEL, DESCRICAO) VALUES
  (1, 'Em atividade'),
  (2, 'Paralisada'),
  (3, 'Extinta'),
  (4, 'Escola extinta em anos anteriores');

-----------------------------------------------------
-- 4. ESTADO_CIVIL (para TP_ESTADO_CIVIL)
-----------------------------------------------------
INSERT INTO ESTADO_CIVIL (NIVEL, DESCRICAO) VALUES
  (0, 'Não informado'),
  (1, 'Solteiro(a)'),
  (2, 'Casado(a)/Mora com um(a) companheiro(a)'),
  (3, 'Divorciado(a)/Desquitado(a)/Separado(a)'),
  (4, 'Viúvo(a)');

-----------------------------------------------------
-- 5. COR_RACA (para TP_COR_RACA)
-----------------------------------------------------
INSERT INTO COR_RACA (NIVEL, DESCRICAO) VALUES
  (0, 'Não declarado'),
  (1, 'Branca'),
  (2, 'Preta'),
  (3, 'Parda'),
  (4, 'Amarela'),
  (5, 'Indígena'),
  (6, 'Não dispõe da informação');

-----------------------------------------------------
-- 6. NACIONALIDADE (para TP_NACIONALIDADE)
-----------------------------------------------------
INSERT INTO NACIONALIDADE (NIVEL, DESCRICAO) VALUES
  (0, 'Não informado'),
  (1, 'Brasileiro(a)'),
  (2, 'Brasileiro(a) Naturalizado(a)'),
  (3, 'Estrangeiro(a)'),
  (4, 'Brasileiro(a) Nato(a), nascido(a) no exterior');

-----------------------------------------------------
-- 7. SIT_CONCLUSAO (para TP_ST_CONCLUSAO)
-----------------------------------------------------
INSERT INTO SIT_CONCLUSAO (NIVEL, DESCRICAO) VALUES
  (1, 'Já concluí o Ensino Médio'),
  (2, 'Estou cursando e concluirei o Ensino Médio em 2023'),
  (3, 'Estou cursando e concluirei o Ensino Médio após 2023'),
  (4, 'Não concluí e não estou cursando o Ensino Médio');

-----------------------------------------------------
-- 8. ANO_CONCLUSAO (para TP_ANO_CONCLUIU)
-----------------------------------------------------
INSERT INTO ANO_CONCLUSAO (NIVEL, DESCRICAO) VALUES
  (0, 'Não informado'),
  (1, '2022'),
  (2, '2021'),
  (3, '2020'),
  (4, '2019'),
  (5, '2018'),
  (6, '2017'),
  (7, '2016'),
  (8, '2015'),
  (9, '2014'),
  (10, '2013'),
  (11, '2012'),
  (12, '2011'),
  (13, '2010'),
  (14, '2009'),
  (15, '2008'),
  (16, '2007'),
  (17, 'Anterior a 2007');

-----------------------------------------------------
-- 9. TP_ESCOLA (para TP_ESCOLA)
-----------------------------------------------------
INSERT INTO TP_ESCOLA (NIVEL, DESCRICAO) VALUES
  (1, 'Não respondeu'),
  (2, 'Pública'),
  (3, 'Privada');

-----------------------------------------------------
-- 10. TP_PRESENCA (para TP_PRESENCA – usado para CN, CH, LC e MT)
-----------------------------------------------------
INSERT INTO TP_PRESENCA (NIVEL, DESCRICAO) VALUES
  (0, 'Faltou à prova'),
  (1, 'Presente na prova'),
  (2, 'Eliminado na prova');

-----------------------------------------------------
-- 11. STATUS (para TP_STATUS_REDACAO)
-----------------------------------------------------
INSERT INTO STATUS (NIVEL, DESCRICAO) VALUES
  (1, 'Sem problemas'),
  (2, 'Anulada'),
  (3, 'Cópia Texto Motivador'),
  (4, 'Em Branco'),
  (5, 'Fere Direitos Humanos'),
  (6, 'Fuga ao tema'),
  (7, 'Não atendimento ao tipo'),
  (8, 'Texto insuficiente'),
  (9, 'Parte desconectada');



-----------------------------------------------------
-- Inserção das Perguntas
-----------------------------------------------------

-- Q001
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(1, 'Até que série seu pai, ou o homem responsável por você, estudou?');

-- Q002
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(2, 'Até que série sua mãe, ou a mulher responsável por você, estudou?');

-- Q003
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(3, 'A partir da apresentação de algumas ocupações divididas em grupos ordenados, indique o grupo que contempla a ocupação mais próxima da ocupação do seu pai ou do homem responsável por você. (Se ele não estiver trabalhando, escolha uma ocupação pensando no último trabalho dele).');

-- Q004
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(4, 'A partir da apresentação de algumas ocupações divididas em grupos ordenados, indique o grupo que contempla a ocupação mais próxima da ocupação da sua mãe ou da mulher responsável por você. (Se ela não estiver trabalhando, escolha uma ocupação pensando no último trabalho dela).');

-- Q005
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(5, 'Incluindo você, quantas pessoas moram atualmente em sua residência?');

-- Q006
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(6, 'Qual é a renda mensal de sua família? (Some a sua renda com a dos seus familiares.)');

-- Q007
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(7, 'Em sua residência trabalha empregado(a) doméstico(a)?');

-- Q008
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(8, 'Na sua residência tem banheiro?');

-- Q009
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(9, 'Na sua residência tem quartos para dormir?');

-- Q010
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(10, 'Na sua residência tem carro?');

-- Q011
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(11, 'Na sua residência tem motocicleta?');

-- Q012
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(12, 'Na sua residência tem geladeira?');

-- Q013
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(13, 'Na sua residência tem freezer (independente ou segunda porta da geladeira)?');

-- Q014
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(14, 'Na sua residência tem máquina de lavar roupa? (o tanquinho NÃO deve ser considerado)');

-- Q015
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(15, 'Na sua residência tem máquina de secar roupa (independente ou em conjunto com a máquina de lavar roupa)?');

-- Q016
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(16, 'Na sua residência tem forno micro-ondas?');

-- Q017
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(17, 'Na sua residência tem máquina de lavar louça?');

-- Q018
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(18, 'Na sua residência tem aspirador de pó?');

-- Q019
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(19, 'Na sua residência tem televisão em cores?');

-- Q020
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(20, 'Na sua residência tem aparelho de DVD?');

-- Q021
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(21, 'Na sua residência tem TV por assinatura?');

-- Q022
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(22, 'Na sua residência tem telefone celular?');

-- Q023
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(23, 'Na sua residência tem telefone fixo?');

-- Q024
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(24, 'Na sua residência tem computador?');

-- Q025
INSERT INTO PERGUNTAS (CODIGO, QUESTAO) VALUES 
(25, 'Na sua residência tem acesso à Internet?');

-----------------------------------------------------
-- Inserção das Alternativas (Respostas Possíveis) para cada Pergunta
-----------------------------------------------------

-- Para Q001
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 1), 'A', 'Nunca estudou.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 1), 'B', 'Não completou a 4ª série/5º ano do Ensino Fundamental.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 1), 'C', 'Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do Ensino Fundamental.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 1), 'D', 'Completou a 8ª série/9º ano do Ensino Fundamental, mas não completou o Ensino Médio.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 1), 'E', 'Completou o Ensino Médio, mas não completou a Faculdade.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 1), 'F', 'Completou a Faculdade, mas não completou a Pós-graduação.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 1), 'G', 'Completou a Pós-graduação.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 1), 'H', 'Não sei.');

-- Para Q002 (alternativas idênticas a Q001, mas referentes à mãe)
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 2), 'A', 'Nunca estudou.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 2), 'B', 'Não completou a 4ª série/5º ano do Ensino Fundamental.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 2), 'C', 'Completou a 4ª série/5º ano, mas não completou a 8ª série/9º ano do Ensino Fundamental.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 2), 'D', 'Completou a 8ª série/9º ano do Ensino Fundamental, mas não completou o Ensino Médio.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 2), 'E', 'Completou o Ensino Médio, mas não completou a Faculdade.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 2), 'F', 'Completou a Faculdade, mas não completou a Pós-graduação.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 2), 'G', 'Completou a Pós-graduação.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 2), 'H', 'Não sei.');

-- Para Q003
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 3), 'A', 'Grupo 1: Lavrador, agricultor sem empregados, bóia fria, criador de animais (gado, porcos, galinhas, ovelhas, cavalos etc.), apicultor, pescador, lenhador, seringueiro, extrativista.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 3), 'B', 'Grupo 2: Diarista, empregado doméstico, cuidador de idosos, babá, cozinheiro (em casas particulares), motorista particular, jardineiro, faxineiro de empresas e prédios, vigilante, porteiro, carteiro, office-boy, vendedor, caixa, atendente de loja, auxiliar administrativo, recepcionista, servente de pedreiro, repositor de mercadoria.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 3), 'C', 'Grupo 3: Padeiro, cozinheiro industrial ou em restaurantes, sapateiro, costureiro, joalheiro, torneiro mecânico, operador de máquinas, soldador, operário de fábrica, trabalhador da mineração, pedreiro, pintor, eletricista, encanador, motorista, caminhoneiro, taxista.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 3), 'D', 'Grupo 4: Professor (de ensino fundamental ou médio, idioma, música, artes etc.), técnico (de enfermagem, contabilidade, eletrônica etc.), policial, militar de baixa patente (soldado, cabo, sargento), corretor de imóveis, supervisor, gerente, mestre de obras, pastor, microempresário (proprietário de empresa com menos de 10 empregados), pequeno comerciante, pequeno proprietário de terras, trabalhador autônomo ou por conta própria.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 3), 'E', 'Grupo 5: Médico, engenheiro, dentista, psicólogo, economista, advogado, juiz, promotor, defensor, delegado, tenente, capitão, coronel, professor universitário, diretor em empresas públicas ou privadas, político, proprietário de empresas com mais de 10 empregados.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 3), 'F', 'Não sei.');

-- Para Q004
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 4), 'A', 'Grupo 1: Lavradora, agricultora sem empregados, bóia fria, criadora de animais (gado, porcos, galinhas, ovelhas, cavalos etc.), apicultora, pescadora, lenhadora, seringueira, extrativista.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 4), 'B', 'Grupo 2: Diarista, empregada doméstica, cuidadora de idosos, babá, cozinheira (em casas particulares), motorista particular, jardineira, faxineira de empresas e prédios, vigilante, porteira, carteira, office-boy, vendedora, caixa, atendente de loja, auxiliar administrativa, recepcionista, servente de pedreiro, repositora de mercadoria.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 4), 'C', 'Grupo 3: Padeira, cozinheira industrial ou em restaurantes, sapateira, costureira, joalheira, torneira mecânica, operadora de máquinas, soldadora, operária de fábrica, trabalhadora da mineração, pedreira, pintora, eletricista, encanadora, motorista, caminhoneira, taxista.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 4), 'D', 'Grupo 4: Professora (de ensino fundamental ou médio, idioma, música, artes etc.), técnica (de enfermagem, contabilidade, eletrônica etc.), policial, militar de baixa patente (soldado, cabo, sargento), corretora de imóveis, supervisora, gerente, mestre de obras, pastora, microempresária (proprietária de empresa com menos de 10 empregados), pequena comerciante, pequena proprietária de terras, trabalhadora autônoma ou por conta própria.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 4), 'E', 'Grupo 5: Médica, engenheira, dentista, psicóloga, economista, advogada, juíza, promotora, defensora, delegada, tenente, capitã, coronel, professora universitária, diretora em empresas públicas ou privadas, política, proprietária de empresas com mais de 10 empregados.'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 4), 'F', 'Não sei.');

-- Para Q005: Resposta numérica (1 a 20)
-- Neste caso, as alternativas são os números 1 a 20.
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '1', '1, pois moro sozinho(a).'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '2', '2'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '3', '3'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '4', '4'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '5', '5'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '6', '6'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '7', '7'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '8', '8'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '9', '9'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '10', '10'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '11', '11'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '12', '12'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '13', '13'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '14', '14'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '15', '15'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '16', '16'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '17', '17'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '18', '18'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '19', '19'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 5), '20', '20');

-- Para Q006: Alternativas de renda familiar
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'A', 'Nenhuma Renda'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'B', 'Até R$ 1.320,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'C', 'De R$ 1.320,01 até R$ 1.980,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'D', 'De R$ 1.980,01 até R$ 2.640,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'E', 'De R$ 2.640,01 até R$ 3.300,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'F', 'De R$ 3.300,01 até R$ 3.960,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'G', 'De R$ 3.960,01 até R$ 5.280,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'H', 'De R$ 5.280,01 até R$ 6.600,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'I', 'De R$ 6.600,01 até R$ 7.920,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'J', 'De R$ 7.920,01 até R$ 9240,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'K', 'De R$ 9.240,01 até R$ 10.560,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'L', 'De R$ 10.560,01 até R$ 11.880,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'M', 'De R$ 11.880,01 até R$ 13.200,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'N', 'De R$ 13.200,01 até R$ 15.840,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'O', 'De R$ 15.840,01 até R$19.800,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'P', 'De R$ 19.800,01 até R$ 26.400,00'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 6), 'Q', 'Acima de R$ 26.400,00');

-- Para Q007: Empregado(a) doméstico(a)
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 7), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 7), 'B', 'Sim, um ou dois dias por semana'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 7), 'C', 'Sim, três ou quatro dias por semana'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 7), 'D', 'Sim, pelo menos cinco dias por semana');

-- Para Q008: Banheiro
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 8), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 8), 'B', 'Sim, um'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 8), 'C', 'Sim, dois'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 8), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 8), 'E', 'Sim, quatro ou mais');

-- Para Q009: Quartos para dormir
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 9), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 9), 'B', 'Sim, um'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 9), 'C', 'Sim, dois'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 9), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 9), 'E', 'Sim, quatro ou mais');

-- Para Q010: Carro
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 10), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 10), 'B', 'Sim, um'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 10), 'C', 'Sim, dois'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 10), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 10), 'E', 'Sim, quatro ou mais');

-- Para Q011: Motocicleta
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 11), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 11), 'B', 'Sim, uma'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 11), 'C', 'Sim, duas'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 11), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 11), 'E', 'Sim, quatro ou mais');

-- Para Q012: Geladeira
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 12), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 12), 'B', 'Sim, uma'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 12), 'C', 'Sim, duas'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 12), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 12), 'E', 'Sim, quatro ou mais');

-- Para Q013: Freezer
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 13), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 13), 'B', 'Sim, um'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 13), 'C', 'Sim, dois'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 13), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 13), 'E', 'Sim, quatro ou mais');

-- Para Q014: Máquina de lavar roupa
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 14), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 14), 'B', 'Sim, uma'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 14), 'C', 'Sim, duas'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 14), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 14), 'E', 'Sim, quatro ou mais');

-- Para Q015: Máquina de secar roupa
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 15), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 15), 'B', 'Sim, uma'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 15), 'C', 'Sim, duas'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 15), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 15), 'E', 'Sim, quatro ou mais');

-- Para Q016: Forno micro-ondas
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 16), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 16), 'B', 'Sim, um'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 16), 'C', 'Sim, dois'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 16), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 16), 'E', 'Sim, quatro ou mais');

-- Para Q017: Máquina de lavar louça
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 17), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 17), 'B', 'Sim, uma'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 17), 'C', 'Sim, duas'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 17), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 17), 'E', 'Sim, quatro ou mais');

-- Para Q018: Aspirador de pó
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 18), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 18), 'B', 'Sim');

-- Para Q019: Televisão em cores
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 19), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 19), 'B', 'Sim, uma'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 19), 'C', 'Sim, duas'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 19), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 19), 'E', 'Sim, quatro ou mais');

-- Para Q020: Aparelho de DVD
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 20), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 20), 'B', 'Sim');

-- Para Q021: TV por assinatura
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 21), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 21), 'B', 'Sim');

-- Para Q022: Telefone celular
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 22), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 22), 'B', 'Sim, um'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 22), 'C', 'Sim, dois'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 22), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 22), 'E', 'Sim, quatro ou mais');

-- Para Q023: Telefone fixo
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 23), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 23), 'B', 'Sim');

-- Para Q024: Computador
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 24), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 24), 'B', 'Sim, um'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 24), 'C', 'Sim, dois'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 24), 'D', 'Sim, três'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 24), 'E', 'Sim, quatro ou mais');

-- Para Q025: Acesso à Internet
INSERT INTO RESPOSTAS (CO_PERGUNTA, OPCAO, DESCRICAO) VALUES 
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 25), 'A', 'Não'),
((SELECT CO_PERGUNTA FROM PERGUNTAS WHERE CODIGO = 25), 'B', 'Sim');
