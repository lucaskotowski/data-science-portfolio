# Projeto Data Warehouse

Seja bem vindo ao projeto de **Data Warehouse*!
O objetivo deste projeto é criar e estruturar uma solução completa de data warehouse, com foco em entender de forma estruturada a criação de um data warehous completo. Sendo um projeto de porfolio, busquei entender os princípios e aplicar as melhores práticas a serem seguidas em um projeto real.

---
## Arquitetura

A arquitetura de dados escolhida segue o padrão da 'Arquitetura Medalhão', separando os dados nas camadas **Bronze**, **Silver** e **Gold**:
![Data Architecture](docs/data_architecture.png)

1. **Bronze**: Armazenar dados brutos, trazendo os dados do mesmo formato nos quais são encontrados na fonte.
2. **Silver**: Nesta camada são aplicadas as melhores práticas de limpeza e padronização de dados, a fim de preparar estes dados para posteriores análises.
3. **Gold**: Dados já formatados e modelados para uso em reports e análises.

---
## Escopo do Projeto

1. **Arquitetura de Dados**: desenhar um data warehouse moderno e funcional.
2. **Processo de ETL**: Aplicar as melhores práticas de ETL.
3. **Modelagem de dados*: modelar todos os dados a fim de deixá-los prontos para uso em reports e análises avançadas.
