-- Limpeza de dados e inserção dos dados já padronizados nas tabelas silver
-- Remoção de espaços em branco, normalização e padronização de abreviações e dados NULL, remoção de dados duplicados

CREATE OR REPLACE PROCEDURE silver.load_silver()
LANGUAGE plpgsql
AS $$ 

BEGIN
-- silver.crm_cust_info
TRUNCATE TABLE silver.crm_cust_info;
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
	bronze.crm_cust_info WHERE cst_id IS NOT NULL) WHERE flag_last = 1;



-- silver.crm_prd_info
TRUNCATE TABLE silver.crm_prd_info;
INSERT INTO silver.crm_prd_info (prd_id, cat_id, prd_key, prd_name, prd_cost, prd_line, prd_start_dt, prd_end_dt)
SELECT
prd_id,
REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') as cat_id,
SUBSTRING(prd_key, 7, LENGTH(prd_key)) as prd_key,
TRIM(prd_name),
COALESCE(prd_cost, 0),
CASE 
	WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
	WHEN UPPER(TRIM(prd_line)) = 'R' THEN 'Road'
	WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'Other Sales'
	WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
	ELSE 'N/A'
END AS prd_line,
CAST(prd_start_dt AS DATE) AS prd_start_dt,
  (LEAD(CAST(prd_start_dt AS DATE)) OVER (PARTITION BY prd_key ORDER BY prd_start_dt) - INTERVAL '1 day') AS prd_end_dt
FROM bronze.crm_prd_info;


-- silver.crm_sales_details
TRUNCATE TABLE silver.crm_sales_details;
INSERT INTO silver.crm_sales_details (
	sls_ord_num,
	sls_prd_key,
	sls_cust_id,
	sls_order_dt,
	sls_ship_dt,
	sls_due_dt,
	sls_sales,
	sls_quantity,
	sls_price
)
SELECT 
	sls_ord_num,
	sls_prd_key,
	sls_cust_id,
	CASE 
		WHEN sls_order_dt = 0 OR LENGTH(TRIM(sls_order_dt::text)) != 8 THEN NULL
		ELSE TO_DATE(sls_order_dt::text, 'YYYYMMDD')
	END AS sls_order_dt,
	CASE 
		WHEN sls_ship_dt = 0 OR LENGTH(TRIM(sls_ship_dt::text)) != 8 THEN NULL
		ELSE TO_DATE(sls_ship_dt::text, 'YYYYMMDD')
	END AS sls_ship_dt,
	CASE 
		WHEN sls_due_dt = 0 OR LENGTH(TRIM(sls_due_dt::text)) != 8 THEN NULL
		ELSE TO_DATE(sls_due_dt::text, 'YYYYMMDD')
	END AS sls_due_dt,
	CASE 
		WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_sales != sls_quantity * ABS(sls_price) 
			THEN sls_quantity * ABS(sls_price)
		ELSE sls_sales
	END AS sls_sales,
	sls_quantity,
	CASE 
		WHEN sls_price IS NULL OR sls_price <= 0 
			THEN sls_sales / NULLIF(sls_quantity, 0)
		ELSE sls_price
	END AS sls_price
FROM bronze.crm_sales_details;


-- silver.erp_cust_az12
TRUNCATE TABLE silver.erp_cust_az12;
INSERT INTO silver.erp_cust_az12 (
	cid,
	bdate, 
	geb
)
SELECT 
	cid, 
	bdate,
	CASE 
		WHEN TRIM(geb) = 'M' THEN 'Male'
		WHEN TRIM(geb) = 'F' THEN 'Female'
	ELSE TRIM(geb)
	END AS geb
FROM bronze.erp_cust_az12;


-- silver.erp_loc_a101
TRUNCATE TABLE silver.erp_loc_a101;
INSERT INTO silver.erp_loc_a101 (
	cid,
	cntry
)
SELECT 
	REPLACE(cid, '-', '') AS cid, 
	CASE 
		WHEN TRIM(cntry) = '' OR TRIM(cntry) IS NULL THEN 'N/A'
		WHEN TRIM(cntry) = 'DE' then 'Germany'
		WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
		ELSE TRIM(cntry)
	END AS cntry
FROM bronze.erp_loc_a101;



-- silver.erp_px_cat_g1v2
TRUNCATE TABLE silver.erp_px_cat_g1v2;
INSERT INTO silver.erp_px_cat_g1v2 (id, cat, subcat, maintenance)
SELECT
	id,
	cat,
	subcat,
	maintenance
FROM bronze.erp_px_cat_g1v2;
