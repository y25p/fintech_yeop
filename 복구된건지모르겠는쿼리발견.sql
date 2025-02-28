### db는 어떻게 만드는가 ###
# 기본 틀
Create database sample;
Create schema sample;
# db조회
SHOW databases;

# 테이블만들기
# db먼저 활성화해주기
use sampledb; #gui환경에서는 클릭으로 충분하지만 쿼리로 할떄는 필요한 과정
#create table sample ( column1(INT), column2(Varchar(200));
create table customers(id int, name varchar(100), sex varchar(20), phone varchar(20), address varchar(255));

# 삭제하는건 
DROP table customers;
# drop delete는 데이터삭제

# market_db 만들기
Create database market_db;
use market_db;

# 테이블 hongong1 만들고 컬럼들만들기
# toy_id(INT), toy_name(char(4)), age(int)
create table hongong1 ( toy_id INT, toy_name char(4), age int );
show tables;
desc hongong1;

# 생성한 테이블에 데이터 입력하기
# 자료는 아직 안넣었지만 구조는 만드는 중이었음
# 이제 테이블명에 데이터 입력▼
# INSERT INTO 테이블명(컬럼명1, 컬럼명2, ... ) VALUES (1, '우디', 25)
#                       괄호 안의 순서에 맞게 값을 넣어준다는 점
INSERT INTO hongong1(toy_id, toy_name, age) VALUES(1, '우디', 25);

#확인 ) 
SELECT* FROM hongong1;

# id: 2, name 버즈이고 나이는 빈칸으로 insert하기
INSERT INTO hongong1(toy_id, toy_name) VALUES(2, '버즈');
# 컬럼 순서지정을 바꿔도 상관없음.

# 만약 컬럼의 순서를 바꾼다면? 
INSERT INTO hongong1(toy_name, age, toy_id) VALUES('제시', 20, 3);

#컬럼 순서지정을 안하고 넣는다면 기본 순서대로 넣어야한다.
INSERT INTO hongong1 VALUES(5, '포테이토', 40);
INSERT INTO hongong1 VALUES(6, '슬링키');

# 데이터 타입 지정이 이상할경우 주의할것. 

## primary key와 autoincrement 기능 추가해서 새 테이블 생성
create table hongong2(
             toy_id int AUTO_INCREMENT PRIMARY KEY,
             toy_name char(4),
             age int);

desc hongong2;

# AUTO_INCREMENT로 인해 자동증가되는 컬럼에 데이터를 입력하는 방법
INSERT INTO hongong2 values(null,'보핍',25);
INSERT INTO hongong2 values(null,'렉스',21);

select* from hongong2;
# 이렇게, id 컬럼에 auto(자동)increment 기능 써봄.


## ALTER: 컬럼의 속성(데이터타입) 변경하거나 추가제거
# ALTER TABLE sample ADD COLUMN 컬럼명, 자료형, 속성(NOT NULL, UNIQUE)
# hongong2 테이블에 country 컬럼 추가하기
ALTER TABLE hongong2 ADD COLUMN country varchar(100);
select * from hongong2

# 기존 데이터 덮어쓰기
# UPDATE 테이블명 SET 컬럼명 = 덮어쓸 값 WHERE 컬럼명=1
UPDATE hongong2 SET country='미국'; # excute 안되는이유 충돎방지시스템떄문.

# where추가
UPDATE hongong2 SET country='미국' WHERE toy_id=1;
select * from hongong2;

# 테이블 구조는 남기고 값만 지우기.
#TRUNCATE TABLE hongong2;
# 만약에 대량의 데이터에서 truncate를 잘못쓴다면 되돌릴수도없는점 주의

# 값 삭제 delete from where
DELETE FROM hongong1 WHERE toy_id=2;
# 이 명령은 safe update가 켜져있다면,
# 또 pk가 지정이 안된 테이블이라면 중복값도 있을 수있다.

# 컬럼 추가하고 PK로 지정하고 AUTO_INCREMENT 되도록
ALTER TABLE hongong1 ADD COLUMN idx INT AUTO_INCREMENT PRIMARY KEY;
# 그다음 그걸 지우고
DELETE FROM hongong1 WHERE toy_id=2;
INSERT INTO hongong1 VALUES(7,'렉스',30, NULL);
DELETE FROM hongong1 WHERE idx=2;
select * from hongong1;
# idx에 PK줬기때문에 삭제 가능함. 삭제하더라도 다음값은 안바뀜

# 예제
Create database market;
use market;
create table product (name varchar(100), price int, date varchar(20), company varchar(20), last int);
create table membership (id int AUTO_INCREMENT PRIMARY KEY, member_id varchar(100), name varchar(20), address varchar(255));
INSERT INTO membership (id, member_id, name, address) 
VALUES(null, 'jyp', '박진영','경기 고양시 장항동');

INSERT INTO product (name, price, date, company, last) 
VALUES('삼각김밥', 1000, 2025-02-26,'CJ', 22);
select* from product;











