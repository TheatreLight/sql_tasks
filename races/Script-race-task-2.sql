with avg_positions as (
    select c."class",
        res.car,
        avg(res."position") as average_position,
        count(res.race) as race_count
    from results res
    join cars c on res.car = c."name"
    group by c."class", res.car
)
select ap.car as car_name,
	ap."class" as car_class,
    ap.average_position,
    ap.race_count,
    c.country as car_country
from avg_positions ap
join classes c on ap."class" = c."class"
where ap.average_position = (
        select min(average_position)
        from avg_positions
    )
order by ap.average_position, ap.car
limit 1;
