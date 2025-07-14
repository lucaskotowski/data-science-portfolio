-- Limpeza de dados e inserção dos dados já padronizados nas tabelas silver

-- silver.crm_cust_info
-- Remoção de espaços em branco, normalização e padronização de abreviações e dados NULL, remoção de dados duplicados

INSERT INTO silver.crm_cust_info (cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, cst_create_date)
SELECT 
	cst_id,
	cst_key,
	TRIM(cst_firstname) AS cst_firstname,
	TRIM(cst_lastname) AS cst_lastname,
	CASE
		WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
		WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
		ELSE 'N/A'
		END AS cst_marital_status,
	CASE
		WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
		WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
		ELSE 'N/A'
		END AS cst_gndr,
	cst_create_date FROM (
	SELECT *, 
	ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last 
FROM 
	bronze.crm_cust_info WHERE cst_id IS NOT NULL) WHERE flag_last = 1
