
-- Cơ sở dữ liệu: quanlythuexe
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng brands
--

CREATE TABLE brands (
  brandid varchar2(10) NOT NULL,
  brandname varchar2(40) NOT NULL,
  nation varchar2(40) NOT NULL,
  logo varchar2(100) NOT NULL
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
  status varchar2(2) NOT NULL,
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
  adress varchar2(40) NOT NULL,
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
  ADD PRIMARY KEY (userid,carid,startdate);
ALTER TABLE contract


--
--  Khóa cho bảng roles
--
ALTER TABLE roles_
  ADD PRIMARY KEY (roleid);

--
--  Khóa cho bảng users
--
ALTER TABLE users_
  ADD PRIMARY KEY (userid);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng car
--
ALTER TABLE car ADD CONSTRAINT user_id FOREIGN KEY (ownerid) REFERENCES users_ (userid);
ALTER TABLE car ADD CONSTRAINT brand_id FOREIGN KEY (brandid) REFERENCES brands (brandid);
--
-- Các ràng buộc cho bảng user
--
ALTER TABLE users_ ADD CONSTRAINT roles_id FOREIGN KEY (roleid) REFERENCES roles_ (roleid);

--
-- Các ràng buộc cho bảng contract
--
ALTER TABLE contract ADD CONSTRAINT car_id FOREIGN KEY (carid) REFERENCES car (carid);
ALTER TABLE contract ADD CONSTRAINT use_id FOREIGN KEY (userid) REFERENCES users_ (userid);

INSERT INTO roles_ (roleid, rolename, description_roles) VALUES (1, 'Nguoi dung', '--');

INSERT INTO roles_ (roleid, rolename, description_roles) VALUES (2, 'quan ly', '--');

INSERT INTO roles_ (roleid, rolename, description_roles) VALUES (0, 'Da Huy', '--');

INSERT INTO roles_ (roleid, rolename, description_roles) VALUES (3, 'DEV', '--');






INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T001', 'FORD', 'USA', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T002', 'Honda', 'Japan', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T003', 'Hyundai', 'Korea', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T004', 'Toyota', 'Japan', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T005', 'Isuzu', 'Japan', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T006', 'KIA', 'Korea', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T007', 'Mercedes Benz', 'Germany', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T008', 'BMW', 'Germany', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T010', 'Audi', 'Germany', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T011', 'Lamborghini', 'Italia', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T012', 'Volvo', 'Switzerland', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T013', 'Maserati', 'Italia', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T014', 'Aston Martin', 'England', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T015', 'Bently', 'England', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T016', 'Vinfast', 'Vietnam', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T017', 'Mitsubishi', 'Japan', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T018', 'Chevrolet', 'USA', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T019', 'Lexus', 'Japan', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T020', 'Mazda', 'Japan', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T021', 'Nissan', 'Japan', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T022', 'Subaru', 'Japan', '--');
INSERT INTO brands (brandid, brandname, nation, logo) VALUES ('T023', 'Mini Cooper', 'England', '--');





cn hcm:
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
cn hanoi:
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER051','nguyen thi cuc','nguyen thi cuc@gmail.com','196 Lương Sử','Male','830949435','cVWq7HZ5','0830949435',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER052','nguyen xuan sang','nguyen xuan sang@gmail.com','13 Giải Phóng','Male','660306669','2T8MHh4n','0660306669',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER053','la van quyet','la van quyet@gmail.com','324 Hàng Thùng','Male','124156654','tNWu4zQm','0124156654',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER054','doan van dung','doan van dung@gmail.com','470 Bưởi','Male','222499197','GBjYqkae','0222499197',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER055','nguyen xuan coi','nguyen xuan coi@gmail.com','363 Hàng Bài','Male','514676274','XqejNNsk','0514676274',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER056','tran van nga','tran van nga@gmail.com','405 Phố Huế','Female','527025013','KqswEfXA','0527025013',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER057','tran tien cuong','tran tien cuong@gmail.com','265 Láng Hạ','Male','263973681','cdcDeJkK','0263973681',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER058','nguyen van manh','nguyen van manh@gmail.com','164 Bích Câu','Male','808247220','JzeXN6FC','0808247220',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER059','pham huu hang','pham huu hang@gmail.com','529 Hàng Bài','Male','211629826','TXYQcT9y','0211629826',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER060','pham thi hong','pham thi hong@gmail.com','111 Bích Câu','Male','154958695','sJUgB9tS','0154958695',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER061','truong quang tho','truong quang tho@gmail.com','139 Hàng Thùng','Male','887607772','D9FnKkav','0887607772',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER062','dang dinh tam','dang dinh tam@gmail.com','51 Hàng Thùng','Male','140205030','CnPAGSH5','0140205030',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER063','nguyen thi kim le','nguyen thi kim le@gmail.com','116 Láng Hạ','Female','592778200','Dbb8xJF9','0592778200',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER064','to anh dung','to anh dung@gmail.com','278 Đinh Tiên Hoàng','Male','339743891','7jwqaMjc','0339743891',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER065','nguyen dinh tam','nguyen dinh tam@gmail.com','544 Phố Huế','Male','786708472','fbbAczCg','0786708472',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER066','nguyen thi mai lan','nguyen thi mai lan@gmail.com','445 Đặng Văn Ngữ','Female','139956881','SNW4Laac','0139956881',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER067','le van loi','le van loi@gmail.com','401 Văn Miếu','Male','498977478','pKXLrYty','0498977478',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER068','nguyen hong chi','nguyen hong chi@gmail.com','47 Văn Miếu','Male','619280966','6GWVSeS8','0619280966',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER069','le van anh','le van anh@gmail.com','552 Hàng Tre','Male','490512902','hFaxWvZA','0490512902',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER070','nguyen thi bich lieu','nguyen thi bich lieu@gmail.com','577 Lê Duẩn','Female','579986757','Zkyj2hLT','0579986757',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER071','pham van hoan','pham van hoan@gmail.com','481 Bà Huyện Thanh Quan','Male','053869800','4Ej4VjRs','0053869800',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER072','nguyen dinh dong','nguyen dinh dong@gmail.com','435 Láng Hạ','Male','524184318','vRk8yV3s','0524184318',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER073','ngo thi phuong','ngo thi phuong@gmail.com','195 Lê Trọng Tấn','Female','793797222','MnETBGqm','0793797222',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER074','tran quoc toa','tran quoc toa@gmail.com','332 Hàng Dầu','Male','953779509','SGCpRpPy','0953779509',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER075','ngo nguyen ky vinh','ngo nguyen ky vinh@gmail.com','104 Võ Chí Công','Male','273634086','wSqcFZxH','0273634086',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER076','ngo van loi','ngo van loi@gmail.com','396 Khương Trung','Male','423426582','8dGDzUGx','0423426582',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER077','nguyen van hoang','nguyen van hoang@gmail.com','229 Bà Huyện Thanh Quan','Male','747072104','wcWEfRBk','0747072104',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER078','ton duc anh','ton duc anh@gmail.com','37 Đặng Văn Ngữ','Male','871446548','yWHTt2pU','0871446548',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER079','le tien thang','le tien thang@gmail.com','288 Lê Duẩn','Male','396473775','H8mdKN9L','0396473775',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER080','pham thanh duong','pham thanh duong@gmail.com','297 Bưởi','Male','563441136','TYJsFqtf','0563441136',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER081','truong ngoc hanh','truong ngoc hanh@gmail.com','100 Hoàng Hoa Thám','Female','143162781','VHG6Lyzq','0143162781',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER082','le van hoan','le van hoan@gmail.com','519 Láng Hạ','Male','344765643','HdusvgAp','0344765643',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER083','nguyen ngoc dong','nguyen ngoc dong@gmail.com','539 Hàng Thùng','Male','878191361','JtqP26ZX','0878191361',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER084','phan nguyen tan','phan nguyen tan@gmail.com','412 Phố Huế','Male','032445986','sWKKZaRg','0032445986',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER085','tra van khang','tra van khang@gmail.com','135 Khương Trung','Male','746628753','GtLNpBcn','0746628753',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER086','nguyen trong chinh','nguyen trong chinh@gmail.com','180 Giải Phóng','Male','098243162','yy2cmyTj','0098243162',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER087','le van my','le van my@gmail.com','417 Hàng Tre','Female','685446084','X3mxzUyx','0685446084',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER088','nguyen van hung','nguyen van hung@gmail.com','168 Hàng Khay','Male','512472219','w836zZAR','0512472219',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER089','nguyen ngoc dung','nguyen ngoc dung@gmail.com','139 Bưởi','Male','462377593','7vfpBskW','0462377593',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER090','dinh tien dat','dinh tien dat@gmail.com','72 Bưởi','Male','462096102','9nBzYbHM','0462096102',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER091','nguyen thanh hoa','nguyen thanh hoa@gmail.com','255 Văn Cao','Female','978139874','XTJpH9Xc','0978139874',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER092','nguyen xuan phuong','nguyen xuan phuong@gmail.com','253 Hàng Khay','Female','948258250','NhRSWNgH','0948258250',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER093','le ngoc tuan','le ngoc tuan@gmail.com','275 Hàng Bông','Male','565077476','e9cNumhN','0565077476',1,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER094','le dinh han','le dinh han@gmail.com','243 Văn Miếu','Male','609971525','zEYTJLsv','0609971525',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER095','nguyen van hanh','nguyen van hanh@gmail.com','413 Bà Huyện Thanh Quan','Male','443908815','dkK83aqa','0443908815',3,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER096','doan mai vinh khoa','doan mai vinh khoa@gmail.com','17 Hàng Tre','Male','997743136','rWwwY7Sm','0997743136',2,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER097','vu quang ngoc','vu quang ngoc@gmail.com','437 Bưởi','Male','503773882','S6AJEzYR','0503773882',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER098','do thai toan','do thai toan@gmail.com','569 Phố Huế','Male','388990955','hjphEzEc','0388990955',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER099','bui thi hai','bui thi hai@gmail.com','319 Hàng Bông','Female','610043863','88ExsdV4','0610043863',0,'Ha Noi');
INSERT INTO users_(userid,fullname,email,adress,gender,idcard,password_users,phonenumber,roleid,Branch) VALUES('USER100','phan thi hong nhung','phan thi hong nhung@gmail.com','364 Hoàng Hoa Thám','Female','552609863','62xCk6y7','0552609863',0,'Ha Noi');

alter session set nls_date_format='yyyy-mm-dd';

INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0002', 'USER001', 'Yamaha', 'T002', '59B1-11242', '02', 5000000, '2021-11-25','Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0001', 'USER001', 'Lamboghini', 'T001', '59B1-21412', '01', 10000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0004', 'USER004', 'Rollroyce', 'T004', '60B1-12425', '01', 50000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0005', 'USER001', 'Ferrari', 'T005', '59B1-99999', '01', 55000000, '2021-11-20', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0006', 'USER006', 'Bugatti', 'T006', '59B1-77777', '01', 52000000, '2021-11-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0007', 'USER001', 'Yamaha 2', 'T002', '59B1-11242', '02', 5000000, '2021-11-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0008', 'USER008', 'Huyndai', 'T007', '59B1-12345', '02', 10000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0009', 'USER009', 'Rollroyce', 'T004', '60B1-12425', '01', 50000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0010', 'USER010', 'Ferrari', 'T005', '59B1-99999', '01', 55000000, '2021-11-20', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0011', 'USER011', 'Bugatti', 'T006', '59B1-77777', '01', 52000000, '2021-11-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0012', 'USER012', 'Yamaha', 'T002', '59B1-17775', '02', 5000000, '2021-11-25', 'Xang'),
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0013', 'USER013', 'Lamboghini', 'T003', '59B1-21412', '01', 10000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0014', 'USER014', 'Aston Martin 1', 'T014', '60B1-12425', '01', 50000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0015', 'USER001', 'Ferrari', 'T005', '59B1-99999', '01', 55000000, '2021-11-20', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0016', 'USER016', 'Bugatti', 'T006', '59B1-77777', '01', 52000000, '2021-11-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0017', 'USER017', 'Yamaha', 'T016', '59B1-11242', '02', 5000000, '2021-11-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0018', 'USER018', 'Lamboghini', 'T003', '59B1-21412', '01', 10000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0019', 'USER004', 'Rollroyce', 'T004', '60B1-12425', '01', 50000000, '2021-12-25', 'Xang');
INSERT INTO car (carid, ownercarid, carname, branid, carNumberPlate, status, rentcost, postdated, Fuel) VALUES ('XE0020', 'USER001', 'Ferrari', 'T005', '59B1-99999', '01', 55000000, '2021-11-20', 'Xang');

INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER001', 'XE0001','2021-11-23', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ('USER002', 'XE0002', '2021-11-23', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER002', 'XE0003','2021-11-23', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER004', 'XE0004', '2021-11-23', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER005', 'XE0005', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER006', 'XE0006', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER007', 'XE0007', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER004', 'XE0004', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER005', 'XE0005', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER006', 'XE0006', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER011', 'XE0011','2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER012', 'XE0009', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ('USER012', 'XE0013', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER014', 'XE0010', '2021-11-24', '2021-11-27');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ('USER015', 'XE0015', '2021-11-23', '2021-11-30');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER016', 'XE0016', '2021-11-23', '2021-11-30');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER017', 'XE0017', '2021-11-23', '2021-11-30');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ('USER018', 'XE0018', '2021-11-23', '2021-11-30');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER019', 'XE0019','2021-11-23', '2021-11-30');
INSERT INTO contract (userid, carid, startdate, enddate ) VALUES ( 'USER020', 'XE0020', '2021-11-23', '2021-11-30');
