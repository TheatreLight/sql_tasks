select c.name, c.email, c.phone, 
	count(b.id_customer) as booking_amount, 
	string_agg(distinct h.name, ', ') as hotels,
	sum(b.check_out_date - b.check_in_date) as days
from customer c
join booking b on b.id_customer = c.id_customer
join room r on r.id_room = b.id_room 
join hotel h on r.id_hotel = h.id_hotel
group by c.name, c.email, c.phone
having count(distinct h.name) > 1
order by booking_amount desc;


