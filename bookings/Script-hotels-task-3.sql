select c.id_customer , c."name" , 
	case
		when max(ch.category) = 0 then 'cheap'
		when max(ch.category) = 1 then 'medium'
		when max(ch.category) = 2 then 'expensive'
	end 
	as preferred_hotel_type, 
	string_agg(distinct h."name", ',') as visited_hotels 
from customer c
join booking b on b.id_customer = c.id_customer 
join room r on r.id_room = b.id_room 
join hotel h on h.id_hotel = r.id_hotel
join (select
	h.id_hotel ,
	case 
		when avg(r.price) < 175 then 0
		when avg(r.price) between 175 and 300 then 1
		when avg(r.price) >= 300 then 2
	end
	as category
from hotel h
join room r on h.id_hotel = r.id_hotel 
group by h.id_hotel) as ch on ch.id_hotel = h.id_hotel 
group by  c.id_customer,c."name"
order by max(ch.category) ;





