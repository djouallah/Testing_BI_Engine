import duckdb 
con = duckdb.connect(database='C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/db/tpch.duckdb')


df=con.execute('''
INSERT INTO  partsupp  select *  FROM 'C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/Parquet/partsupp.parquet';
INSERT INTO part  select * FROM 'C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/Parquet/part.parquet' ;
INSERT INTO supplier  select * FROM 'C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/Parquet/supplier.parquet' ;
INSERT INTO nation  select * FROM 'C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/Parquet/nation.parquet';
INSERT INTO region  select * FROM 'C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/Parquet/region.parquet' ;
INSERT INTO lineitem   SELECT * FROM 'C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/Parquet/lineitem/lineitem.parquet';
INSERT INTO orders   select * FROM 'C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/Parquet/orders.parquet' ;
INSERT INTO customer   select * FROM 'C:/Users/mimoune.djouallah/Desktop/TPC-H-SF10/Parquet/customer.parquet'
''')