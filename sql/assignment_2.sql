DROP DATABASE IF EXISTS Assignment_2;
CREATE DATABASE Assignment_2;
USE Assignment_2;

-- CREATE TABLE USER
DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER`(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
ADDRESS VARCHAR(255),
`DESCRIPTION` VARCHAR(255),
EMAIL VARCHAR(255) NOT NULL UNIQUE,
FULL_NAME VARCHAR(50) NOT NULL,
IMAGE VARCHAR(50),
`PASSWORD` VARCHAR(255) NOT NULL,
PHONE_NUMBER VARCHAR(50),
`STATUS` INT,
ROLE_ID INT UNSIGNED,
CV_ID INT UNSIGNED
);

-- CREATE TABLE CV
DROP TABLE IF EXISTS CV;
CREATE TABLE CV(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
FILE_NAME VARCHAR(255) NOT NULL ,
USER_ID INT UNSIGNED,
FOREIGN KEY (USER_ID) REFERENCES `USER`(ID)
);

-- CREATE TABLE COMPANY
DROP TABLE IF EXISTS COMPANY;
CREATE TABLE COMPANY(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
ADDRESS VARCHAR(255) NOT NULL,
`DESCRIPTION` VARCHAR(255),
EMAIL VARCHAR(255) NOT NULL UNIQUE,
LOGO VARCHAR(255),
NAME_COMPANY VARCHAR(255),
PHONE_NUMBER VARCHAR(255),
`STATUS` INT,
USER_ID INT UNSIGNED UNIQUE,
FOREIGN KEY (USER_ID) REFERENCES `USER`(ID)
);

-- CREATE TABLE CATEGORY
DROP TABLE IF EXISTS CATEGORY;
CREATE TABLE CATEGORY(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
NAME_CATEGORY VARCHAR(255),
NUMBER_CHOOSE INT
);

-- CREATE TABLE RECRUITMENT
DROP TABLE IF EXISTS RECRUITMENT;
CREATE TABLE RECRUITMENT(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
ADDRESS VARCHAR(255) NOT NULL,
CREATED_AT VARCHAR(255),
`DESCRIPTION` VARCHAR(255),
EXPERIENCE VARCHAR(255),
QUANTITY INT,
`RANK` VARCHAR(255),
SALARY VARCHAR(255),
`STATUS` INT,
TITLE VARCHAR(255),
`TYPE` VARCHAR(255),
`VIEW` INT,
CATEGORY_ID INT UNSIGNED,
COMPANY_ID INT UNSIGNED,
DEADLINE VARCHAR(255),
FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY(ID),
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(ID)
);

-- CREATE TABLE SAVE_JOB
DROP TABLE IF EXISTS SAVE_JOB;
CREATE TABLE SAVE_JOB(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
RECRUITMENT_ID INT UNSIGNED,
USER_ID INT UNSIGNED,
FOREIGN KEY (USER_ID) REFERENCES `USER`(ID),
FOREIGN KEY (RECRUITMENT_ID) REFERENCES RECRUITMENT(ID)
);

-- CREATE TABLE ROLE
DROP TABLE IF EXISTS `ROLE`;
CREATE TABLE `ROLE`(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
ROLE_NAME VARCHAR(50) NOT NULL UNIQUE
);

-- CREATE TABLE FOLLOW_COMPANY
DROP TABLE IF EXISTS FOLLOW_COMPANY;
CREATE TABLE FOLLOW_COMPANY(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
COMPANY_ID INT UNSIGNED,
USER_ID INT UNSIGNED,
FOREIGN KEY (USER_ID) REFERENCES `USER`(ID),
FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY(ID)
);

-- CREATE TABLE APPLYPOST
DROP TABLE IF EXISTS APPLY_POST;
CREATE TABLE APPLY_POST(
ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
CREATED_AT VARCHAR(255),
RECRUITMENT_ID INT UNSIGNED,
USER_ID INT UNSIGNED,
NAME_CV VARCHAR(255),
`STATUS` INT,
`TEXT` VARCHAR(255),
FOREIGN KEY (USER_ID) REFERENCES `USER`(ID),
FOREIGN KEY (RECRUITMENT_ID) REFERENCES RECRUITMENT(ID)
);

ALTER TABLE `USER`
ADD FOREIGN KEY (ROLE_ID) REFERENCES `ROLE`(ID);

ALTER TABLE `USER`
ADD FOREIGN KEY (CV_ID) REFERENCES CV(ID);

SET GLOBAL FOREIGN_KEY_CHECKS=0;

 INSERT INTO `ROLE` (ROLE_NAME  )
	    VALUES       ( 'Manager'), -- nhà tuyển dụng
	                 ( 'User' );     -- ứng viên
                     
                     
INSERT INTO CV(   FILE_NAME    , USER_ID) 
VALUES
              ('ngoctai.pdf'   ,   1    ),
              ('xuanthuong.pdf',   2    ),
              ('quangvu.pdf'   ,   5    ),
              ('quanghuy.pdf'  ,   6    ),
              ('nhuy.pdf'      ,   10   ),
              ('ngocthang.pdf' ,   8    ),
              ('trithuy.pdf'   ,   4    ),
              ('vanthanh.pdf'  ,   7    ),
              ('thucuc.pdf'    ,   8    ),
              ('thanhbinh.pdf' ,   3    );


INSERT INTO
`USER`(  ADDRESS    ,`DESCRIPTION` ,        EMAIL          ,FULL_NAME          ,               IMAGE               ,                         `PASSWORD`                              ,PHONE_NUMBER  , `STATUS` , ROLE_ID ,  CV_ID )
VALUES ('Hà Nội'    , 'I am User ' ,'ngoctai@gmail.com'    , 'Phạm Ngọc Tài'   , 'anh_dai_dien.jpg ', '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0914453588' ,    1     ,   1    ,     1   ),
	   ('Hà Giang'  , 'I am User ' ,'xuanthuong@gmail.com' , 'Bùi Xuân Thường' , 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0948157159' ,    1     ,   2    ,     2   ),
	   ('Cao Bằng'  , 'I am User ' ,'thanhbinh@gmail.com'  , 'Phạm Thanh Bình' , 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0912300247' ,    1     ,   2    ,     9   ),
	   ('Bắc Kạn'   , 'I am User ' ,'trithuy@gmail.com'    , 'Nguyễn Trí Thủy' , 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0915133607' ,    1     ,   1    ,     3   ),
	   ('Điện Biên' , 'I am User ' ,'quangvu@gmail.com'    , 'Nguyễn Quang Vũ' , 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0913602103' ,    1     ,   2    ,     5   ),
	   ('Lào Cai'   , 'I am User ' ,'quanghuy@gmail.com'   , 'Lý Quang Huy'    , 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0905372666' ,    1     ,   1    ,     10  ),
	   ('Lai Châu'  , 'I am User ' ,'vanthanh@gmail.com'   , 'Nguyễn Văn Thành', 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0911375199' ,    1     ,   2    ,     7   ),
	   ('Sơn La'    , 'I am User ' ,'ngocthang@gmail.com'  , 'Phạm Ngọc Thắng' , 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0949522905' ,    1     ,   2    ,     9   ),
	   ('Yên Bái'   , 'I am User ' ,'thucuc@gmail.com'     , 'Lê Thị Thu Cúc ' , 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0949234388' ,    1     ,   2    ,     5   ),
	   ('Hòa Bình'  , 'I am User ' ,'tranthinhuy@gmail.com', 'Trần Thị Như Ý ' , 'anh_dai_dien.jpg' , '$2a$12$05jIkU5Nd0zbMvRi/7vlfOpIJuAIlq3htfGXk9sR5Y47MxozEHmd6'  , '0914500150' ,    1     ,   1    ,     4   );
       

              
 INSERT INTO COMPANY(
	        ADDRESS          ,  `DESCRIPTION`             ,          EMAIL              ,          LOGO          ,   NAME_COMPANY         ,  PHONE_NUMBER  ,`STATUS` ,USER_ID )     
VALUES ('Long Biên ,Hà Nội'  , 'Kinh nghiệm Java> 2 year' , 'hotrokhachhang@fpt.com'    ,  'fptsoftware.jpg'     ,  ' FPT Software'       ,  '024-39749999',    1    ,   2    ),
	   ('Từ Liêm, Hà Nội'    , 'Phát triển thị trường'    , 'gopy@viettel.com.vn'       ,  'viettel.jpg'         ,  ' Viettel Telecom'    ,  '024-62556789',    1    ,   3    ),
       ('Ba Đình, Hà Nội'    , 'EVN Việt Nam'             , 'evn.eic@gmail.com'         ,  'evn.png'             ,  ' EVN Việt Nam'       ,  '024-66946789',    1    ,   5    ),
       ('Đống Đa, Hà Nội'    , 'Petrolimex VN'            , 'petrolimex.@gmail.com'     ,  'petrolimex.jpg'      ,  ' Petrolimex VN'      ,  '04-38612603' ,    1    ,   1    ),
       ('Tân Bình ,TP.HCM'   , 'Kinh nghiệm JS > 3 year'  , 'investor@thegioididong.com',  'thegioididong.png'   ,  ' Thế Giới Di Động'   ,  '028-38125960',    1    ,   9    ),
       ('Phú Nhuận, TP.HCM'  , 'Ô Tô Trường Hải'          , 'rep-office@thaco.com.vn'   ,  'truonghai.jpg'       ,  ' Ô Tô Trường Hải'    ,  '061-3891726' ,    1    ,   8   ),
       ('Yên Mỹ,Hưng Yên'    , 'Hoà Phát'                 , 'prm@hoaphat.com.vn'        ,  'hoaphat.jpg'         ,  ' Tập Đoàn Hoà Phát'  ,  '024-62848666',    1    ,   10   ),
       ('Đóng Đa, Hà Nội'    , 'Viễn Thông VNPT'          , 'vanphong@vnpt.vn'          ,  'vnpt.png'            ,  ' Viễn Thông VNPT'    ,  '024-37741091',    1    ,   4    ),
       ('TX.Dĩ An,Bình Dương', 'Hoa Sen '                 , 'sales@hoasengroup.vn'      ,  'tonhoasen.jpg'       ,  ' Tôn Hoa Sen'        ,  '0650-3790955',    1    ,   7    ),
       ('Ba Đình, Hà Nội'    , 'Hàng Không Vietjet '      , 'info@vietjettair.com'      ,  'vietjet.jpg'         ,  ' Hàng Không Vietjet' ,  '024-37281828',    1    ,   6    );
       
 INSERT INTO SAVE_JOB (
               RECRUITMENT_ID , USER_ID )
	    VALUES (       1      ,    3    ),
               (       2      ,    6    ),
               (       8      ,    4    ),
               (       9      ,    7    ),
               (       6      ,    9    ),
               (       3      ,    1    ),
               (       4      ,    2    ),
               (       5      ,    10   ),
               (       7      ,    8    ),
               (       10      ,    5   );
               
 
 
  INSERT INTO FOLLOW_COMPANY (
             COMPANY_ID ,  USER_ID )
  VALUES    (  1        ,   3      ), 
            (  2        ,   5      ), 
            (  3        ,   6      ), 
            (  4        ,   9      ), 
            (  5        ,   8      ), 
			(  6        ,   10     ), 
            (  7        ,   1      ), 
            (  8        ,   4      ), 
            (  9        ,   2      ), 
            (  10       ,   7      );
            
INSERT INTO CATEGORY (
			   NAME_CATEGORY , NUMBER_CHOOSE )  
 VALUES      ( 'JavaScript'  ,       1       ),          
			 ( 'C-Sharp'     ,       6       ),        
             ( 'Java'        ,       2       ),         
             ( 'PHP'         ,       3       ),          
             ( 'Python'      ,       1       ),          
             ( 'TypeScript'  ,       1       ),         
             ( 'SQL'         ,       2       ),          
             ( 'C/C++'       ,       1       ),          
             ( 'Kotlin '     ,       5       ),        
             ( 'Swift'       ,       4       );         
       
             
INSERT INTO RECRUITMENT  (
	        ADDRESS     ,  CREATED_AT ,     `DESCRIPTION`     , EXPERIENCE , QUANTITY ,   `RANK`       ,   SALARY   , `STATUS`,          TITLE        ,    `TYPE`  , `VIEW` , CATEGORY_ID, COMPANY_ID ,    DEADLINE   )  
 VALUES  ( 'Hà Nội '    , '2023-10-15', 'Developper'          , '3 Year'   ,    2     , 'Nhân viên'    , '20000000' ,     1   , 'Tuyển Dev Java'      , 'Fulltime' ,    3   ,      3     ,     4      ,   '2023-11-15'),          
         ( 'Hà Nội '    , '2023-09-15', 'Trưởng Phòng Nhân Sự', '3 Year'   ,     1    , 'Trưởng Phòng' , '25000000' ,     0   , 'Trưởng Phòng NS'     , 'Fulltime' ,    10  ,      4     ,     6      ,   '2023-12-15'),          
         ( 'Đà Nẵng '   , '2023-10-20', 'Giám Đốc Marketing'  , '5 Year'   ,     1    , 'Giám Đốc'     , '30000000' ,     0   , 'Giám Đốc Marketing'  , 'Fulltime' ,    20  ,      7     ,     5      ,   '2023-11-20'),          
         ( 'TP.HCM'     , '2023-08-25', 'Quản Lý'             , '3 Year'   ,     2    , 'Quản Lý'      , '20000000' ,     0   , 'Quản Lý Dự Án'       , 'Fulltime' ,    15  ,      2     ,     2      ,   '2023-12-30'),          
         ( 'Hà Nội '    , '2023-10-20', 'Trưởng Phòng Dự Án'  , '5 Year'   ,     1    , 'Trưởng Phòng' , '25000000' ,     1   , 'Trưởng Phòng Dự Án'  , 'Fulltime' ,    20  ,      1     ,     7      ,   '2023-12-30'),          
         ( 'Hà Nội '    , '2023-08-22', 'Developper'          , '2 Year'   ,     4    , 'Nhân viên'    , '15000000' ,     0   , 'Tuyển Dev Java'      , 'Fulltime' ,    5   ,      8     ,     3      ,   '2024-01-28'),          
         ( 'Nghệ An '   , '2023-10-23', 'Developper'          , '1 Year'   ,     3    , 'Nhân viên'    , '12000000' ,     1   , 'Tuyển Dev Java'      , 'Fulltime' ,    6   ,      10    ,     4      ,   '2023-12-27'),          
         ( 'TP.HCM'     , '2023-09-25', 'Developer Game'      , '3 Year'   ,     2    , 'Nhân viên'    , '10000000' ,     0   , 'Developer Game'      , 'Fulltime' ,    8   ,      6     ,     8      ,   '2024-01-26'),          
         ( 'Hà Nội '    , '2023-09-30', 'Mobile App Developer', '2 Year'   ,     1    , 'Nhân viên'    , '15000000' ,     0   , 'Mobile App Developer', 'Fulltime' ,    10  ,      5     ,     9      ,   '2023-12-25'),          
         ( 'Hà Nội '    , '2023-09-28', 'Developper'          , '3 Year'   ,     1    , 'Nhân viên'    , '10000000' ,     0   , 'Tuyển Dev FrontEnd'  , 'Fulltime' ,    3   ,      3     ,     9      ,   '2023-12-25'),          
         ( 'Đà Nẵng '   , '2023-08-30', 'Manager'             , '5 Year'   ,     5    , 'Manager'      , '35000000' ,     0   , 'Tuyển Manager Dự Án' , 'Fulltime' ,    1   ,      9     ,     1      ,   '2023-12-26');          
          
INSERT INTO APPLY_POST (
		    CREATED_AT , RECRUITMENT_ID  , USER_ID ,   NAME_CV   , `STATUS`, `TEXT`    )  
 VALUES  ('2023-11-10' ,        1        ,    3    , 'Ứng Tuyển' ,     1   , 'Apply CV'),                  
         ('2023-10-20' ,        3        ,    2    , 'Ứng Tuyển' ,     2   , 'Apply CV'),                  
		 ('2023-09-15' ,        4        ,    9    , 'Ứng Tuyển' ,     0   , 'Apply CV'),                  
         ('2023-09-16' ,        6        ,    8    , 'Ứng Tuyển' ,     1   , 'Apply CV'),                  
		 ('2023-08-18' ,        7        ,    4    , 'Ứng Tuyển' ,     1   , 'Apply CV'),                  
         ('2023-10-20' ,        10       ,    6    , 'Ứng Tuyển' ,     1   , 'Apply CV'),                  
         ('2023-11-12' ,        9        ,    7    , 'Ứng Tuyển' ,     2   , 'Apply CV'),                  
         ('2023-08-25' ,        8        ,    5    , 'Ứng Tuyển' ,     1   , 'Apply CV'),                  
         ('2023-10-28' ,        2        ,    1    , 'Ứng Tuyển' ,     1   , 'Apply CV'),                  
         ('2023-09-30' ,        5        ,    10   , 'Ứng Tuyển' ,     0   , 'Apply CV');   
         
		-- Công ty nổi bật --     
select co.* ,max(re.QUANTITY) , count(ap.id), count(distinct ca.id) as svtut  from category ca
join recruitment re on ca.id = re.CATEGORY_ID
join company co on co.id = re.COMPANY_ID
join apply_post ap on ap.RECRUITMENT_ID = re.id
group by co.id
order by  max(re.QUANTITY) desc, count(ap.id) desc limit 1;

        -- Các bài đăng về việc làm nổi bật --
select re.*, co.NAME_COMPANY as companyName  from category ca
join recruitment re on ca.id = re.CATEGORY_ID
join company co on co.id = re.COMPANY_ID
join apply_post ap on ap.RECRUITMENT_ID = re.id
group by re.id
order by count(ap.id) desc, re.SALARY desc limit 1;

-- Top danh mục--
select ca.*, co.ADDRESS, co.NAME_COMPANY from category ca
join company co on ca.id = co.id
group by  ca.id
order by ca.NUMBER_CHOOSE desc limit 4;



