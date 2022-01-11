# Testing BigQuery BI Engine using TPC-H

Disclosure : the Purpose of the Benchmark is hopefully to push the Product team to make all Queries accelerated by BI Engine :)

Unfortunately not all Queries are accelerated by BigQuery BI Engine (Currently only 6)

Currently BI Engine is limited to a join with 5 Million Dimension Table

up to 5 Joins are supported

see Current Limitations
https://cloud.google.com/bi-engine/docs/sql-interface-overview#limitations

TPC-H SF10 use up to 8 joins and a dimension Table with 15 Million Records.

TPC-H reference : http://tpc.org/tpc_documents_current_versions/pdf/tpc-h_v3.0.0.pdf

Results : https://datastudio.google.com/reporting/b162bcc1-baee-4af5-995f-6155c939d742/page/p_v72vuqfvqc
