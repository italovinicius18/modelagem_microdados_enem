-- Criação do schema (opcional)
DROP SCHEMA IF EXISTS fbd CASCADE;
CREATE SCHEMA fbd;
SET search_path TO fbd;

-----------------------------------------------------
-- Tabela 1: ESTADO
-----------------------------------------------------
DROP TABLE IF EXISTS ESTADO CASCADE;
CREATE TABLE ESTADO (
    CO_UF SERIAL PRIMARY KEY,
    SG_UF CHAR(2) NOT NULL
);

-----------------------------------------------------
-- Tabela 2: MUNICIPIO
-----------------------------------------------------
DROP TABLE IF EXISTS MUNICIPIO CASCADE;
CREATE TABLE MUNICIPIO (
    CO_MUNICIPIO SERIAL PRIMARY KEY,
    NO_MUNICIPIO VARCHAR(100) NOT NULL,
    CO_UF INT NOT NULL,
    FOREIGN KEY (CO_UF) REFERENCES ESTADO(CO_UF)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-----------------------------------------------------
-- Tabela 15: DEP_ADM (Dependência Administrativa da Escola)
-----------------------------------------------------
DROP TABLE IF EXISTS DEP_ADM CASCADE;
CREATE TABLE DEP_ADM (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 16: SIT_FUNC (Situação Funcional da Escola)
-----------------------------------------------------
DROP TABLE IF EXISTS SIT_FUNC CASCADE;
CREATE TABLE SIT_FUNC (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 19: TP_ESCOLA (Tipo de Escola)
-----------------------------------------------------
DROP TABLE IF EXISTS TP_ESCOLA CASCADE;
CREATE TABLE TP_ESCOLA (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 4: ESCOLA
-----------------------------------------------------
DROP TABLE IF EXISTS ESCOLA CASCADE;
CREATE TABLE ESCOLA (
    CO_ESCOLA SERIAL PRIMARY KEY,
    TP_DEPENDENCIA_ADM INT,
    TP_LOCALIZACAO VARCHAR(1) CHECK (TP_LOCALIZACAO IN ('U','R')),
    TP_SIT_FUNC INT,
    TP_ESCOLA INT,
    TP_ENSINO VARCHAR(1) CHECK (TP_ENSINO IN ('R','E')),
    CO_MUNICIPIO INT,
    FOREIGN KEY (CO_MUNICIPIO) REFERENCES MUNICIPIO(CO_MUNICIPIO)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (TP_DEPENDENCIA_ADM) REFERENCES DEP_ADM(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_SIT_FUNC) REFERENCES SIT_FUNC(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_ESCOLA) REFERENCES TP_ESCOLA(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-----------------------------------------------------
-- Tabela 11: FAIXA_ETARIA (Lookup)
-----------------------------------------------------
DROP TABLE IF EXISTS FAIXA_ETARIA CASCADE;
CREATE TABLE FAIXA_ETARIA (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 12: ESTADO_CIVIL (Lookup)
-----------------------------------------------------
DROP TABLE IF EXISTS ESTADO_CIVIL CASCADE;
CREATE TABLE ESTADO_CIVIL (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 13: COR_RACA (Lookup)
-----------------------------------------------------
DROP TABLE IF EXISTS COR_RACA CASCADE;
CREATE TABLE COR_RACA (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 14: NACIONALIDADE (Lookup)
-----------------------------------------------------
DROP TABLE IF EXISTS NACIONALIDADE CASCADE;
CREATE TABLE NACIONALIDADE (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 6: ENEM
-----------------------------------------------------
DROP TABLE IF EXISTS ENEM CASCADE;
CREATE TABLE ENEM (
    CO_ENEM SERIAL PRIMARY KEY,
    ANO INT not NULL
);


-----------------------------------------------------
-- Tabela 5: CANDIDATO
-----------------------------------------------------
DROP TABLE IF EXISTS CANDIDATO CASCADE;
CREATE TABLE CANDIDATO (
    NU_INSCRICAO BIGINT PRIMARY KEY,
    TP_FAIXA_ETARIA INT,
    TP_SEXO CHAR(1) CHECK (TP_SEXO IN ('M','F')),
    TP_ESTADO_CIVIL INT,
    TP_COR_RACA INT,
    TP_NACIONALIDADE INT,
    IN_TREINEIRO CHAR(1) CHECK (IN_TREINEIRO IN ('S','N')),
    CO_ESCOLA INT,
    CO_ENEM SERIAL,
    FOREIGN KEY (CO_ESCOLA) REFERENCES ESCOLA(CO_ESCOLA)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_FAIXA_ETARIA) REFERENCES FAIXA_ETARIA(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_ESTADO_CIVIL) REFERENCES ESTADO_CIVIL(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_COR_RACA) REFERENCES COR_RACA(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_NACIONALIDADE) REFERENCES NACIONALIDADE(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (CO_ENEM) REFERENCES ENEM(CO_ENEM)
        ON DELETE NO ACTION
        ON UPDATE NO action
);

-----------------------------------------------------
-- Tabela 18: ANO_CONCLUSAO (Ano de Conclusão do Ensino)
-----------------------------------------------------
DROP TABLE IF EXISTS ANO_CONCLUSAO CASCADE;
CREATE TABLE ANO_CONCLUSAO (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 17: SIT_CONCLUSAO (Situação de Conclusão do Ensino)
-----------------------------------------------------
DROP TABLE IF EXISTS SIT_CONCLUSAO CASCADE;
CREATE TABLE SIT_CONCLUSAO (
    NIVEL INT PRIMARY KEY,
    DESCRICAO TEXT
);

-----------------------------------------------------
-- Tabela 3: HISTORICO_ESCOLAR
-----------------------------------------------------
DROP TABLE IF EXISTS HISTORICO_ESCOLAR CASCADE;
CREATE TABLE HISTORICO_ESCOLAR (
    CO_HISTORICO_ESCOLAR SERIAL PRIMARY KEY,
    TP_ANO_CONCLUIU INT,
    TP_SITUACAO_CONCLUSAO INT,
    NU_INSCRICAO BIGINT,
    FOREIGN KEY (TP_ANO_CONCLUIU) REFERENCES ANO_CONCLUSAO(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_SITUACAO_CONCLUSAO) REFERENCES SIT_CONCLUSAO(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (NU_INSCRICAO) REFERENCES CANDIDATO(NU_INSCRICAO)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-----------------------------------------------------
-- Tabela 7: PROVA
-----------------------------------------------------
DROP TABLE IF EXISTS PROVA CASCADE;
CREATE TABLE PROVA (
    CO_PROVA SERIAL PRIMARY KEY,
    CO_PROVA_CN INT,
    CO_PROVA_CH INT,
    CO_PROVA_LC INT,
    CO_PROVA_MT INT,
    TP_LINGUA VARCHAR(1) CHECK (TP_LINGUA IN ('I','E')),
    CO_ENEM INT,
    FOREIGN KEY (CO_ENEM) REFERENCES ENEM(CO_ENEM)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-----------------------------------------------------
-- Tabela 8: RESULTADO
-----------------------------------------------------
DROP TABLE IF EXISTS RESULTADO CASCADE;
CREATE TABLE RESULTADO (
    CO_RESULTADO SERIAL PRIMARY KEY,
    NU_NOTA_CN DECIMAL(5,2),
    NU_NOTA_CH DECIMAL(5,2),
    NU_NOTA_LC DECIMAL(5,2),
    NU_NOTA_MT DECIMAL(5,2),
    NU_NOTA_REDACAO DECIMAL(5,2),
    CO_PROVA INT,
    NU_INSCRICAO BIGINT,
    FOREIGN KEY (CO_PROVA) REFERENCES PROVA(CO_PROVA)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (NU_INSCRICAO) REFERENCES CANDIDATO(NU_INSCRICAO)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-----------------------------------------------------
-- Tabela 20: TP_PRESENCA (Tipo de Presença na Prova)
-----------------------------------------------------
DROP TABLE IF EXISTS TP_PRESENCA CASCADE;
CREATE TABLE TP_PRESENCA (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 9: PRESENCA
-----------------------------------------------------
DROP TABLE IF EXISTS PRESENCA CASCADE;
CREATE TABLE PRESENCA (
    CO_PRESENCA SERIAL PRIMARY KEY,
    TP_PRESENCA_CN INT,
    TP_PRESENCA_CH INT,
    TP_PRESENCA_LC INT,
    TP_PRESENCA_MT INT,
    CO_MUNICIPIO INT,
    CO_ENEM INT,
    FOREIGN KEY (CO_MUNICIPIO) REFERENCES MUNICIPIO(CO_MUNICIPIO)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (CO_ENEM) REFERENCES ENEM(CO_ENEM)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_PRESENCA_CN) REFERENCES TP_PRESENCA(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_PRESENCA_CH) REFERENCES TP_PRESENCA(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_PRESENCA_LC) REFERENCES TP_PRESENCA(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_PRESENCA_MT) REFERENCES TP_PRESENCA(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO action
);

-----------------------------------------------------
-- Tabela 21: STATUS (Status da Redação)
-----------------------------------------------------
DROP TABLE IF EXISTS STATUS CASCADE;
CREATE TABLE STATUS (
    NIVEL INT PRIMARY KEY,
    DESCRICAO VARCHAR(45)
);

-----------------------------------------------------
-- Tabela 10: REDACAO
-----------------------------------------------------
DROP TABLE IF EXISTS REDACAO CASCADE;
CREATE TABLE REDACAO (
    CO_REDACAO SERIAL PRIMARY KEY,
    TP_STATUS_REDACAO INT,
    NU_NOTA_COMP1 INT,
    NU_NOTA_COMP2 INT,
    NU_NOTA_COMP3 INT,
    NU_NOTA_COMP4 INT,
    NU_NOTA_COMP5 INT,
    NU_NOTA_REDACAO INT,
    CO_PROVA INT,
    FOREIGN KEY (CO_PROVA) REFERENCES PROVA(CO_PROVA)
        ON DELETE NO ACTION
        ON UPDATE NO action,
    FOREIGN KEY (TP_STATUS_REDACAO) REFERENCES STATUS(NIVEL)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-----------------------------------------------------
-- Tabela 22: PERGUNTAS
-----------------------------------------------------
DROP TABLE IF EXISTS PERGUNTAS CASCADE;
CREATE TABLE PERGUNTAS (
    CO_PERGUNTA SERIAL PRIMARY KEY,
    CODIGO INT NOT NULL,      -- Exemplo: 'Q001', 'Q002', etc.
    QUESTAO TEXT NOT NULL             -- Texto completo da pergunta
);

-----------------------------------------------------
-- Tabela 23: RESPOSTAS
-----------------------------------------------------
DROP TABLE IF EXISTS RESPOSTAS CASCADE;
CREATE TABLE RESPOSTAS (
    CO_RESPOSTA SERIAL PRIMARY KEY,
    CO_PERGUNTA INT NOT NULL,         -- Chave estrangeira para PERGUNTAS
    OPCAO CHAR(2) NOT NULL,         -- Exemplo: 'A', 'B', 'C', etc.
    DESCRICAO TEXT NOT NULL,            -- Texto da opção de resposta
    FOREIGN KEY (CO_PERGUNTA) REFERENCES PERGUNTAS(CO_PERGUNTA)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (CO_PERGUNTA, OPCAO)       -- Garante que para uma pergunta cada código seja único
);

-----------------------------------------------------
-- Tabela 24: QUESTIONARIO
-----------------------------------------------------
DROP TABLE IF EXISTS QUESTIONARIO CASCADE;
CREATE TABLE QUESTIONARIO (
    NU_INSCRICAO BIGINT NOT NULL,  -- Chave que referencia o candidato
    CO_PERGUNTA INT NOT NULL,           -- Pergunta respondida
    CO_RESPOSTA INT NOT NULL,           -- Opção selecionada
    PRIMARY KEY (NU_INSCRICAO, CO_PERGUNTA),
    FOREIGN KEY (NU_INSCRICAO) REFERENCES CANDIDATO(NU_INSCRICAO)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CO_PERGUNTA) REFERENCES PERGUNTAS(CO_PERGUNTA)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CO_RESPOSTA) REFERENCES RESPOSTAS(CO_RESPOSTA) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
