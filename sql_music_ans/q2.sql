Q2. Which countries have the most invoices?

select count(invoice_id) as c,billing_country
from invoice
group by billing_country
order by c desc


