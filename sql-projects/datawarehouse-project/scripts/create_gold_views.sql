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
