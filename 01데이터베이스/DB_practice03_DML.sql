use korea_stock_info;
show tables;
select* from stock_company_info;
# 7~9월간 네이버증권통해 크롤링으로 수집된 데이터

select * from 2024_09_stock_price_info limit 1000;
USE korea_exchange_rate;
show tables;
select count(*) from exchange_rate;

# 데이터양이 많은경우 쿼리를 통해 카운팅alter
# 38만개가 있지만 최대로 50000개까지 밖에 못보여줌
# 2000년대 이후를 보고싶다면 date의 값을 2000-05-04보다 큰것
select* from exchange_rate where date > "2000-05-04";

# 구간이 있다면, 그리고 통화를 지정한다면
select* from exchange_rate 
where date >= "2020-01-01"
and date <= "2020-12-31" and 통화="유로 EUR";

# GROUP BY 예제
# 예) 1년치 데이터를 조회하되, 통화별로 최대최소평균값
select 통화, MIN(현찰_살때_환율) 최저가, MAX(현찰_살때_환율) 최고가, AVG(현찰_살때_환율) 평균가 from exchange_rate 
where date >= "2020-01-01" and date <= "2020-12-31" 
GROUP BY 통화;

# ROUND 함수는 언제쓰나
# 위 예제 결과 평균가가 소수점 몇자리까지인지 지정되어있지않음
 round(AVG(현찰_살때_환율),2); #소수점 둘째짜리까지만 조회.
 
 #이제 한국stock으로
 use korea_stock_info;
 show tables;
 
 # 데이터 수집할때 용량탓에 월별로 나눴음
 # 자동으로 달이 바뀌며 테이블을 새로 만들도록 했음
 # 1년치를 한눈에 볼수있게 합치는 법
 select * from 2024_08_stock_price_info;

# UNION
# 7~9월 테이블을 합치려할때
# JOIN을 쓰면 테이블 좌우로 붙지 같은 컬럼을 찾아서 이어지는 방식이 아니므로 쓰기어려움
select * from 2024_07_stock_price_info
union all 
select * from 2024_08_stock_price_info
union all
select * from 2024_09_stock_price_info;
# 이렇게 합칠 수 있음

#위 코드를 가지고 새로운 테이블 만들고싶으면 create로 새 테이블명 만들 수 있음.
create table stock_2024_all AS 
select * from 2024_07_stock_price_info
union all 
select * from 2024_08_stock_price_info
union all
select * from 2024_09_stock_price_info;

