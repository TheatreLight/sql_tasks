with avg_class_positions as (
    select cl."class",
        avg(res."position") as average_position,
        count(res.race) as total_races
    from results res
    join cars c on res.car = c."name"
    join classes cl on c."class" = cl."class"
    group by cl."class"
),
avg_car_positions as (
    select cl."class",
        c."name" as car,
        avg(res."position") AS average_position,
        count(res.race) as race_count
    from results res
    join cars c on res.car = c."name"
    join classes cl on c."class" = cl."class"
    group by cl."class", c."name"
)
select acp.car as car_name,
	acp."class" as car_class,
    acp.average_position,
    acp.race_count,
    cl.country as car_country,
    acp.race_count + acp.race_count - 1 as total_races
from avg_car_positions acp
join classes cl on acp."class" = cl."class"
where acp."class" in (
        select "class"
        from avg_class_positions
        where average_position = (
            select min(average_position) from avg_class_positions
        )
    )
order by acp.average_position, acp.car;
