-- Q2. Let's invite the artists who have written the most rock music in our dataset. 
-- 	Write a query that returns the artist name and 
-- 	total track count of the top 10 rock bands.

select artist.artist_id,artist.name,count(artist.artist_id) as Number_of_songs
from artist 
join album on artist.artist_id=album.artist_id
join track on album.album_id=track.album_id
join genre on track.genre_id=genre.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by Number_of_songs desc
limit 10

	
