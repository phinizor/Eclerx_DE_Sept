create streaming table finance.silver.customer_clean
(CONSTRAINT valid_customer_id EXPECT (customer_id is not null) on violation drop row,
constraint valid_number_no EXPECT (phone is not null)
)
as 
select distinct * from stream finance.bronze.customers