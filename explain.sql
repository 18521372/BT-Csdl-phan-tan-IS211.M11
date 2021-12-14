EXPLAIN

Câu truy vấn ban đầu:
SELECT /*+ GATHER_PLAN_STATISTICS */ distinct u.userid,fullname
FROM contract ct, brands b, users_ u, roles_ r, car c
WHERE ct.userid = u.userid
AND c.carid = ct.carid
AND c.brandid = b.brandid
AND r.roleid = u.roleid
AND enddate >= '2021-08-11'
AND nation = 'Japan'
AND gender = 'Female'
AND rentcost >= 5000000
AND rolename = 'Nguoi dung';

Xem bảng EXPLAIN QUERY:
SELECT * FROM TABLE(DBMS_XPLAN.display_cursor(format=>'ALLSTATS LAST'));

Câu truy vấn sau khi tối ưu hoá:
SELECT /*+ GATHER_PLAN_STATISTICS */ distinct C.userid,fullname
FROM ( SELECT A.userid, fullname
            FROM (SELECT userid, fullname, roleid FROM users_ WHERE gender = 'Female')A  
JOIN
                    	(SELECT roleid FROM roles_ WHERE rolename = 'Nguoi dung')B
                        ON A.roleid = B.roleid) C
 JOIN
	 (SELECT D.userid
	   FROM (SELECT userid,carid FROM contract WHERE enddate>='2021-08-11')D
	JOIN
	  (SELECT carid
    	   FROM (SELECT brandid FROM brands WHERE nation = 'Japan') G
      JOIN
(SELECT carid, brandid FROM car WHERE rentcost >= 5000000)H
ON G.brandid = H.brandid)F
        	ON F.carid = D.carid)E
ON E.userid = C.userid;

Xem bảng EXPLAIN QUERY:
SELECT * FROM TABLE(DBMS_XPLAN.display_cursor(format=>'ALLSTATS LAST'));

