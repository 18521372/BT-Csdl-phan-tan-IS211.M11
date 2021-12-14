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