Q1. Write query to return the email, first name, last name 
	and Genre of all Rock Music listeners. Returm your list ordered 
	alphabetically by email starting with A


Select distinct email,first_name,last_name
from customer
inner join invoice on customer.Customer_Id=invoice.Customer_Id
inner join invoice_line on Invoice.Invoice_Id=Invoice_Line.Invoice_Id
where track_id in(
	select track_id from track
	join genre 
	on track.genre_id=genre.genre_id
	where genre.name='Rock'
)
order by email Asc
