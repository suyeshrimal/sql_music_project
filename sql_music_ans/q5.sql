Q5. Who is the best customer?

select * from customer
select * from invoice

select first_name,last_name,sum(total) as total
from customer 
inner join invoice
on customer.customer_id=invoice.customer_id
group by first_name,last_name
order by total desc
limit 1
