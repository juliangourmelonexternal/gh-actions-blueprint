
    
    

select
    book_id as unique_field,
    count(*) as n_records

from DBT_Julian_ist_der_Beste.TEST_SCHEMA_3.book_loans
where book_id is not null
group by book_id
having count(*) > 1


