# Projeto Data Warehouse

Seja bem vindo ao projeto de **Data Warehouse**!
O objetivo deste projeto é criar e estruturar uma solução completa de data warehouse, com foco em entender de forma estruturada a criação de um data warehous completo. Sendo um projeto de porfolio, busquei entender os princípios e aplicar as melhores práticas a serem seguidas em um projeto real.

---
## Arquitetura

A arquitetura de dados escolhida segue o padrão da 'Arquitetura Medalhão', separando os dados nas camadas **Bronze**, **Silver** e **Gold**:

1. **Bronze**: Armazenar dados brutos, trazendo os dados do mesmo formato nos quais são encontrados na fonte.
2. **Silver**: Nesta camada são aplicadas as melhores práticas de limpeza e padronização de dados, a fim de preparar estes dados para posteriores análises.
3. **Gold**: Dados já formatados e modelados para uso em reports e análises.

<img width="701" height="271" alt="data_arch drawio" src="https://github.com/user-attachments/assets/18d8349c-3855-4f4e-b51d-08bc756ddab5" />

## DATA FLOW
<img width="1094" height="530" alt="data_flow" src="https://github.com/user-attachments/assets/a45a4236-2656-44cf-9292-a11244d7e88f" />


---
## Escopo do Projeto

1. **Arquitetura de Dados**: desenhar um data warehouse moderno e funcional.
2. **Processo de ETL**: Aplicar as melhores práticas de ETL.
3. **Modelagem de dados**: modelar todos os dados a fim de deixá-los prontos para uso em reports e análises avançadas.

# Dados da Camada Gold

## Overview
A camada Gold reflete os dados já estruturados e prontos para análise, a partir de duas tabelas dimension e uma tabela fact.

---

### 1. **gold.dim_customers**
- Guarda dados dos consumidores

| Coluna           | Tipo          | Descrição                                                                                     |
|------------------|---------------|-----------------------------------------------------------------------------------------------|
| customer_key     | INT           | FK identificadora                                                                           
| customer_id      | INT           | Identificador numérico único por consumidor                                                   
| customer_number  | NVARCHAR(50)  | Identificador alfanumérico único por consumidor.                                             
| first_name       | NVARCHAR(50)  | Primeiro Nome.                                         
| last_name        | NVARCHAR(50)  | Sobrenome.                                                     
| country          | NVARCHAR(50)  | País.                               
| marital_status   | NVARCHAR(50)  | Statu conjugal.                              
| gender           | NVARCHAR(50)  | Gênero.                                  
| birthdate        | DATE          | Data de nascimento.              
| create_date      | DATE          | Data e hora de criação desde dado na tabela

---

### 2. **gold.dim_products**
- Guarda dados dos produtos.

|  Coluna             | Tipo          | Descrição                                                                                    |
|---------------------|---------------|----------------------------------------------------------------------------------------------|
| product_key         | INT           | FK identificadora .         
| product_id          | INT           | Identificador numérico único por produto            
| product_number      | NVARCHAR(50)  | Identificador alfanumérico único por produto. 
| product_name        | NVARCHAR(50)  | Nome do produto.         
| category_id         | NVARCHAR(50)  | ID da categoria.     
| category            | NVARCHAR(50)  | Nomenclatura da categoria.  
| subcategory         | NVARCHAR(50)  | Subcategoria 
| maintenance_required| NVARCHAR(50)  | Indicador de necessidade de manutenção                       
| cost                | INT           | Custo de produção.                            
| product_line        | NVARCHAR(50)  | Linha de produção.      
| start_date          | DATE          | Data e hora de criação desde dado na tabela

---

### 3. **gold.fact_sales**
- Guarda dados de transações e vendas

| Coluna          | Tipo          | Descrição                                                                                      |
|-----------------|---------------|-----------------------------------------------------------------------------------------------|
| order_number    | NVARCHAR(50)  | Identificador alfanumérico único por transação                      
| product_key     | INT           | FK identificadora para produtos.                               
| customer_key    | INT           | FK identificadora para consumidores.                              
| order_date      | DATE          | Data do pedido.                                                           
| shipping_date   | DATE          | Data de envio.                                          
| due_date        | DATE          | Data de vencimento do pagamento.                                                      
| sales_total     | INT           | Valor total do pedido.   
| quantity        | INT           | Quantidade da venda.                       
| price           | INT           | Valor da venda por produto.     


