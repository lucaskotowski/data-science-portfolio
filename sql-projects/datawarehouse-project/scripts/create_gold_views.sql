-- gold.dim_customer

CREATE VIEW gold.dim_customer AS
SELECT
	ROW_NUMBER() OVER (ORDER BY cst_id) AS customer_key,
	cst_id AS customer_id,
	cst_key AS customer_number,
	cst_firstname AS first_name,
	cst_lastname AS last_name,
	la.cntry AS country,
	CASE WHEN
		ci.cst_gndr != 'N/A' THEN ci.cst_gndr
		ELSE COALESCE(ca.geb, 'N/A')
	END AS customer_gender,
	ca.bdate AS birthdate,
	cst_marital_status AS marital_status,
	cst_create_date AS create_date
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la ON ci.cst_key = la.cid;


--gold.dim_products

CREATE VIEW gold.dim_products AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY prd_start_dt, prd_key) AS product_key,
	prd_id AS product_number,
	prd_key AS product_id,
	prd_name AS product_name,
	cat_id AS categorie_id,
	cat AS categorie,
	subcat AS subcategorie,
	maintenance,
	prd_cost AS product_cost,
	prd_line AS product_line,
	prd_start_dt AS product_start_date
FROM silver.crm_prd_info pi
LEFT JOIN silver.erp_px_cat_g1v2 pc ON pi.cat_id = pc.id
WHERE prd_end_dt IS NULL


-- gold.fact_sales

CREATE VIEW gold.fact_sales AS
SELECT
	sls_ord_num AS order_number,
	dp.product_key,
	dc.customer_key,
	sls_order_dt AS order_date,
	sls_ship_dt AS shipping_date,
	sls_due_dt AS due_date,
	sls_price AS  price,
	sls_quantity AS order_quantity,
	sls_sales AS order_total
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products dp ON sd.sls_prd_key = dp.product_id
LEFT JOIN gold.dim_customer dc ON sd.sls_cust_id = dc.customer_id;
