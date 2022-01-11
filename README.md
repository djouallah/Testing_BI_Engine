# Testing Query Engine using TPC-H

it started as testing BigQuery BI engine, but I did found it easy, it is easy to test other Engine too, Please check this blog for Background

https://datamonkeysite.com/2022/01/07/benchmark-snowflake-bigquery-singlestore-and-databricks-using-tpc-h-sf10/

Disclosure : the Original Purpose of the Benchmark is hopefully to push the Product team to make all Queries accelerated by BI Engine :)



Unfortunately not all Queries are accelerated by BigQuery BI Engine (Currently only 6)

Currently BI Engine is limited to a join with 5 Million Dimension Table

up to 5 Joins are supported

see Current Limitations
https://cloud.google.com/bi-engine/docs/sql-interface-overview#limitations

TPC-H SF10 use up to 8 joins and a dimension Table with 15 Million Records.

TPC-H reference : http://tpc.org/tpc_documents_current_versions/pdf/tpc-h_v3.0.0.pdf

Results for BI Engine Only : https://datastudio.google.com/reporting/b162bcc1-baee-4af5-995f-6155c939d742/page/p_v72vuqfvqc

TPCH,Snowflake,SingleStore,BigQuery,Databricks (SF05),DuckDB,Synapse-serverless
'--Query01,1.5,0.99,0.31,1.4,5.393445,9
'--Query02,1.37,0.56,1.834,0.939,0.843777,15
'--Query03,0.88,0.67,1.567,1.68,3.492776,23
'--Query04,0.78,1.33,0.965,1.36,4.707213,31
'--Query05,1.14,0.69,2.941,2.54,3.883179,36
'--Query06,0.36,0.38,0.225,0.554,2.845355,37
'--Query07,1.09,1.53,1.885,1.95,6.794438,44
'--Query08,1.25,0.49,1.949,1.66,4.472477,57
'--Query09,1.81,3.16,1.951,2.25,27.101742,60
'--Query10,1.23,1.8,1.581,2,3.932361,60
'--Query11,0.62,0.19,0.986,0.866,0.613395,60
'--Query12,0.92,0.4,0.698,1.21,4.853902,60
'--Query13,2.18,7.47,1.1545,2.27,3.271795,120
'--Query14,0.44,0.35,0.879,1.2,3.295735,120
'--Query15,0.79,1.18,0.781,1.22,6.634146,120
'--Query16,0.76,1.41,4.4305,1.43,1.020363,120
'--Query17,0.7,0.46,2.484,1.75,5.412079,120
'--Query18,1.58,2.72,2.4615,2.37,6.935358,180
'--Query19,0.68,0.43,0.346,1.25,4.846258,180
'--Query20,0.83,4.55,1.0495,1.45,3.496862,180
'--Query21,1.44,1.58,1.7745,4.15,12.389197,180
'--Query22,0.77,0.83,1.2525,1.01,1.157418,180
,23.12,33.17,33.505,36.509,117.393271,1992
