# Testing Query Engine using TPC-H

it started as testing BigQuery BI engine, but I did found it easy to test other Engine too, Please check this blog for Background

https://datamonkeysite.com/2022/01/07/benchmark-snowflake-bigquery-singlestore-and-databricks-using-tpc-h-sf10/

so Far Tested Snowflake, BigQuery, Databrciks SQL, DuckDB, Synpase Serverless, SQL Server with Coumnstore and AlloyDB

it is not supposed to be very accurate or an official benchmark, but just to get a general impression of the performance.

TPC-H reference : http://tpc.org/tpc_documents_current_versions/pdf/tpc-h_v3.0.0.pdf


# Note Regarding Synapse Serverless

Synapse Serverless seems to have a limitation where if you send more than 4 Queries, the Queries start to became very slow.


# Note Regarding AlloyDB

I had to add a lot of index to make AlloyDB finish in a resonable time, for example Query 20 take up to 30 minutes without foreign key index. 



# Note Regarding BigQuery BI Engine


The Original Purpose of the Benchmark was to troll BiQuery Product team to make all Queries accelerated by BI Engine :)


Unfortunately not all Queries are accelerated by BigQuery BI Engine (Currently only 6)

Currently BI Engine is limited to a join with 5 Million Dimension Table

up to 5 Joins are supported

see Current Limitations
https://cloud.google.com/bi-engine/docs/sql-interface-overview#limitations

TPC-H SF10 use up to 8 joins and a dimension Table with 15 Million Records.



Results for BI Engine Only : https://datastudio.google.com/reporting/b162bcc1-baee-4af5-995f-6155c939d742/page/p_v72vuqfvqc


