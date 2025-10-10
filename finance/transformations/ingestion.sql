create streaming table bronze.customers as
select *,current_timestamp() as ingestion_date from stream read_files("/Volumes/finance/default/raw/customers/",format=>"csv");

create streaming table bronze.transactions as
select *,current_timestamp() as ingestion_date from stream read_files("/Volumes/finance/default/raw/Transactions/",format=>"csv");

create streaming table accounts as 

SELECT *, current_timestamp() as ingestion_date FROM stream read_files(
  '/Volumes/finance/default/raw/accounts/',
  format => 'json',
  multiline =>'true'
);

 
create streaming table branches as 
SELECT *, current_timestamp() as ingestion_date FROM stream read_files(
  '/Volumes/finance/default/raw/branches/',
  format => 'json',
  multiline =>'true'
)