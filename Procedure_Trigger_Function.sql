--- PROCEDURE ---
-- Doi khach hang va tat ca xe cua khach hang do tu chi nhanh Ho Chi Minh sang Ha Noi --

CREATE OR REPLACE PROCEDURE Doichinhanh (user_id IN varchar2 )
IS
  var_userid varchar2(10);
  var_fullname varchar2(40) ;
  var_email varchar2(40) ;
  var_adress varchar2(40) ;
  var_gender varchar2(10) ;
  var_idcard varchar2(40) ;
  var_password_users varchar2(100) ;
  var_phonenumber varchar2(10) ;
  var_roleid number ;
  var_branch varchar2(40);
  var_carid varchar2(10) ;
  var_carname varchar2(40) ;
  var_carNumberPlate varchar2(40) ;
  var_status varchar2(2) ;
  var_rentcost number ;
  var_postdated date ;
  var_brandid varchar2(100) ;
  var_fuel varchar2(10);
  
CURSOR CUR IS      SELECT carid                	          
FROM car
                	            WHERE ownerid= user_id;
 
BEGIN
SELECT * INTO
var_userid,var_fullname,var_email,var_adress,var_gender,var_idcard,var_password_users,var_phonenumber,var_roleid, var_branch
        	FROM users_
WHERE userid=user_id;
INSERT INTO
HN.users_@HN_dblink(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid, Branch)
 
VALUES
(var_userid,var_fullname,var_email,var_adress,var_gender,var_idcard,var_password_users,var_phonenumber,var_roleid, 'Ha Noi');
        	OPEN CUR;
	   LOOP
    	            FETCH CUR INTO var_carid;
EXIT WHEN CUR%NOTFOUND;
SELECT carid,carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel into
var_carid,var_carname,var_brandid,var_carNumberPlate,var_status,var_rentcost,var_postdated,var_fuel
FROM car
WHERE carid=var_carid;
        	INSERT INTO
HN.car@HN_dblink (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel)
VALUES
(var_carid, user_id,var_carname,var_brandid,var_carNumberPlate,var_status,var_rentcost,var_postdated,var_fuel);
END LOOP;
CLOSE CUR;
DELETE FROM car WHERE ownerid= user_id;
DELETE FROM users_ WHERE userid= user_id;
END;

-- Doi USER004 va xe cua USER004 --
BEGIN
Doichinhanh ('USER004');
END;
COMMIT;


--- TRIGGER ---

CREATE OR REPLACE TRIGGER RBTV_CONTRACT
BEFORE INSERT OR UPDATE
   ON CONTRACT
   FOR EACH ROW
 
DECLARE
   End_date Date;
 
BEGIN
 Select distinct enddate  into End_date from contract ct
where ct.carid=:new.carid  AND NOT EXISTS
(
        	Select * from contract ktct where ktct.enddate >ct.enddate AND ktct.carid=:new.carid
);
if ( :New.startdate<End_date or :New.startdate<sysdate)
then  RAISE_APPLICATION_ERROR(-20100,'ngay bat dau khong hop le');
end if;
END;

-- Thu insert mot dong du lieu --
INSERT INTO contract (userid, carid, startdate, enddate) VALUES ('USER035', 'XE0037','2021-08-15', '2021-07-17');


--- FUNCTION ---

CREATE OR REPLACE FUNCTION TinhTien (startdate IN Date,enddate IN Date, rentcost IN number)
RETURN number IS
   ThanhTien number;
BEGIN
ThanhTien :=(enddate-startdate+1)*rentcost; 
RETURN ThanhTien;
END;

-- Thu tinh gia tien --
SET SERVEROUTPUT ON;
EXECUTE dbms_output.put_line('Thanh tien: ' || TinhTien('2021-4-7', '2021-4-13', 55000000));

