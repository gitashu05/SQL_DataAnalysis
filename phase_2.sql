select * from employee;
select * from genre;
select * from track;
select * from album;
select * from artist;
-- Write a query to return email,first_name,last_name & Genre of all Rock Music Listners.
-- Return your list ordered Alphabatically Email starting with A

select distinct customer.email as c_email, customer.first_name as c_fname,customer.last_name as c_lname 
from customer
Join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice_line.invoice_id=invoice.invoice_id
join track on track.track_id=invoice_line.track_id
join genre on genre.genre_id=track.genre_id
where genre.name='Rock'
order by customer.email;
--   OR  --
select distinct email,first_name,last_name
from customer
Join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice_line.invoice_id=invoice.invoice_id
where track_id In(
select track_id from track
	join genre on track.genre_id=genre.genre_id
	where genre.name Like 'Rock'
)
order by email;

-- write the query that returns the artist name and return the track count of top 10 rock band.

select artist.name,count(artist.artist_id) as no_of_songs
from artist
join album on artist.artist_id=album.artist_id
join track on album.album_id=track.album_id
join genre on track.genre_id=genre.genre_id
where genre.name='Rock'
group by artist.name
order by no_of_songs desc
limit 10;

-- return all the names that has song length greater than the average song length.return the name and milliseconds of each track.
-- order by the song length with the longest song listed first.
select name,milliseconds 
from track
where milliseconds >
(
	select avg(milliseconds) as avg_milliseconds
from Track
)
order by milliseconds desc;