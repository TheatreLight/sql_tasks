with avg_positions as (
    select c."class",
        res.car,
        avg(res."position") as average_position,
        count(res.race) as race_count
    from results res
    join cars c on res.car = c."name"
    group by c."class", res.car
),
min_avg_positions as (
    select "class", min(average_position) as min_avg_position
    from avg_positions
    group by "class"
)
select ap.car as car_name,
    ap."class" as car_class,
    ap.average_position,
    ap.race_count
from avg_positions ap
join min_avg_positions mavp on ap."class" = mavp."class" and ap.average_position = mavp.min_avg_position
order by ap.average_position;
