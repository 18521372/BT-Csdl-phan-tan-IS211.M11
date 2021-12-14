-- 1. Tim xe duoc nhieu khach thue nhat trong nam 2021 o hai chi nhanh --

SELECT c.carid, carname, brandid, COUNT(*) as SO_LAN
FROM contract ct, 
(select * from car
union 
select * from  HN.car@HN_dblink) c
where c.carid = ct.carid
and extract(year from startdate) = 2021
group by c.carid, carname, brandid
HAVING COUNT(*) = (SELECT MAX(COUNT(carid))
                   FROM contract
                   WHERE extract(year from startdate) = 2021
                   group by carid);


-- 4. Tim xe co ca khach hang nam va nu thue o ca hai chi nhanh --

(select carid from contract,
(select * from users_
union 
select * from  HN.users_@HN_dblink) U
where contract.userid = U.userid
and gender = 'Male' )
intersect
(select carid from contract,
(select * from users_
union 
select * from  HN.users_@HN_dblink) U
where contract.userid = U.userid
and gender = 'Female' );


-- 5. Tinh so tien moi khach hang da chi de thue xe, sap xep theo thu tu giam dan --

select U.userid, sum( (enddate- startdate+1)* rentcost )as Tong_tien
from contract ct,
(select * from users_
union
select * from  HN.users_@HN_dblink) U,
(select * from car
union 
select * from  HN.car@HN_dblink) c
where ct.userid = U.userid
and c.carid = ct.carid
group by (U.userid)
order by Tong_tien DESC
