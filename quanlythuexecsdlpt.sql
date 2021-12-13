-- Tâm nè
-- Cơ sở dữ liệu: quanlythuexe
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng brands
--

CREATE TABLE brands (
  brandid varchar2(10) NOT NULL,
  brandname varchar2(40) NOT NULL,
  nation varchar2(40) NOT NULL
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng car
--

CREATE TABLE car (
  carid varchar2(10) NOT NULL,
  ownerid varchar2(10) NOT NULL,
  carname varchar2(40) NOT NULL,
  carNumberPlate varchar2(40) NOT NULL,
  status varchar2(40) NOT NULL,
  rentcost number NOT NULL,
  postdated date NOT NULL,
  brandid varchar2(100) NOT NULL,
  Fuel varchar2(10) NOT NULL
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng roles
--

CREATE TABLE roles_ (
  roleid number NOT NULL,
  rolename varchar2(40) NOT NULL,
  description_roles varchar2(40) NOT NULL
);



-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng contract
--

CREATE TABLE contract (
  userid varchar2(10) NOT NULL,
  carid varchar2(10) NOT NULL,
  startdate date NOT NULL,
  enddate date NOT NULL
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng users
--

CREATE TABLE users_ (
  userid varchar2(10) NOT NULL,
  fullname varchar2(40) NOT NULL,
  email varchar2(40) NOT NULL,
  address varchar2(40) NOT NULL,
  gender varchar2(10) NOT NULL,
  idcard varchar2(40) NOT NULL,
  password_users varchar2(100) NOT NULL,
  phonenumber varchar2(10) NOT NULL,
  roleid number NOT NULL,
  Branch varchar2(40)
);


--
--  Khóa cho bảng brands
--
ALTER TABLE brands
  ADD PRIMARY KEY (brandid);

--
--  Khóa cho bảng car
--
ALTER TABLE car
  ADD PRIMARY KEY (carid);

--
--  Khóa cho bảng usercar
--
ALTER TABLE contract
  ADD PRIMARY KEY (userid, carid, startdate);



--
--  Khóa cho bảng roles_
--
ALTER TABLE roles_
  ADD PRIMARY KEY (roleid);

--
--  Khóa cho bảng users_
--
ALTER TABLE users_
  ADD PRIMARY KEY (userid);

--
-- Các ràng buộc cho bảng car
--
ALTER TABLE car ADD CONSTRAINT user_id FOREIGN KEY (ownerid) REFERENCES users_ (userid);
ALTER TABLE car ADD CONSTRAINT brand_id FOREIGN KEY (brandid) REFERENCES brands (brandid);
--
-- Các ràng buộc cho bảng users_
--

ALTER TABLE users_ ADD CONSTRAINT roles_id FOREIGN KEY (roleid) REFERENCES roles_ (roleid);




INSERT INTO roles_ (roleid, rolename, description_roles) VALUES (1, 'Nguoi dung', 'Nguoi su dung web');
INSERT INTO roles_ (roleid, rolename, description_roles) VALUES (2, 'quan ly', 'Nguoi quan ly he thong');
INSERT INTO roles_ (roleid, rolename, description_roles) VALUES (0, 'Da Huy', 'Nguoi dung da huy tai khoan');
INSERT INTO roles_ (roleid, rolename, description_roles) VALUES (3, 'DEV', 'Developer');



INSERT INTO brands (brandid, brandname, nation) VALUES ('T001', 'FORD', 'USA');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T002', 'Honda', 'Japan');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T003', 'Hyundai', 'Korea');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T004', 'Toyota', 'Japan');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T005', 'Isuzu', 'Japan');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T006', 'KIA', 'Korea');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T007', 'Mercedes Benz', 'Germany');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T008', 'BMW', 'Germany');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T010', 'Audi', 'Germany');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T011', 'Lamborghini', 'Italia');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T012', 'Volvo', 'Switzerland');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T013', 'Maserati', 'Italia');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T014', 'Aston Martin', 'England');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T015', 'Bently', 'England');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T016', 'Vinfast', 'Vietnam');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T017', 'Mitsubishi', 'Japan');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T018', 'Chevrolet', 'USA');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T019', 'Lexus', 'Japan');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T020', 'Mazda', 'Japan');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T021', 'Nissan', 'Japan');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T022', 'Subaru', 'Japan');
INSERT INTO brands (brandid, brandname, nation) VALUES ('T023', 'Mini Cooper', 'England');



Chi nhanh HCM:
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER001','nguyen dang khoa','nguyen dang khoa@gmail.com','590 dang thi nhu','Male','750128893','jX9L8aGw','0750128893',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER002','la thi hoan','la thi hoan@gmail.com','102 bui thi xuan','Female','121748852','fWFaB4PF','0121748852',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER003','phan ngoc tham','phan ngoc tham@gmail.com','365 huynh thuc khang','Female','334502921','4RDa5H7p','0334502921',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER004','nguyen thuy hang','nguyen thuy hang@gmail.com','187 dong khoi','Female','384866316','tHUr8gDy','0384866316',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER005','pham van tu','pham van tu@gmail.com','353 dinh cong trang','Male','313848488','ff6x4pLJ','0313848488',0,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER006','nguyen hoang anh','nguyen hoang anh@gmail.com','590 nam ky khoi nghia','Male','051238687','E5K8Bpq2','0051238687',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER007','nguyen thi hong lien','nguyen thi hong lien@gmail.com','410 ham nghi','Female','281513032','AuB8dJSW','0281513032',1,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER008','nguyen thi van khanh','nguyen thi van khanh@gmail.com','131 nguyen cu trinh','Male','105742218','UrLnAmtt','0105742218',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER009','tran quoc huy','tran quoc huy@gmail.com','224 huyen quang','Male','943092417','y6dL3CZN','0943092417',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER010','le thi kim oanh','le thi kim oanh@gmail.com','14 de tham','Female','992189015','9FGsMdKE','0992189015',1,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER011','nguyen thi thu hang','nguyen thi thu hang@gmail.com','470 chuong duong','Female','703582865','eVdGKKLP','0703582865',1,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER012','nguyen duc phuong','nguyen duc phuong@gmail.com','45 hoang sa','Female','836860678','82J4kBt6','0836860678',0,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER013','dang thi to','dang thi to@gmail.com','586 dong khoi','Female','210281559','RydfWNtr','0210281559',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER014','nguyen quang hung','nguyen quang hung@gmail.com','467 nguyen canh chan','Male','897408391','Kh3P7x7X','0897408391',1,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER015','tran duc khang','tran duc khang@gmail.com','41 cong quynh','Male','073230289','rLKFNBLw','0073230289',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER016','ho thanh liem','ho thanh liem@gmail.com','41 nam quoc cang','Male','370440952','C9P9zjC3','0370440952',0,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER017','hoang thi ha','hoang thi ha@gmail.com','482 nguyen hue','Female','643910724','FqZwczxS','0643910724',0,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER018','bui thi thanh truc','bui thi thanh truc@gmail.com','109 ham nghi','Female','995667899','mNcBfeZw','0995667899',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER019','phan thi hong hue','phan thi hong hue@gmail.com','90 calmette','Female','081655561','rMMpCw2A','0081655561',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER020','truong ngoc phu','truong ngoc phu@gmail.com','36 bui thi xuan','Male','578985907','MUCj485y','0578985907',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER021','nguyen thanh tan','nguyen thanh tan@gmail.com','343 le van huu','Male','689952057','AP8yKNaG','0689952057',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER022','tran thi quynh tram','tran thi quynh tram@gmail.com','58 le van huu','Female','663736458','Yj9BRkBv','0663736458',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER023','tran thanh quang','tran thanh quang@gmail.com','349 bui vien','Male','202286328','PdHdyBf2','0202286328',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER024','nguyen the vinh','nguyen the vinh@gmail.com','591 nguyen dinh chieu','Male','150129478','ZAvtVGyT','0150129478',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER025','tran minh phat','tran minh phat@gmail.com','307 le anh xuan','Male','767977034','9deqNveh','0767977034',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER026','ho dac hoang','ho dac hoang@gmail.com','48 ho huan nghiep','Male','863305590','TuZDcWwC','0863305590',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER027','tran ngoc hung','tran ngoc hung@gmail.com','96 le lai','Male','632289560','aSs7PrWe','0632289560',1,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER028','pham minh hanh','pham minh hanh@gmail.com','165 le lai','Female','933552373','CTcuLMAF','0933552373',1,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER029','khong nguyen hoang long','khong nguyen hoang long@gmail.com','574 nam ky khoi nghia','Male','895249946','zrvUtUbH','0895249946',0,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER030','do cong thanh','do cong thanh@gmail.com','386 bui thi xuan','Male','510125253','kQgVHtH4','0510125253',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER031','nguyen thi hong nhung','nguyen thi hong nhung@gmail.com','395 cao ba quat','Female','953819882','taxk2xsC','0953819882',0,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER032','do quang thong','do quang thong@gmail.com','540 bui vien','Male','030088211','zWpasHxU','0030088211',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER033','le duc hoa','le duc hoa@gmail.com','396 ky con','Male','808635317','3zSt65Mz','0808635317',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER034','pham tho dung','pham tho dung@gmail.com','50 calmette','Male','863779925','W3gmEYye','0863779925',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER035','tran kim xuan','tran kim xuan@gmail.com','85 chuong duong','Female','274174638','ANEjAEBh','0274174638',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER036','vu dinh dung','vu dinh dung@gmail.com','27 le van huu','Male','029060739','HDxxdXwu','0029060739',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER037','bui xuan hinh','bui xuan hinh@gmail.com','489 de tham','Male','672175649','R4WjKKM4','0672175649',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER038','dinh van ngoan','dinh van ngoan@gmail.com','61 dinh cong trang','Male','409411123','VuMgBsm3','0409411123',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER039','phan chi dung','phan chi dung@gmail.com','259 le duan','Male','842429064','d8DNgq2J','0842429064',1,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER040','phan chi dung','phan chi dung@gmail.com','360 hai trieu','Male','674319639','BcgHv4gu','0674319639',0,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER041','pham tien nang','pham tien nang@gmail.com','188 nguyen cu trinh','Male','876256699','yfDLZNfL','0876256699',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER042','nguyen thi hoang lan','nguyen thi hoang lan@gmail.com','74 le loi','Female','628489294','cJ9zT8jv','0628489294',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER043','truong bao ngoc','truong bao ngoc@gmail.com','433 dong khoi','Female','868627396','etstEpQb','0868627396',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER044','tran ngoc quy','tran ngoc quy@gmail.com','543 le thanh ton','Male','829227253','zA94p2su','0829227253',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER045','dang ba tuan','dang ba tuan@gmail.com','243 huyen tran cong chua','Male','781474070','dxgcsVZx','0781474070',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER046','tran thien nhan','tran thien nhan@gmail.com','507 le thanh ton','Male','650415013','fphDBRXS','0650415013',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER047','tran van phuoc','tran van phuoc@gmail.com','177 nguyen binh khiem','Male','334284705','kCeRkeba','0334284705',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER048','dang huu ngoc','dang huu ngoc@gmail.com','263 ngo duc ke','Female','579196197','wWT8KefS','0579196197',2,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER049','nguyen thien khiem','nguyen thien khiem@gmail.com','329 nguyen binh khiem','Male','203982472','CxA5TmH4','0203982472',3,'Ho Chi Minh');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER050','nguyen tuan dung','nguyen tuan dung@gmail.com','572 le cong kieu','Male','127906320','NafLAmPj','0127906320',3,'Ho Chi Minh');

Chi nhanh HN:
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER051','nguyen thi cuc','nguyen thi cuc@gmail.com','196 L??ng S?','Male','830949435','cVWq7HZ5','0830949435',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER052','nguyen xuan sang','nguyen xuan sang@gmail.com','13 Gi?i Phóng','Male','660306669','2T8MHh4n','0660306669',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER053','la van quyet','la van quyet@gmail.com','324 Hàng Thùng','Male','124156654','tNWu4zQm','0124156654',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER054','doan van dung','doan van dung@gmail.com','470 B??i','Male','222499197','GBjYqkae','0222499197',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER055','nguyen xuan coi','nguyen xuan coi@gmail.com','363 Hàng Bài','Male','514676274','XqejNNsk','0514676274',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER056','tran van nga','tran van nga@gmail.com','405 Ph? Hu?','Female','527025013','KqswEfXA','0527025013',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER057','tran tien cuong','tran tien cuong@gmail.com','265 Láng H?','Male','263973681','cdcDeJkK','0263973681',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER058','nguyen van manh','nguyen van manh@gmail.com','164 Bích Câu','Male','808247220','JzeXN6FC','0808247220',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER059','pham huu hang','pham huu hang@gmail.com','529 Hàng Bài','Male','211629826','TXYQcT9y','0211629826',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER060','pham thi hong','pham thi hong@gmail.com','111 Bích Câu','Male','154958695','sJUgB9tS','0154958695',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER061','truong quang tho','truong quang tho@gmail.com','139 Hàng Thùng','Male','887607772','D9FnKkav','0887607772',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER062','dang dinh tam','dang dinh tam@gmail.com','51 Hàng Thùng','Male','140205030','CnPAGSH5','0140205030',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER063','nguyen thi kim le','nguyen thi kim le@gmail.com','116 Láng H?','Female','592778200','Dbb8xJF9','0592778200',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER064','to anh dung','to anh dung@gmail.com','278 ?inh Tiên Hoàng','Male','339743891','7jwqaMjc','0339743891',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER065','nguyen dinh tam','nguyen dinh tam@gmail.com','544 Ph? Hu?','Male','786708472','fbbAczCg','0786708472',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER066','nguyen thi mai lan','nguyen thi mai lan@gmail.com','445 ??ng V?n Ng?','Female','139956881','SNW4Laac','0139956881',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER067','le van loi','le van loi@gmail.com','401 V?n Mi?u','Male','498977478','pKXLrYty','0498977478',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER068','nguyen hong chi','nguyen hong chi@gmail.com','47 V?n Mi?u','Male','619280966','6GWVSeS8','0619280966',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER069','le van anh','le van anh@gmail.com','552 Hàng Tre','Male','490512902','hFaxWvZA','0490512902',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER070','nguyen thi bich lieu','nguyen thi bich lieu@gmail.com','577 Lê Du?n','Female','579986757','Zkyj2hLT','0579986757',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER071','pham van hoan','pham van hoan@gmail.com','481 Bà Huy?n Thanh Quan','Male','053869800','4Ej4VjRs','0053869800',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER072','nguyen dinh dong','nguyen dinh dong@gmail.com','435 Láng H?','Male','524184318','vRk8yV3s','0524184318',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER073','ngo thi phuong','ngo thi phuong@gmail.com','195 Lê Tr?ng T?n','Female','793797222','MnETBGqm','0793797222',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER074','tran quoc toa','tran quoc toa@gmail.com','332 Hàng D?u','Male','953779509','SGCpRpPy','0953779509',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER075','ngo nguyen ky vinh','ngo nguyen ky vinh@gmail.com','104 Võ Chí Công','Male','273634086','wSqcFZxH','0273634086',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER076','ngo van loi','ngo van loi@gmail.com','396 Kh??ng Trung','Male','423426582','8dGDzUGx','0423426582',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER077','nguyen van hoang','nguyen van hoang@gmail.com','229 Bà Huy?n Thanh Quan','Male','747072104','wcWEfRBk','0747072104',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER078','ton duc anh','ton duc anh@gmail.com','37 ??ng V?n Ng?','Male','871446548','yWHTt2pU','0871446548',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER079','le tien thang','le tien thang@gmail.com','288 Lê Du?n','Male','396473775','H8mdKN9L','0396473775',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER080','pham thanh duong','pham thanh duong@gmail.com','297 B??i','Male','563441136','TYJsFqtf','0563441136',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER081','truong ngoc hanh','truong ngoc hanh@gmail.com','100 Hoàng Hoa Thám','Female','143162781','VHG6Lyzq','0143162781',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER082','le van hoan','le van hoan@gmail.com','519 Láng H?','Male','344765643','HdusvgAp','0344765643',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER083','nguyen ngoc dong','nguyen ngoc dong@gmail.com','539 Hàng Thùng','Male','878191361','JtqP26ZX','0878191361',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER084','phan nguyen tan','phan nguyen tan@gmail.com','412 Ph? Hu?','Male','032445986','sWKKZaRg','0032445986',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER085','tra van khang','tra van khang@gmail.com','135 Kh??ng Trung','Male','746628753','GtLNpBcn','0746628753',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER086','nguyen trong chinh','nguyen trong chinh@gmail.com','180 Gi?i Phóng','Male','098243162','yy2cmyTj','0098243162',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER087','le van my','le van my@gmail.com','417 Hàng Tre','Female','685446084','X3mxzUyx','0685446084',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER088','nguyen van hung','nguyen van hung@gmail.com','168 Hàng Khay','Male','512472219','w836zZAR','0512472219',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER089','nguyen ngoc dung','nguyen ngoc dung@gmail.com','139 B??i','Male','462377593','7vfpBskW','0462377593',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER090','dinh tien dat','dinh tien dat@gmail.com','72 B??i','Male','462096102','9nBzYbHM','0462096102',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER091','nguyen thanh hoa','nguyen thanh hoa@gmail.com','255 V?n Cao','Female','978139874','XTJpH9Xc','0978139874',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER092','nguyen xuan phuong','nguyen xuan phuong@gmail.com','253 Hàng Khay','Female','948258250','NhRSWNgH','0948258250',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER093','le ngoc tuan','le ngoc tuan@gmail.com','275 Hàng Bông','Male','565077476','e9cNumhN','0565077476',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER094','le dinh han','le dinh han@gmail.com','243 V?n Mi?u','Male','609971525','zEYTJLsv','0609971525',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER095','nguyen van hanh','nguyen van hanh@gmail.com','413 Bà Huy?n Thanh Quan','Male','443908815','dkK83aqa','0443908815',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER096','doan mai vinh khoa','doan mai vinh khoa@gmail.com','17 Hàng Tre','Male','997743136','rWwwY7Sm','0997743136',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER097','vu quang ngoc','vu quang ngoc@gmail.com','437 B??i','Male','503773882','S6AJEzYR','0503773882',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER098','do thai toan','do thai toan@gmail.com','569 Ph? Hu?','Male','388990955','hjphEzEc','0388990955',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER099','bui thi hai','bui thi hai@gmail.com','319 Hàng Bông','Female','610043863','88ExsdV4','0610043863',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,address,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER100','phan thi hong nhung','phan thi hong nhung@gmail.com','364 Hoàng Hoa Thám','Female','552609863','62xCk6y7','0552609863',3,'Ha Noi');


alter session set nls_date_format='yyyy-mm-dd';

Chi nhánh HCM:
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0002', 'USER001', 'Yamaha', 'T002', '59B1-11242', '02', 5000000, '2021-11-25','Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0001', 'USER001', 'Lamboghini', 'T001', '59B1-21412', '01', 10000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0004', 'USER004', 'Rollroyce', 'T004', '60B1-12425', '01', 50000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0005', 'USER001', 'Ferrari', 'T005', '59B1-99999', '01', 55000000, '2021-11-20', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0006', 'USER006', 'Bugatti', 'T006', '59B1-77777', '01', 52000000, '2021-11-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0007', 'USER001', 'Yamaha 2', 'T002', '59B1-11242', '02', 5000000, '2021-11-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0008', 'USER008', 'Huyndai', 'T007', '59B1-12345', '02', 10000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0009', 'USER009', 'Rollroyce', 'T004', '60B1-12425', '01', 50000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0010', 'USER010', 'Ferrari', 'T005', '59B1-99999', '01', 55000000, '2021-11-20', 'Xang');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0043','Opel','43B7-7366','Available',3300000,'2020-12-20','T001','Xang','USER001');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0044','Renault','65B5-0999','Available',8500000,'2020-2-22','T002','Dau','USER002');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0045','Honda','52B7-3477','Available',2800000,'2020-7-7','T003','Dau','USER003');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0046','Mazda','27B3-5226','Available',9500000,'2020-11-24','T004','Dau','USER004');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0047','Honda','67B2-8570','Not Available',2500000,'2020-2-27','T005','Dau','USER005');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0048','Citroen','77B7-3273','Not Available',1500000,'2020-7-15','T006','Xang','USER006');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0049','Ford','96B2-4576','Not Available',4300000,'2020-5-8','T007','Xang','USER007');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0050','Hyundai','35B0-5123','Not Available',5700000,'2020-8-4','T001','Xang','USER008');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0051','Toyota','51B1-5428','Not Available',3400000,'2020-2-16','T002','Xang','USER009');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0052','Kia','08B7-8417','Available',500000,'2020-1-28','T001','Dau','USER010');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0053','Opel','69B3-1597','Not Available',9900000,'2020-11-5','T002','Xang','USER011');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0054','Renault','19B1-1493','Available',8000000,'2020-6-22','T003','Dau','USER012');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0055','Nissan','36B3-7469','Available',800000,'2020-9-19','T004','Dau','USER013');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0056','Opel','42B4-7812','Available',6100000,'2020-8-26','T005','Dau','USER014');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0057','Renault','23B5-0816','Available',3300000,'2020-9-5','T006','Dau','USER015');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0058','Mazda','17B9-4190','Not Available',7300000,'2020-8-28','T007','Dau','USER016');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0059','Citroen','21B0-3307','Available',1800000,'2020-3-5','T001','Dau','USER017');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0060','Honda','90B0-1393','Not Available',2600000,'2020-5-2','T002','Dau','USER018');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0061','Audi','29B2-4685','Available',9700000,'2020-6-8','T001','Dau','USER019');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0062','Ford','50B6-1278','Not Available',7900000,'2020-2-2','T002','Dau','USER020');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0063','Mercedes','26B8-8044','Available',6700000,'2020-5-12','T003','Dau','USER021');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0064','Audi','48B7-8305','Not Available',4600000,'2020-6-13','T004','Xang','USER022');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0065','Renault','38B0-3820','Not Available',5300000,'2020-8-9','T005','Dau','USER023');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0066','Toyota','48B7-4321','Available',8800000,'2020-12-18','T006','Dau','USER024');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0067','Mazda','80B2-3231','Available',5300000,'2020-8-25','T007','Dau','USER025');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0068','Honda','29B2-1713','Not Available',4600000,'2020-2-21','T001','Dau','USER026');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0069','Opel','18B8-8751','Not Available',800000,'2020-10-26','T002','Dau','USER027');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0070','Audi','56B6-0972','Available',2100000,'2020-8-22','T001','Xang','USER028');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0071','Kia','15B2-8725','Available',5900000,'2020-12-10','T002','Xang','USER029');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0072',' Peugeot','54B3-8437','Not Available',9500000,'2020-6-4','T003','Xang','USER030');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0073','Ford','47B5-0584','Not Available',4400000,'2020-3-27','T004','Xang','USER005');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0074','Hyundai','57B4-3004','Not Available',5300000,'2020-3-23','T005','Dau','USER003');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0075','Mazda','57B0-7266','Available',4000000,'2020-4-8','T006','Xang','USER014');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0076','Hyundai','07B6-6177','Not Available',3600000,'2020-2-18','T007','Dau','USER019');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0077','Citroen','78B2-0227','Not Available',6800000,'2020-11-9','T001','Xang','USER012');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0078','Seat','14B8-1079','Available',900000,'2020-10-3','T002','Xang','USER017');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0079','Ford','58B4-5641','Not Available',4200000,'2020-2-7','T001','Xang','USER014');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0080',' Peugeot','38B0-9940','Available',4300000,'2020-5-19','T002','Xang','USER021');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0081','Seat','94B1-1617','Not Available',5400000,'2020-8-17','T003','Dau','USER022');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0082','BMW','15B8-9317','Available',6000000,'2020-8-7','T004','Dau','USER006');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0083','Honda','70B2-3463','Available',2000000,'2020-8-6','T005','Xang','USER006');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0084','Hyundai','20B0-2205','Available',9900000,'2020-2-23','T006','Xang','USER015');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0085',' Peugeot','95B6-1806','Available',9300000,'2020-2-13','T007','Dau','USER013');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0086','Mercedes','58B3-9205','Available',8100000,'2020-2-14','T001','Dau','USER015');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0087','Citroen','09B0-0864','Available',8900000,'2020-6-26','T002','Xang','USER025');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0088','Nissan','83B9-6690','Available',6200000,'2020-8-24','T001','Xang','USER023');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0089','Audi','36B1-7058','Not Available',6800000,'2020-11-28','T002','Dau','USER023');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0090','Fiat','55B6-0030','Available',7400000,'2020-6-24','T003','Dau','USER023');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0091','Seat','63B4-5263','Not Available',1300000,'2020-5-2','T004','Xang','USER025');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0092','Volkswagen','55B1-4265','Available',10000000,'2020-9-22','T005','Xang','USER019');
Chi nhánh HN:
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0021', 'USER061', 'KIA B1', 'T006', '50B1-77777', 'Available', 52000000, '2020-9-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0022', 'USER062', 'Honda A3', 'T002', '59G1-17775', 'Not Available', 5000000, '2020-1-17', 'Dau');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0023', 'USER063', 'Hyundai H6', 'T003', '42B1-21412', 'Available', 13000000, '2020-5-1', 'Dau');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0024', 'USER064', 'Aston Martin 1', 'T014', '60B1-12425', 'Available', 30000000, '2020-8-29', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0025', 'USER065', 'Isuzu I3', 'T005', '71W1-99999', 'Not Available', 55000000, '2020-11-20', 'Dau');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0026', 'USER066', 'KIA A3', 'T006', '11B1-77337', 'Available', 22000000, '2020-3-8', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0027', 'USER067', 'Vinfast V2', 'T016', '48B1-11242', 'Not Available', 7000000, '2020-10-13', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0028', 'USER068', 'Hyundai H2', 'T003', '60P1-21392', 'Available', 8000000, '2020-8-9', 'Dau');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0029', 'USER068', 'Toyota T3', 'T004', '71B1-19845', 'Not Available', 34000000, '2020-6-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0030', 'USER075', 'Isuzu I4', 'T005', '41U1-27199', 'Available', 60000000, '2020-5-4', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0031', 'USER091', 'Chevrolet C5', 'T018', '33T1-93719', 'Available', 25000000, '2020-12-9', 'Dau');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0032', 'USER085', 'FORD F2', 'T001', '75Y1-91431', 'Not Available', 70000000, '2020-11-22', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0033', 'USER064', 'Subaru S3', 'T022', '55A1-83742', 'Available', 24000000, '2020-12-22', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0034', 'USER088', 'Bently B1', 'T015', '59C1-82917', 'Available', 33000000, '2020-5-8', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0035', 'USER052', 'Lamborghini L3', 'T011', '59A1-19374', 'Not Available', 80000000, '2020-9-15', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0036', 'USER075', 'Mini Cooper M4', 'T023', '59F1-01835', 'Available', 58000000, '2020-1-18', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0037', 'USER088', 'Mercedes Benz M1', 'T007', '59D1-19237', 'Available', 72000000, '2020-4-20', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0038', 'USER095', 'Hyundai H2', 'T003', '59E1-11923', 'Not Available', 9000000, '2020-9-3', 'Dau');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0039', 'USER075', 'Toyota T5', 'T004', '59B1-37462', 'Available', 12000000, '2020-7-25', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0040', 'USER052', 'Volvo V3', 'T012', '59F1-20183', 'Not Available', 37000000, '2020-4-1', 'Xang');
INSERT INTO car (carid, ownerid, carname, brandid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0042', 'USER091', 'FORD F1', 'T001', '75Y1-25431', 'Available', 70000000, '2020-11-22', 'Xang');

INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0093','Hyundai','90B8-0053','Not Available',5100000,'2020-3-21','T006','Xang','USER051');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0094','Audi','41B5-4693','Available',300000,'2020-3-9','T007','Dau','USER052');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0095','Skoda','26B1-2787','Not Available',1800000,'2020-4-1','T001','Xang','USER053');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0096','Skoda','28B6-1500','Available',8000000,'2020-1-3','T002','Xang','USER054');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0097','Audi','25B5-4013','Not Available',1900000,'2020-2-11','T001','Xang','USER055');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0098','Citroen','74B8-1644','Not Available',3200000,'2020-7-24','T002','Dau','USER056');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0099','Skoda','63B7-3855','Available',1600000,'2020-1-26','T003','Dau','USER057');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0100','Hyundai','40B5-1500','Not Available',3600000,'2020-10-23','T004','Dau','USER058');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0101','Citroen','29B3-7723','Available',6500000,'2020-10-27','T005','Xang','USER059');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0102','Mazda','67B5-5378','Not Available',6500000,'2020-7-2','T006','Dau','USER060');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0103','Kia','57B4-3994','Available',8700000,'2020-2-16','T007','Dau','USER061');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0104','Honda','05B7-9081','Available',3500000,'2020-5-11','T001','Xang','USER062');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0105','Fiat','12B0-6266','Available',8400000,'2020-10-3','T002','Xang','USER063');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0106','BMW','14B1-1155','Not Available',400000,'2020-4-24','T001','Dau','USER064');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0107','Renault','24B9-3591','Available',3400000,'2020-6-23','T002','Xang','USER065');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0108','Fiat','73B6-7488','Not Available',6800000,'2020-8-18','T003','Dau','USER066');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0109','Audi','83B1-7033','Available',8600000,'2020-6-1','T004','Xang','USER067');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0110','Fiat','64B8-8238','Not Available',5100000,'2020-10-13','T005','Dau','USER068');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0111','Fiat','01B6-1013','Available',1300000,'2020-8-21','T006','Xang','USER069');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0112','Hyundai','82B1-1886','Available',600000,'2020-12-28','T007','Xang','USER070');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0113','Skoda','68B6-2476','Not Available',3900000,'2020-5-3','T001','Xang','USER071');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0114','Mercedes','47B8-2067','Not Available',4300000,'2020-2-6','T002','Xang','USER066');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0115','Hyundai','07B6-9137','Available',4500000,'2020-10-28','T001','Dau','USER060');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0116','Mazda','12B0-5909','Not Available',1400000,'2020-11-28','T002','Xang','USER057');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0117','Ford','41B8-5677','Not Available',2700000,'2020-1-21','T003','Xang','USER063');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0118','Volkswagen','34B7-9618','Not Available',5600000,'2020-6-18','T004','Xang','USER065');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0119','Volkswagen','06B2-7281','Not Available',3800000,'2020-12-22','T005','Dau','USER067');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0120','Nissan','48B5-7517','Not Available',700000,'2020-3-1','T006','Dau','USER053');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0121','Mercedes','68B4-0019','Available',9500000,'2020-10-24','T007','Dau','USER067');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0122','Citroen','11B4-7490','Not Available',3600000,'2020-5-16','T001','Xang','USER061');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0123','Ford','65B6-9535','Not Available',4600000,'2020-11-4','T002','Dau','USER059');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0124','Opel','05B5-7799','Available',8300000,'2020-7-27','T001','Dau','USER070');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0125','Ford','70B7-9765','Available',8200000,'2020-4-11','T002','Dau','USER058');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0126','Audi','44B9-6006','Not Available',200000,'2020-4-17','T003','Xang','USER060');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0127','Toyota','73B0-3179','Not Available',5000000,'2020-2-1','T004','Xang','USER068');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0128','Honda','20B1-0968','Available',7500000,'2020-5-14','T005','Xang','USER053');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0129','Fiat','55B8-2822','Not Available',7400000,'2020-1-15','T006','Dau','USER060');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0130','Renault','05B3-6212','Available',1000000,'2020-6-25','T007','Xang','USER070');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0131','Citroen','21B3-4048','Not Available',2100000,'2020-7-4','T001','Dau','USER065');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0132','Hyundai','94B5-7287','Available',9800000,'2020-7-6','T002','Dau','USER019');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0133','Ford','97B2-7427','Not Available',8800000,'2020-1-12','T001','Xang','USER051');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0134','Honda','13B2-3312','Not Available',7100000,'2020-8-18','T002','Xang','USER066');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0135','Kia','97B5-0980','Available',7300000,'2020-6-8','T003','Dau','USER057');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0136','Citroen','15B1-5210','Available',5800000,'2020-8-27','T004','Xang','USER062');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0137','Volkswagen','39B3-9944','Available',3700000,'2020-9-12','T005','Xang','USER067');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0138',' Peugeot','39B0-7341','Not Available',9500000,'2020-10-24','T006','Dau','USER061');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0139','Nissan','63B4-7832','Available',9800000,'2020-3-10','T007','Xang','USER059');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0140','Mercedes','64B7-6319','Available',9000000,'2020-9-13','T001','Xang','USER056');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0141','Mazda','64B5-2267','319 Hàng Bông',7000000,'2020-10-20','T002','Xang','USER061');
INSERT INTO car(carid,carname,carNumberPlate,status,rentcost,postdated,brandid,Fuel,ownerid) VALUES('XE0142','Skoda','26B8-2928','364 Hoàng Hoa Thám',6800000,'2020-12-7','T001','Dau','USER067');



INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER008', 'XE0001','2021-12-08', '2021-12-15');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ('USER002', 'XE0006', '2021-12-09', '2021-12-18');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER002', 'XE0007','2021-12-09', '2021-12-15');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER004', 'XE0011', '2021-12-10', '2021-12-15');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER055', 'XE0016', '2021-12-11', '2021-12-20');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER006', 'XE0017', '2021-12-18', '2021-12-19');
INSERT INTO contract (userid, carid, startdate, enddate) VALUES ('USER003', 'XE0022','2021-12-2', '2021-12-14');
INSERT INTO contract (userid, carid, startdate, enddate) VALUES ('USER074', 'XE0027','2021-12-9', '2021-12-15');
INSERT INTO contract (userid, carid, startdate, enddate) VALUES ('USER033', 'XE0029','2021-12-5', '2021-12-15');
INSERT INTO contract (userid, carid, startdate, enddate) VALUES ('USER054', 'XE0032','2021-12-7', '2021-12-16');
INSERT INTO contract (userid, carid, startdate, enddate) VALUES ('USER019', 'XE0035','2021-12-1', '2021-12-14');
INSERT INTO contract (userid, carid, startdate, enddate) VALUES ('USER088', 'XE0038','2021-12-3', '2021-12-21');
INSERT INTO contract (userid, carid, startdate, enddate) VALUES ('USER062', 'XE0040','2021-12-2', '2021-12-13');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER034', 'XE0002','2021-08-08', '2021-08-15');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ('USER012', 'XE0007', '2021-08-09', '2021-08-18');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER018', 'XE0011','2021-08-10', '2021-08-12');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER004', 'XE0013', '2021-08-10', '2021-08-11');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER055', 'XE0012', '2021-10-11', '2021-10-20');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER006', 'XE0024', '2021-11-09', '2021-11-14');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER054', 'XE0029', '2021-12-01', '2021-12-03');
