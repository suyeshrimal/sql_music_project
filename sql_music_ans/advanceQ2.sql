-- Q2. We want to find out the most popular music genre for each country.
-- We determine the most popular genre as the genre with the highest amount
-- of purchases. Write a query that returns each country along with the top genre.
-- For countries where the maximum number of purchases is shared return all Genres

with my_cte AS(
	select count(invoice_line.quantity) as purchases,
	customer.country,genre.name from invoice_line
	inner join invoice on  invoice_line.invoice_id=invoice.invoice_id
	inner join customer on invoice.customer_id=customer.customer_id
	inner join track on track.track_id=invoice_line.track_id
	inner join genre on track.genre_id=genre.genre_id

	group by 2,3
	order by 1 desc
)
select * from my_cte
