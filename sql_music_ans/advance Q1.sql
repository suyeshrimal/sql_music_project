-- Q1. find how much amount spent by each customer on artists? 
-- 	Write a query to return customer name, artist name and total spent

with best_artist as (
	select artist.artist_id,artist.name as artist_name, 
	sum(invoice_line.unit_price*invoice_line.quantity) as total_sales
	from artist join album on artist.artist_id=album.artist_id
	join track on album.album_id=track.album_id
	join invoice_line on track.track_id=invoice_line.track_id
	group by 1
	order by 3 desc
	limit 1
)
select c.customer_id,c.first_name,c.last_name,bs.artist_name,
sum(il.unit_price*il.quantity) as Amount_spent
from invoice i
join customer c On c.customer_id = i.customer_id
join invoice_line il on il.invoice_id = i.invoice_id
join track t on t.track_id=il.track_id
join album alb on alb.album_id =t.album_id
join best_artist as bs on bs.artist_id=alb.artist_id
group by 1,2,3,4
order by 5 desc;
