DROP TABLE IF EXISTS silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info (
	cst_id int,
	cst_key VARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname VARCHAR(50),
	cst_marital_status VARCHAR(50),
	cst_gndr VARCHAR(50),
	cst_create_date DATE,
	dwh_created_at DATE DEFAULT NOW()
);

DROP TABLE IF EXISTS silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info (
	prd_id int,
	prd_key VARCHAR(50),
	prd_name VARCHAR(50),
	prd_cost int,
	prd_line VARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE,
	dwh_created_at DATE DEFAULT NOW()
);

DROP TABLE IF EXISTS silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details (
	sls_ord_num VARCHAR(50),
	sls_prd_key VARCHAR(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int,
	sls_quantity int,
	sls_price int,
	dwh_created_at DATE DEFAULT NOW()
);

DROP TABLE IF EXISTS silver.erp_CUST_AZ12;
CREATE TABLE silver.erp_CUST_AZ12 (
	CID VARCHAR(50),
	BDATE DATE,
	GEB VARCHAR(50),
	dwh_created_at DATE DEFAULT NOW()
);

DROP TABLE IF EXISTS silver.erp_LOC_A101;
CREATE TABLE silver.erp_LOC_A101 (
	CID VARCHAR(50),
	CNTRY VARCHAR(50),
	dwh_created_at DATE DEFAULT NOW()
);

DROP TABLE IF EXISTS silver.erp_PX_CAT_G1V2;
CREATE TABLE silver.erp_PX_CAT_G1V2 (
	ID VARCHAR(50),
	CAT VARCHAR(50),
	SUBCAT VARCHAR(50),
	MAINTENANCE VARCHAR(50),
	dwh_created_at DATE DEFAULT NOW()
);
