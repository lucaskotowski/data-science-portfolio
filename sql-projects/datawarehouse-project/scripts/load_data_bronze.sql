CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$ 

BEGIN
	TRUNCATE TABLE bronze.crm_cust_info;
	COPY bronze.crm_cust_info FROM 'D:\VS Code\Projetos\dwh-project\datasets\source_crm\cust_info.csv' CSV HEADER;
	
	TRUNCATE TABLE bronze.crm_prd_info;
	COPY bronze.crm_prd_info FROM 'D:\VS Code\Projetos\dwh-project\datasets\source_crm\prd_info.csv' CSV HEADER;
	
	TRUNCATE TABLE bronze.crm_sales_details;
	COPY bronze.crm_sales_details FROM 'D:\VS Code\Projetos\dwh-project\datasets\source_crm\sales_details.csv' CSV HEADER;

	RAISE NOTICE 'Loading ERP tables';
	TRUNCATE TABLE bronze.erp_cust_az12;
	COPY bronze.erp_cust_az12 FROM 'D:\VS Code\Projetos\dwh-project\datasets\source_erp\cust_az12.csv' CSV HEADER;
	
	TRUNCATE TABLE bronze.erp_loc_a101;
	COPY bronze.erp_loc_a101 FROM 'D:\VS Code\Projetos\dwh-project\datasets\source_erp\loc_a101.csv' CSV HEADER;
	
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	COPY bronze.erp_px_cat_g1v2 FROM 'D:\VS Code\Projetos\dwh-project\datasets\source_erp\px_cat_g1v2.csv' CSV HEADER;

END;
$$;
