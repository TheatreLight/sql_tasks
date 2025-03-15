select v.maker , v.model from vehicle v 
join motorcycle m on m.model = v.model 
where m.horsepower > 150 and m.price < 20000 and m.type = 'Sport'
order by m.horsepower asc;