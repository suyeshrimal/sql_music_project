-- Q3. write a Query that determines the customer that has spent the
-- most on music for each country. Write a query that returns the
-- country along with the top consumer and how much they spent. 
-- For countries where the top amount spent is shared, provide all
-- customers who spent this amount.


with my_cte As (
	select customer.first_name,customer.last_name,
	sum(total) as total_spent,
	invoice.billing_country from invoice 
	inner join customer on invoice.customer_id=customer.customer_id
	group by 1,2,4
	order by 3 desc
)

select * from my_cte 

