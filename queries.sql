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


-- 2. Dua ra thong tin khach hang (usedid, fullname, gender, branch) voi rolename la 'Nguoi dung' cua tat ca cac chi nhanh --

select userid, fullname, gender, branch, rolename
from roles_ r, users_ u
where r.roleid = u.roleid and rolename = 'Nguoi dung'
union
select userid, fullname, gender, branch, rolename
from roles_ r, HCM.users_@DBL_HCM u
where r.roleid = u.roleid and rolename = 'Nguoi dung';


-- 3. Tim hang xe co o chi nhanh Ha Noi nhung khong co o chi nhanh Ho Chi Minh --

select b.brandid, brandname
from brands b, car c
Where c.brandid = b.brandid
minus
select b.brandid, brandname
from brands b, HCM.car@DBL_HCM c
Where c.brandid = b.brandid;

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


-- 6. Tim xe o tinh trang Available va co gia thue nho hon 50000000 o ca hai chi nhanh --

select carid, status, rentcost, branch
from car c1, users_ u1
where c1.ownerid = u1.userid and status = 'Available' and rentcost < 50000000
union
select carid, status, rentcost, branch
from HCM.car@DBL_HCM c1, HCM.users_@DBL_HCM u1
where c1.ownerid = u1.userid and status = 'Available' and rentcost < 50000000
