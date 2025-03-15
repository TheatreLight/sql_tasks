select v.maker , v.model , c.horsepower , c.engine_capacity , 'Car' as type 
from car c
join vehicle v on v.model = c.model 
where c.horsepower > 150 and c.engine_capacity < 3 and c.price < 35000
union
select v.maker , v.model , m.horsepower , m.engine_capacity , 'Motorcycle' as type 
from motorcycle m
join vehicle v on v.model = m.model 
where m.horsepower > 150 and m.engine_capacity < 1.5 and m.price < 20000
union
select v.maker , v.model , 0 as horsepower , null as engine_capacity , 'Bicycle' as type 
from bicycle b 
join vehicle v on v.model = b.model 
where b.gear_count > 18 and b.price < 4000
order by horsepower desc;