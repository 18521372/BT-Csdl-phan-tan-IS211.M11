--- CHI NHANH HO CHI MINH ---


--- Xem muc co lap ---
declare 
           trans_id Varchar2(100);
        begin
           trans_id := dbms_transaction.local_transaction_id( TRUE );
        end;
        
SELECT s.sid, s.serial#,
       CASE BITAND(t.flag, POWER(2, 28))
          WHEN 0 THEN 'READ COMMITTED'
          ELSE 'SERIALIZABLE'
       END AS isolation_level
    FROM v$transaction t 
    JOIN v$session s ON t.addr = s.taddr AND s.sid = sys_context('USERENV', 'SID');




--- Lost update ---
--- --- Read Commited --- ---

update HN.car@HN_dblink
set rentcost = 3333333
where carid = 'XE0022';

commit;

select * from HN.car@HN_dblink

--- --- SERIALIZABLE --- ---

ALTER SESSION SET ISOLATION_LEVEL=SERIALIZABLE;
commit;

update HN.car@HN_dblink
set rentcost = 2500000
where carid = 'XE0022';

commit;


--- Non Repeatable ---
--- --- Read Commited --- ---

ALTER SESSION SET ISOLATION_LEVEL=Read Committed;
commit;

update HN.car@HN_dblink
set rentcost = 2500000
where carid = 'XE0022';

commit;


--- --- SERIALIZABLE --- ---

ALTER SESSION SET ISOLATION_LEVEL=SERIALIZABLE;
commit;

update HN.car@HN_dblink
set rentcost = 3500000
where carid = 'XE0022';

commit;


--- Phantom Read ---
--- --- Read Commited --- ---

ALTER SESSION SET ISOLATION_LEVEL=Read Committed;
commit;

select count(*) from HN.car@HN_dblink

commit;

--- --- SERIALIZABLE --- ---

ALTER SESSION SET ISOLATION_LEVEL=SERIALIZABLE;
commit;

select count(*) from HN.car@HN_dblink

commit;


--- Dead lock ---
--- --- Read Commited --- ---

ALTER SESSION SET ISOLATION_LEVEL=Read Committed;
commit;

update HN.car@HN_dblink
set rentcost = 5500000
where carid = 'XE0023';

update HN.car@HN_dblink
set rentcost = 2200000
where carid = 'XE0022';

commit;

select * from HN.car@HN_dblink

--- --- SERIALIZABLE --- ---

ALTER SESSION SET ISOLATION_LEVEL=SERIALIZABLE;
commit;

update HN.car@HN_dblink
set rentcost = 6600000
where carid = 'XE0023';

update HN.car@HN_dblink
set rentcost = 7700000
where carid = 'XE0022';

commit;

select * from HN.car@HN_dblink

--- CHI NHANH HA NOI ---


--- Xem muc co lap ---
declare 
           trans_id Varchar2(100);
        begin
           trans_id := dbms_transaction.local_transaction_id( TRUE );
        end;
        
SELECT s.sid, s.serial#,
       CASE BITAND(t.flag, POWER(2, 28))
          WHEN 0 THEN 'READ COMMITTED'
          ELSE 'SERIALIZABLE'
       END AS isolation_level
    FROM v$transaction t 
    JOIN v$session s ON t.addr = s.taddr AND s.sid = sys_context('USERENV', 'SID');




--- Lost update ---
--- --- Read Commited --- ---

SELECT * from car;

UPDATE car
SET rentcost = 1377000
WHERE carid = 'XE0022';

COMMIT;

SELECT * from car;

--- --- SERIALIZABLE --- ---

ALTER SESSION SET ISOLATION_LEVEL = SERIALIZABLE;
commit;

SELECT * from car;

UPDATE car
SET rentcost = 8745000
WHERE carid = 'XE0022';

COMMIT;

SELECT * from car;


--- Non Repeatable ---
--- --- Read Commited --- ---

ALTER SESSION SET ISOLATION_LEVEL = Read Committed;
commit;

SELECT * from car;

--- --- SERIALIZABLE --- ---

ALTER SESSION SET ISOLATION_LEVEL = SERIALIZABLE;
commit;

SELECT * from car;

COMMIT;

SELECT * from car;


--- Phantom Read ---
--- --- Read Commited --- ---

ALTER SESSION SET ISOLATION_LEVEL = Read Committed;
commit;

SELECT count(*) from car;

INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0043', 'USER054', 'FORD F1', 'T005', '75Y1-65731', 'Available', 71000000, '2020-11-22', 'Xang');

COMMIT;

--- --- SERIALIZABLE --- ---

ALTER SESSION SET ISOLATION_LEVEL = SERIALIZABLE;
commit;

select count(*) from car;

INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0045', 'USER078', 'FORD F1', 'T005', '75Y1-12331', 'Available', 72000000, '2020-11-22', 'Xang');

COMMIT;


--- Dead lock ---
--- --- Read Commited --- ---

ALTER SESSION SET ISOLATION_LEVEL = Read Committed;
commit;

SELECT * from car;

UPDATE car
SET rentcost = 1377000
WHERE carid = 'XE0022';

UPDATE car
SET rentcost = 953000
WHERE carid = 'XE0023';

COMMIT;

SELECT * from car;

--- --- SERIALIZABLE --- ---

ALTER SESSION SET ISOLATION_LEVEL = SERIALIZABLE;
commit;

SELECT * from car;

UPDATE car
SET rentcost = 13945000
WHERE carid = 'XE0022';

UPDATE car
SET rentcost = 98730000
WHERE carid = 'XE0023';

COMMIT;

SELECT * from car;


