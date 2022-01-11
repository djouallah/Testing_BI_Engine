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

