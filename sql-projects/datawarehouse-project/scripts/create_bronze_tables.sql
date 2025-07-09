-- Script para criação das tabelas utilizadas na camada bronze

CREATE TABLE bronze.crm_cust_info (
	cst_id int,
	cst_key VARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname VARCHAR(50),
	cst_marital_status VARCHAR(50),
	cst_gndr VARCHAR(50),
	cst_create_date DATE
);
