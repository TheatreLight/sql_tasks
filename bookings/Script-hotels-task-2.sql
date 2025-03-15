select c.id_customer, c.name, 
	count(b.id_customer) as booking_amount, 
	count(distinct h.name) as hotels,
	sum(r.price) as price 
from customer c
join booking b on b.id_customer = c.id_customer
join room r on r.id_room = b.id_room 
join hotel h on r.id_hotel = h.id_hotel
group by c.id_customer, c.name 
having count(distinct h.name) > 1 and count(b.id_customer) > 2
intersect
select c.id_customer, c.name, 
	count(b.id_customer) as booking_amount, 
	count(distinct h.name) as hotels,
	sum(r.price) as price 
from customer c
join booking b on b.id_customer = c.id_customer
join room r on r.id_room = b.id_room 
join hotel h on r.id_hotel = h.id_hotel
group by c.id_customer, c.name 
having sum(r.price) > 500
order by price asc;



