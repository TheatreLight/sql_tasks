with recursive org_tbl as (
select employeeid, managerid, "name", departmentid , roleid 
    from employees
    where managerid is null
    union all
    select e.employeeid , e.managerid , e."name", e.departmentid , e.roleid  
    from employees e
    join org_tbl o ON e.managerid = o.employeeid
)
select ot.employeeid, ot."name", ot.managerid, 
	d.departmentname, r.rolename,  
	string_agg(p.projectname, ', ') as projects,
	string_agg(t.taskname, ', ') as tasks,
	count(t.taskid) as total_tasks,
	(select count(*) from employees e2 where e2.managerid = ot.employeeid) as total_subordinates
from org_tbl ot
join departments d on d.departmentid = ot.departmentid
join roles r on r.roleid = ot.roleid
left join tasks t on t.assignedto = ot.employeeid
left join projects p on t.projectid = p.projectid 
group by ot.employeeid, ot."name", ot.managerid, 
	d.departmentname, r.rolename, p.projectname
having (select count(*) from employees e2 where e2.managerid = ot.employeeid) > 0
order by ot."name" ;