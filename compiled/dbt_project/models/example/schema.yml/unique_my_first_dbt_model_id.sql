
    
    

select
    id as unique_field,
    count(*) as n_records

from DBT_Julian_ist_der_Beste.TEST_SCHEMA_3.my_first_dbt_model
where id is not null
group by id
having count(*) > 1


