### DB는 어떻게 만드는가 ###
#Create database 만들려는_DB명 
#Create schema 만들려는_DB명

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

## PK와 auto_increment 기능 추가해서 새 테이블 생성
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

## ALTER: 컬럼의 속성(데이터타입) 변경하거나 새 컬럼 추가
# ALTER TABLE sample ADD COLUMN 컬럼명, 자료형, 속성(NOT NULL, UNIQUE)
# hongong2 테이블에 country 컬럼 추가하기
ALTER TABLE hongong2 ADD COLUMN country varchar(100);
select * from hongong2

## UPDATE
# 기존 데이터 덮어쓰기
# UPDATE 테이블명 SET 컬럼명 = 덮어쓸 값 WHERE 컬럼명=1;
UPDATE hongong2 SET country='미국'; # excute 안되는이유 충돎방지시스템떄문.

# where추가
UPDATE hongong2 SET country='미국' WHERE toy_id=1;

## 데이터 지우기 DELETE
DELETE FROM hongong1 WHERE toy_id=2;

# 예제풀이
#SELECT * FROM market.product;
#ALTER table product ADD COLUMN prod_id int AUTO_INCREMENT primary key;
#SELECT * FROM market.product;

# 워크밴치 GUI통해서 변경한 내용
ALTER TABLE `market`.`product` 
ADD COLUMN `prod_id` INT NOT NULL AUTO_INCREMENT AFTER `last`,
ADD PRIMARY KEY (`prod_id`);
SELECT * FROM market.product;

SELECT * FROM market.membership;
DESC market.membership;
INSERT INTO membership VALUES(null, 'akmu2', '악뮤');

#rollback 연습
CREATE DATABASE mywork;
USE mywork;
CREATE TABLE emp_test
(emp_no int not null, emp_name varchar(30) not null,
hire_date date null, salary int null, primary key(emp_no));
desc emp_test;
INSERT INTO emp_test
(emp_no, emp_name, hire_date, salary)
values (1005, '퀴리', '2021-03-01', 4000),
	   (1006, '호킹', '2021-03-05', 5000),
       (1007, '패러데이', '2021-04-01', 2200),
       (1008, '맥스웰', '2021-04-04', 3300),
       (1009, '맥스웰', '2021-04-04', 3300);
       select* from mywork.emp_test;
	
# 5시부터 내용 수정 예제
# 위 테이블에서 호킹의 salary를 10000으로
# 패러데이의 hire_date를 2023-07-11로

UPDATE emp_test SET salary=10000 WHERE emp_no=1006;
#  salary의 dt가 int인점 놓침!!
UPDATE emp_test SET hire_date='2023-07-11' WHERE emp_no=1007;
DELETE emp_test WHERE emp_no=1009;
select* from mywork.emp_test;

#오토커밋 옵션 활성화 확인
select @@autocommit; # 결과가 1이면 켜진것.
SET autocommit=0; #오토커밋 0으로 비활성화-아웃풋창에 0row affected
#커밋이라고 따로 입력해줘야 반영되도록 되어있음

#다른테이블 카피하는 방식으로 테이블생성하기
CREATE TABLE emp_tran1 as SELECT * FROM emp_test;
select* from emp_tran1;
DESC emp_tran1;
DESC emp_test; # 해보면 PK복사가 안되어있는점 볼수있음
ALTER TABLE emp_tran1 add constraint primary key(emp_no);

drop table emp_tran1;

