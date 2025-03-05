select * from titanic.ticket;
select * from titanic.passenger;
use titanic;
desc ticket;

select* from passenger inner join ticket on passenger.PassengerId= ticket.PassengerId; 
select* from passenger left join ticket on passenger.PassengerId= ticket.PassengerId; 

select* from passenger left join ticket on passenger.PassengerId= ticket.PassengerId
inner join surv on passenger.passengerId=surv.passengerId;

desc passenger;

# 문제1
# passenger, ticket, survived 테이블을 조인하고
# Survived가 1인 사람들만 찾아서 
# Name, Age, Sex, Pclass, survived 컬럼을 출력하시오.

# 출력해야하는 컬럼들은 어느 테이블에 있나? 
select * from titanic.passenger; #이름, 성별까지있음
select * from titanic.ticket; # pclass는 여깄음
select * from titanic.survived; # survived 있음

# 이테이블들을 조인한다면 이너?레프트?
select Name, Age, Sex, Pclass, survived from survived left join passenger on survived.passengerId=passenger.PassengerId
left join ticket on survived.passengerId=ticket.passengerId
# 이위에까지가 한테이블이라고 생각하고 survived=1인 경우구하기
where survived=1
limit 10; # 문제 2 해결


# 문제3
# 맞았다!
SELECT Name, sex, Pclass FROM passenger 
left join ticket on passenger.passengerId left join survived on passenger.passengerId 
where sex='female' and Pclass=1 and survived=1;

# 문제4
SELECT * FROM passenger 
left join ticket on passenger.passengerId 
left join survived on passenger.passengerId
where age between 10 and 20 and Pclass=2 and survived=1;

# 문제5
SELECT * FROM passenger 
left join ticket on passenger.passengerId 
left join survived on passenger.passengerId
where sex='female' or Pclass=1
having survived=1;

# 괄호사용해보기
SELECT * FROM passenger 
left join ticket on passenger.passengerId 
left join survived on passenger.passengerId
where (sex='female' or Pclass=1) and survived=1;
# 여기서 male은 아예안나왔는데 원래그런건가???

# 문제6
# passenger, ticket, survived 테이블을 left join 후 
# 생존자 중에서 이름에 Mrs가 포함된 사람을 찾아 
# 이름, Pclass, 나이, Parch, Survived 를 표시하시오.
SELECT name, Pclass, age, parch, survived FROM passenger p left join ticket t on p.passengerId=t.passengerId
left join survived s on p.passengerId=s.passengerId 
where survived=1 and name like "%mrs%";

# 문제7
#passenger, ticket, survived 테이블을 left join 후 
#Pclass가 1, 2이고 Embarked가 s, c 인 사람중에서 생존자를 찾아 이름, 성별, 나이를 표시하시오.

#SELECT name, sex, age FROM passenger p
SELECT name, sex, age FROM passenger p
left join ticket t on p.passengerId = t.passengerId 
left join survived s on p.passengerId = s.passengerId
where (Pclass in (1,2) and Embarked in("s","c") ) and survived=1;

# 문제8
SELECT name, sex, age FROM passenger p
left join ticket t on p.passengerId = t.passengerId 
left join survived s on p.passengerId = s.passengerId
where name like "%james%" and survived=1 
order by age desc;


# 문제9
# passenger, ticket, survived 테이블을 INNER JOIN한 데이터에서 
# 성별별, 생존자의 숫자를 구하시오. 생존자 숫자 결과는 별칭을 Total로 하시오.
#

select sex, count(*) total from passenger p 
inner join ticket t on p.passengerId=t.passengerId
inner join survived s on p.passengerId=s.passengerId
where s.survived=1
group by sex;


# 문제10 
# 맞았다. 쉬웠음
# passenger, ticket, survived 테이블을 INNER JOIN한 데이터에서 
# 성별별, 생존자의 숫자, 생존자 나이의 평균을 구하시오. 
# 생존자 숫자 결과는 별칭을 Total로 하시오.
select sex, count(survived) total, avg(age),2 from passenger p 
inner join ticket t on p.passengerId=t.passengerId
inner join survived s on p.passengerId=s.passengerId
where survived=1
group by sex;

# 문제11
# passenger, ticket, survived 테이블을 INNER JOIN한 데이터에서 
# 성별별, pclass별, 생존자별로 
# pclass, sex, survived, survived의 클래스별 합계, 생존자/사망자의 나이 평균을 구하시오.
# survived의 별칭은 is_survived로, 생존자 클래스별 합계는 별칭을 survived_total로, 생존자/사망자의 나이 평균은 별칭을 avg_age로 하시오.

select sex, pclass, survived is_survived, 
count(survived) survived_total, avg(age) avg_age from passenger p 
inner join ticket t on p.passengerId=t.passengerId
inner join survived s on p.passengerId=s.passengerId
# where survived=1 을 넣으면 사망자 수 구하지 못하니까.
group by sex, pclass, survived
order by sex, pclass; # 생존에 대한내용도 여기 넣어주셨음



