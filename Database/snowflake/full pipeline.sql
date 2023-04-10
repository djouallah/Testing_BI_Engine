create DATABASE IDENTIFIER('"TPCH"') COMMENT = '' ;
USE TPCH ;
create or replace schema EXTERNAL ;
USE TPCH.EXTERNAL ;

CREATE OR REPLACE STAGE my_azure_stage
  URL='azure://yyyy.blob.core.windows.net/xxxx'
  CREDENTIALS=(AZURE_SAS_TOKEN='xxxxxxxxxxxxxxxxx') ;
  
  
CREATE OR REPLACE FILE FORMAT my_parquet_format
  TYPE = PARQUET
  COMPRESSION = SNAPPY;
  
-- notice that snowflake is case sensitive, I changed field name to capital

create or replace external table TPCH.EXTERNAL_TABLE.CUSTOMER(
	"C_ACCTBAL" NUMBER(15,2) AS (CAST(GET($1, 'c_acctbal') AS NUMBER(15,2))),
	"C_MKTSEGMENT" VARCHAR(10) AS (CAST(GET($1, 'c_mktsegment') AS VARCHAR(10))),
	"C_ADDRESS" VARCHAR(40) AS (CAST(GET($1, 'c_address') AS VARCHAR(40))),
	"C_COMMENT" VARCHAR(117) AS (CAST(GET($1, 'c_comment') AS VARCHAR(117))),
	"C_NATIONKEY" NUMBER(38,0) AS (CAST(GET($1, 'c_nationkey') AS NUMBER(38,0))),
	"C_NAME" VARCHAR(25) AS (CAST(GET($1, 'c_name') AS VARCHAR(25))),
	"C_CUSTKEY" NUMBER(38,0) AS (CAST(GET($1, 'c_custkey') AS NUMBER(38,0))),
	"C_PHONE" VARCHAR(16777216) AS (CAST(GET($1, 'c_phone') AS VARCHAR(15))))
location=@MY_AZURE_STAGE/customer/
auto_refresh=false
file_format=my_parquet_format
;

create or replace external table TPCH.EXTERNAL_TABLE.LINEITEM(
	"L_SHIPDATE" DATE AS (CAST(GET($1, 'l_shipdate') AS DATE)),
	"L_COMMITDATE" DATE AS (CAST(GET($1, 'l_commitdate') AS DATE)),
	"L_QUANTITY" NUMBER(38,0) AS (CAST(GET($1, 'l_quantity') AS NUMBER(38,0))),
	"L_EXTENDEDPRICE" NUMBER(15,2) AS (CAST(GET($1, 'l_extendedprice') AS NUMBER(15,2))),
	"L_SUPPKEY" NUMBER(38,0) AS (CAST(GET($1, 'l_suppkey') AS NUMBER(38,0))),
	"L_LINENUMBER" NUMBER(38,0) AS (CAST(GET($1, 'l_linenumber') AS NUMBER(38,0))),
	"L_DISCOUNT" NUMBER(15,2) AS (CAST(GET($1, 'l_discount') AS NUMBER(15,2))),
	"L_TAX" NUMBER(15,2) AS (CAST(GET($1, 'l_tax') AS NUMBER(15,2))),
	"L_ORDERKEY" NUMBER(38,0) AS (CAST(GET($1, 'l_orderkey') AS NUMBER(38,0))),
	"L_PARTKEY" NUMBER(38,0) AS (CAST(GET($1, 'l_partkey') AS NUMBER(38,0))),
	"L_RECEIPTDATE" DATE AS (CAST(GET($1, 'l_receiptdate') AS DATE)),
	"L_SHIPINSTRUCT" VARCHAR(25) AS (CAST(GET($1, 'l_shipinstruct') AS VARCHAR(25))),
	"L_SHIPMODE" VARCHAR(10) AS (CAST(GET($1, 'l_shipmode') AS VARCHAR(10))),
	"L_COMMENT" VARCHAR(44) AS (CAST(GET($1, 'l_comment') AS VARCHAR(44))),
	"L_RETURNFLAG" VARCHAR(1) AS (CAST(GET($1, 'l_returnflag') AS VARCHAR(1))),
	"L_LINESTATUS" VARCHAR(1) AS (CAST(GET($1, 'l_linestatus') AS VARCHAR(1))))
location=@MY_AZURE_STAGE/lineitem/
auto_refresh=false
file_format=my_parquet_format
;

create or replace external table TPCH.EXTERNAL_TABLE.NATION(
	"N_NATIONKEY" NUMBER(38,0) AS (CAST(GET($1, 'n_nationkey') AS NUMBER(38,0))),
	"N_REGIONKEY" NUMBER(38,0) AS (CAST(GET($1, 'n_regionkey') AS NUMBER(38,0))),
	"N_COMMENT" VARCHAR(152) AS (CAST(GET($1, 'n_comment') AS VARCHAR(152))),
	"N_NAME" VARCHAR(25) AS (CAST(GET($1, 'n_name') AS VARCHAR(25))))
location=@MY_AZURE_STAGE/nation/
auto_refresh=false
file_format=my_parquet_format
;

create or replace external table TPCH.EXTERNAL_TABLE.ORDERS(
	"O_SHIPPRIORITY" NUMBER(38,0) AS (CAST(GET($1, 'o_shippriority') AS NUMBER(38,0))),
	"O_COMMENT" VARCHAR(79) AS (CAST(GET($1, 'o_comment') AS VARCHAR(79))),
	"O_ORDERPRIORITY" VARCHAR(15) AS (CAST(GET($1, 'o_orderpriority') AS VARCHAR(15))),
	"O_CLERK" VARCHAR(15) AS (CAST(GET($1, 'o_clerk') AS VARCHAR(15))),
	"O_ORDERDATE" DATE AS (CAST(GET($1, 'o_orderdate') AS DATE)),
	"O_ORDERSTATUS" VARCHAR(1) AS (CAST(GET($1, 'o_orderstatus') AS VARCHAR(1))),
	"O_TOTALPRICE" NUMBER(15,2) AS (CAST(GET($1, 'o_totalprice') AS NUMBER(15,2))),
	"O_ORDERKEY" NUMBER(38,0) AS (CAST(GET($1, 'o_orderkey') AS NUMBER(38,0))),
	"O_CUSTKEY" NUMBER(38,0) AS (CAST(GET($1, 'o_custkey') AS NUMBER(38,0))))
location=@MY_AZURE_STAGE/orders/
auto_refresh=false
file_format=my_parquet_format
;

create or replace external table TPCH.EXTERNAL_TABLE.PART(
	"P_NAME" VARCHAR(55) AS (CAST(GET($1, 'p_name') AS VARCHAR(55))),
	"P_PARTKEY" NUMBER(38,0) AS (CAST(GET($1, 'p_partkey') AS NUMBER(38,0))),
	"P_SIZE" NUMBER(38,0) AS (CAST(GET($1, 'p_size') AS NUMBER(38,0))),
	"P_COMMENT" VARCHAR(23) AS (CAST(GET($1, 'p_comment') AS VARCHAR(23))),
	"P_TYPE" VARCHAR(25) AS (CAST(GET($1, 'p_type') AS VARCHAR(25))),
	"P_CONTAINER" VARCHAR(10) AS (CAST(GET($1, 'p_container') AS VARCHAR(10))),
	"P_RETAILPRICE" NUMBER(15,2) AS (CAST(GET($1, 'p_retailprice') AS NUMBER(15,2))),
	"P_MFGR" VARCHAR(25) AS (CAST(GET($1, 'p_mfgr') AS VARCHAR(25))),
	"P_BRAND" VARCHAR(10) AS (CAST(GET($1, 'p_brand') AS VARCHAR(10))))
location=@MY_AZURE_STAGE/part/
auto_refresh=false
file_format=my_parquet_format
;

create or replace external table TPCH.EXTERNAL_TABLE.PARTSUPP(
	"PS_SUPPKEY" NUMBER(38,0) AS (CAST(GET($1, 'ps_suppkey') AS NUMBER(38,0))),
	"PS_PARTKEY" NUMBER(38,0) AS (CAST(GET($1, 'ps_partkey') AS NUMBER(38,0))),
	"PS_AVAILQTY" NUMBER(38,0) AS (CAST(GET($1, 'ps_availqty') AS NUMBER(38,0))),
	"PS_SUPPLYCOST" NUMBER(15,2) AS (CAST(GET($1, 'ps_supplycost') AS NUMBER(15,2))),
	"PS_COMMENT" VARCHAR(199) AS (CAST(GET($1, 'ps_comment') AS VARCHAR(199))))
location=@MY_AZURE_STAGE/partsupp/
auto_refresh=false
file_format=my_parquet_format
;

create or replace external table TPCH.EXTERNAL_TABLE.REGION(
	"R_COMMENT" VARCHAR(152) AS (CAST(GET($1, 'r_comment') AS VARCHAR(152))),
	"R_REGIONKEY" NUMBER(38,0) AS (CAST(GET($1, 'r_regionkey') AS NUMBER(38,0))),
	"R_NAME" VARCHAR(25) AS (CAST(GET($1, 'r_name') AS VARCHAR(25))))
location=@MY_AZURE_STAGE/region/
auto_refresh=false
file_format=my_parquet_format
;

create or replace external table TPCH.EXTERNAL_TABLE.SUPPLIER(
	"S_NAME" VARCHAR(25) AS (CAST(GET($1, 's_name') AS VARCHAR(25))),
	"S_ADDRESS" VARCHAR(40) AS (CAST(GET($1, 's_address') AS VARCHAR(40))),
	"S_SUPPKEY" NUMBER(38,0) AS (CAST(GET($1, 's_suppkey') AS NUMBER(38,0))),
	"S_ACCTBAL" NUMBER(15,2) AS (CAST(GET($1, 's_acctbal') AS NUMBER(15,2))),
	"S_PHONE" VARCHAR(15) AS (CAST(GET($1, 's_phone') AS VARCHAR(15))),
	"S_COMMENT" VARCHAR(101) AS (CAST(GET($1, 's_comment') AS VARCHAR(101))),
	"S_NATIONKEY" NUMBER(38,0) AS (CAST(GET($1, 's_nationkey') AS NUMBER(38,0))))
location=@MY_AZURE_STAGE/supplier/
auto_refresh=false
file_format=my_parquet_format
;

--Load data to Snowflake DB
USE TPCH
create or replace schema internal ;
create or replace table lineitem as select L_SHIPDATE, L_COMMITDATE, L_QUANTITY, L_EXTENDEDPRICE,
L_SUPPKEY, L_LINENUMBER, L_DISCOUNT, L_TAX, L_ORDERKEY, L_PARTKEY, L_RECEIPTDATE, L_SHIPINSTRUCT,
L_SHIPMODE, L_COMMENT, L_RETURNFLAG, L_LINESTATUS from tpch.external_table.lineitem ;

create or replace table orders as select O_SHIPPRIORITY, O_COMMENT, O_ORDERPRIORITY,
O_CLERK, O_ORDERDATE, O_ORDERSTATUS, O_TOTALPRICE, O_ORDERKEY, O_CUSTKEY from tpch.external_table.orders ;

create or replace table customer as select C_ACCTBAL, C_MKTSEGMENT, C_ADDRESS, C_COMMENT,
C_NATIONKEY, C_NAME, C_CUSTKEY, C_PHONE from tpch.external_table.customer ;

create or replace table nation as select N_NATIONKEY, N_REGIONKEY, N_COMMENT, N_NAME from tpch.external_table.nation ;

create or replace table region as select R_REGIONKEY, R_NAME , R_COMMENT from tpch.external_table.region ;

create or replace table part as select P_NAME, P_PARTKEY, P_SIZE, P_COMMENT, P_TYPE, P_CONTAINER,
P_RETAILPRICE, P_MFGR, P_BRAND from tpch.external_table.part ;

create or replace table partsupp as select PS_SUPPKEY, PS_PARTKEY, PS_AVAILQTY, PS_SUPPLYCOST, PS_COMMENT from tpch.external_table.partsupp ;

create or replace table supplier as select S_NAME, S_ADDRESS, S_SUPPKEY, S_ACCTBAL, S_PHONE, S_COMMENT, S_NATIONKEY from tpch.external_table.supplier ;
