Q4. Which city has the best customers?

select * from customer
select * from invoice

select sum(total) as total,billing_city from invoice
group by billing_city
order by total desc
