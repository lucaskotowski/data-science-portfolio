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
