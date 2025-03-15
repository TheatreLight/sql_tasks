with class_avg_positions as (
    select cl.class, avg(res."position") as class_avg_position
    from results res
    join cars c on res.car = c."name"
    join classes cl on c."class" = cl."class"
    group by cl."class"
    having count(c."name") > 1
),
car_avg_positions as (
    select cl."class",
        c."name" as car,
        avg(res."position") as average_position,
        count(res.race) as race_count
    from results res
    join cars c on res.car = c."name"
    join classes cl on c."class" = cl."class"
    group by cl."class", c."name"
)
select cap.car as car_name,
    cap."class" as car_class,
    cap.average_position,
    cap.race_count,
    cl.country as car_country
from car_avg_positions cap
join class_avg_positions cap_class on cap."class" = cap_class."class"
join Classes cl on cap."class" = cl."class"
where cap.average_position < cap_class.class_avg_position
order by cap."class", cap.average_position;
