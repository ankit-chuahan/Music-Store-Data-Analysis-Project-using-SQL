-- Q1: Who is the senior most employee based on job title? 

select (first_name ||' '|| last_name) Full_name , title  
from employee
order by levels Desc 
limit 1


--  Q2: Which countries have the most Invoices? 

SELECT  billing_country ,COUNT(*) AS invoice_count_
FROM invoice
GROUP BY billing_country
ORDER BY invoice_count_ DESC

--  Q3: What are top 3 values of total invoice? 

select  round(total) as total_count
from invoice
order by total_count desc
limit 3

/*  Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
 Write a query that returns one city that has the highest sum of invoice totals. 
 Return both the city name & sum of all invoice totals */

select billing_city, round(sum(total))As total_sum
from invoice
group by billing_city
order by total_sum desc
limit 1

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

select (first_name ||' '||last_name) As full_name , round(sum(total)) As total_spending
from customer c
inner join invoice i 
on c.customer_id = i.customer_id
group by full_name
order by total_spending desc
limit 1

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

select distinct c.first_name , c.last_name ,g.name ,c.email
from customer c 
inner join invoice i on c.customer_id = i.customer_id
inner join invoice_Line il on i.invoice_id = il.invoice_id
inner join track t on il.track_id = t.track_id
inner join genre g on t.genre_id = g.genre_id
where g.name='Rock'


/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */



select a.name,count(*) As  track_count
from artist As a
inner join album As Al on a.artist_id =Al.artist_id
inner join track As T  on Al.album_id = T.album_id
inner join genre As G on T.genre_id = G.genre_id
where G.name ='Rock'
group by a.name
order by track_count desc
limit 10

/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
					  

select name,milliseconds
from track
where  milliseconds > (select round(avg(milliseconds),2)  As avg_len
					  from track 
					  order by avg_len )

--  Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent 


select * from genre
select * from artist
select * from track
select * from album