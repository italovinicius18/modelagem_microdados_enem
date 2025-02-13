# Projeto de Mestrado - Fundamento de Banco de Dados

Este projeto foi desenvolvido como parte do trabalho de mestrado da disciplina de Banco de Dados. O objetivo é consumir dados públicos do governo federal — no caso, dados do ENEM 2023 — e realizar todo o ciclo de desenvolvimento de um banco de dados, contemplando:

- **Modelagem de dados (relacional)**  
- **Script de criação do banco** (SQL)  
- **Processo de ETL** (Extract, Transform, Load)  
- **Uso de View(s)**  
- **Uso de Procedure(s)** (com comandos condicionais)  
- **Uso de Trigger(s)** (com comandos condicionais)  
- **Consultas SQL**  
- **Consultas em Álgebra Relacional**  

A infraestrutura utilizada para este projeto inclui um contêiner Docker com o PostgreSQL e notebooks para facilitar o processo de ETL e análise de dados.

---

## Índice

1. [Visão Geral do Projeto](#visão-geral-do-projeto)  
2. [Estrutura do Repositório](#estrutura-do-repositório)  
3. [Pré-requisitos](#pré-requisitos)  
4. [Como Executar o Projeto](#como-executar-o-projeto)  
5. [Processo de ETL](#processo-de-etl)  
6. [Modelagem do Banco e Scripts SQL](#modelagem-do-banco-e-scripts-sql)  
7. [Contribuições e Licença](#contribuições-e-licença)

---

## Visão Geral do Projeto

A proposta é criar um banco de dados relacional a partir de dados abertos, especificamente os **Microdados do ENEM 2023**. A aplicação da metodologia de ETL permite extrair as informações, transformá-las para o modelo lógico proposto e, em seguida, carregá-las em uma instância do PostgreSQL.

O projeto contempla também a criação de **view(s)**, **procedure(s)** e **trigger(s)** para demonstrar funcionalidades avançadas de SQL, além de consultas em **Álgebra Relacional** para consolidar conceitos teóricos da disciplina de Banco de Dados.

---

## Estrutura do Repositório

```
.
├── LICENSE
├── README.md
├── docker-compose.yml
└── src
    ├── etl.ipynb
    ├── download.py
    ├── helper.py
    └── requirements.txt
```

- **docker-compose.yml**  
  Arquivo de configuração do Docker Compose responsável por iniciar o serviço de banco de dados PostgreSQL.

- **src/etl.ipynb**  
  Notebook Jupyter utilizado para executar o processo de ETL (leitura, transformação e ingestão dos dados no banco).

- **src/download.py**  
  Script responsável por baixar os Microdados do ENEM de 2023 e converter os dados em parquet para otimização na leitura

- **src/helper.py**  
  Script auxiliar que possui constantes e faunções que ajudarão nos processos do trabalho 

- **src/requirements.txt**  
  Dependências Python para executar o `etl.ipynb`.

---

## Pré-requisitos

- **Docker** (testado com versões 20.x ou superior)  
- **Docker Compose** (testado com versões 1.29 ou superior)  
- **Python 3.x** (caso queira executar localmente o notebook de ETL)  
- **Poetry** Biblioteca para criação do ambiente virtual de execução dos scripts

---

## Como Executar o Projeto

1. **Clonar este repositório** ou baixar os arquivos.

2. **Subir o contêiner do PostgreSQL** usando o Docker Compose:
   ```bash
   docker-compose up -d
   ```
   - Isso iniciará um contêiner com o PostgreSQL.  
   - Geralmente, o serviço ficará acessível em `localhost:5432`.  
   - Verifique se as credenciais padrão do seu `docker-compose.yml` estão corretas para conexão ao banco (por exemplo, usuário `postgres` e senha `postgres`).

3. **Verificar o status dos contêineres**:
   ```bash
   docker-compose ps
   ```
   - Certifique-se de que o contêiner do PostgreSQL está rodando corretamente.

3. (Opcional) **Executar o script para download dos dados**
   - Instale as dependências:
     ```bash
     poetry install
     ```
   - Execute o script de download
     ```bash
     poetry run python src/download.py
     ```  

4. (Opcional) **Executar o Notebook de ETL localmente**  
   - Iniciar ambiente do jupyter:
     ```bash
     poetry run jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password=''
     ```

   - Abra o arquivo `etl.ipynb` na pasta `src/` e siga as instruções nele para ingestão de dados.  

Após a execução do ETL, seu banco de dados deverá estar populado com as tabelas referentes aos dados do ENEM 2023 já na modelagem criada.

---

## Processo de ETL

No notebook `src/etl.ipynb`, são realizadas as seguintes etapas:

1. **Extração**  
   - Leitura dos arquivos PARQUET, como `MICRODADOS_ENEM_2023.parquet` e `ITENS_PROVA_2023.parquet`.

2. **Transformação**  
   - Padronização de colunas (nomes, tipos, normalização de valores, limpeza de dados, etc.).
   - Eventual junção de tabelas ou aplicação de regras de negócio definidas na modelagem.

3. **Carga (Load)**  
   - Ingestão dos dados transformados no banco PostgreSQL.
   - Criação das tabelas se ainda não existirem.
   - Inserção de registros.

---

## Modelagem do Banco e Scripts SQL

- **Modelo de dados Relacional**: Inclui as entidades principais (por exemplo, informações do participante, dados da prova, etc.) e seus relacionamentos.
- **Criação de Tabelas**: O *script SQL* para criação das tabelas é gerado pelo próprio processo de ETL ou pode estar disponível em um arquivo à parte (por exemplo, `create_tables.sql`). 
- **View(s)**: Pelo menos uma *View* foi criada para facilitar consultas específicas ou consolidar informações de múltiplas tabelas.
- **Procedure(s)**: Inclusão de rotinas armazenadas para lógicas específicas com uso de condicionais (ex.: verificação de notas acima de determinada média).
- **Trigger(s)**: Mecanismo de auditoria ou atualização automatizada ao inserir/atualizar/excluir registros (ex.: disparar ação ao inserir nova linha em uma tabela).

### Modelagem

A pasta **modelagem** contém os scripts e artefatos que documentam a criação, normalização e consulta do banco de dados. A seguir, uma descrição de cada arquivo (ou conjunto de arquivos) presente nesta pasta:

- **1.DDL.sql**  
  *Descrição:* Script que dropa (se necessário) e cria todas as tabelas do modelo de dados. Inclui a criação do schema **fbd** e a definição das tabelas, suas chaves primárias, estrangeiras, restrições (CHECK) e demais aspectos do modelo físico.

- **2.DML.sql**  
  *Descrição:* Script que insere os dados de lookup (dimensões) e as informações básicas definidas no dicionário de dados. Segue as regras: se o conteúdo for binário, utiliza-se uma cláusula CHECK; caso contrário, são criadas tabelas de domínio para auxiliar.

- **3.NORMALIZA.sql**  
  *Descrição:* Script que manipula a tabela denormalizada (MICRODADOS_ENEM). Essa etapa trata, transforma e insere os dados em suas respectivas tabelas normalizadas (por exemplo, separando informações de candidato, prova, resultado, presença, redação e questionário). Em resumo, "normaliza" a OBT (origem dos dados) para o modelo final.

- **4.VIEW.sql**  
  *Descrição:* Script para criação de uma ou mais views que consolidam informações relevantes do banco. Essas views foram criadas conforme solicitado no exercício para facilitar consultas complexas.

- **5.PROCEDURE.sql**  
  *Descrição:* Script que contém a criação de procedures (rotinas armazenadas) com comandos condicionais. Essas procedures implementam regras de negócio – por exemplo, a verificação ou atualização automática de status ou notas.

- **6.TRIGGER.sql**  
  *Descrição:* Script que cria triggers (disparadores) com lógica condicional, acionadas em momentos específicos (como antes de uma inserção ou atualização) para assegurar a integridade dos dados ou realizar ações automáticas (por exemplo, validação de notas, auditoria ou atualização de campos derivados).

- **7.QUERIES.sql**  
  *Descrição:* Script contendo cinco (ou mais) consultas SQL complexas para extrair diferentes insights dos dados. Essas queries exploram junções múltiplas, agregações, funções janela, e até geração de JSON para análise avançada.

- **DER.png**  
  *Descrição:* Diagrama Entidade-Relacionamento (DER) gerado pelo DBEAVER, que ilustra visualmente o modelo de dados (entidades, atributos e relacionamentos).

- **queries/**  
  *Conteúdo:* Pasta que contém imagens (por exemplo, 1.png, 2.png, …, 5.png) que ilustram o resultado ou o fluxo de execução das consultas presentes em **7.QUERIES.sql**.

Você encontrará exemplos destes componentes no código SQL gerado pelo ETL ou em arquivos `.sql` complementares (caso existam).