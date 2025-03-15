with car_avg_positions as (
    select cl."class",
        c."name" as car,
        avg(res.position) as average_position,
        count(res.race) as race_count
    from results res
    join cars c on res.car = c."name"
    join classes cl on c."class" = cl."class"
    group by cl."class", c."name"
),
low_position_cars as (
    select "class", car,
        average_position,
        race_count
    from car_avg_positions
    where average_position > 3.0
),
class_low_position_counts as (
    select "class", count(car) as low_position_count
    from low_position_cars
    group by "class"
),
max_low_position_class as (
    select "class"
    from class_low_position_counts
    where low_position_count = (
        select max(low_position_count) from class_low_position_counts
    )
)
select lpc.car as car_name, lpc."class" as car_class, lpc.average_position,
    lpc.race_count, cl.country as car_country,
    (select count(*) from results r
     join cars ca on r.car = ca.name
     where ca.class = lpc.class) as total_races
from low_position_cars lpc
join classes cl on lpc."class" = cl."class"
join max_low_position_class mlpc on lpc."class" = mlpc."class"
order by lpc."class", lpc.average_position;
