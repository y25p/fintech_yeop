## SQL 함수
# 셀렉트와 항상 함께한다.
# SELECT 함수(값)
# MAX(), MIN()은 아까 예제통해했음.

# ABS() 절대값 알려줌
select abs(-680) '680의 절대값', abs(-380);

# LENGTH("문자열") 문자열의 글자수+공백 ;
SELECT length("HAPPY SQL");

# ROUND() 반올림 해줌
SELECT ROUND(3.1415921678, 3);

# CEIL() 올림, FLOOR() 내림
SELECT CEIL(4.131592); #소수점있으면 무조건 올려서 정수로 만듦
SELECT FLOOR(5.232453); #소수점 상관없이 내려서 정수로 만듦

# 연산 -,+,*,/,%,DIV, MOD
SELECT 7*2; #사칙연산내가생각하는 기호들 맞음
#주의할거 % : 나머지값만 보여줌 몫 제외
SELECT 7%2; #MOD 함수랑 같음
# DIV함수
SELECT 7 DIV 2;

# 제곱,     루트, 음수양수 여부
# POWER, SQRT, SIGN   모두 괄호 씀
SELECT POWER(4,3);
SELECT SQRT(5);
SELECT sign(-78), SIGN(9); # 음수넣었으니까 -1로 음수라고 알려줌

# TRUNCATE는 셀렉트를 만나면 버림함수가된다.
# TRUNCATE(값, 자리수) 자리수 밑으로는 버림
# ROUND와 비교해보면
SELECT ROUND(1.2345, 3), TRUNCATE(1.2345,3);
# 음수의 자리수는 소수점 앞자리가 되므로
SELECT ROUND(1.2345, -2), TRUNCATE(1.2345,-2); #이건 답이 모두 0이되며
SELECT ROUND(1111.2345, -2), TRUNCATE(1111.2345,-2); #1100으로 계산한다.

# char_length : 글자수 세어주는 함수
SELECT char_length('my sql'), length('my sql');
SELECT char_length('고길동'), length('고길동');
# length는 글자수라고하기 애매함
# 한글 자체가 자리 한칸당 3씩 잡는다. 받침이 있든없든.

# CONCAT: 공백없는 문자열로 바꿔줌
# np나 pd에 콘캣은 계속나온다 
SELECT CONCAT('THIS', 'IS', 'MYSQL') AS CONCAT1;
# 공백을 넣고싶은 자리에만 ' MYSQL'요런식으로 넣어주면 가능함.
# SELECT CONCAT(' ', 'THIS', ' ', 'MYSQL') AS CONCAT1 도 가능.

# 중간에 NULL있으면 다른글자들도 지우고 NULL만 보여줌
SELECT CONCAT('THIS', NULL, 'MYSQL') AS CONCAT1;
# :와 같은 구분자 넣기도 가능
SELECT CONCAT('THIS', ' : ', 'MYSQL') AS CONCAT1;

# **파이썬에서 활용하는 경우 JOIN함수를 통해 하나로 합치는데 콘캣이 쓰임.

# CONCAT_WS
SELECT CONCAT('오빠', ' VS ', '언니') AS CONCAT1;
# VS가 반복되므로 WS이용해보자
SELECT concat_ws('VS', '아빠', '엄마', 'MYSQL') AS CONCAT1;
# result: 아빠VS엄마VSMYSQL

# 영어 대소문자 변환
select lower('ABcd:'); #기호,
select upper('ef쥐쥐'); # 한글은 무시하고 변환

# lpad(값, 자리수, 채울문자) rpad <<엘페드랑 똑같이씀
# 문자열의 자리수를 일정길이로 끊고
# 자리가 남으면 채울문자를 넣어줌
select lpad('sqlsqlsql',8,' ');
select rpad('sqlsql',7,'@');

# ltrim과 rtrim : 공백청소기
select ltrim(' mom  mother'); #mom앞만 지워줌
# 그냥 trim 문자열의 겉에있는 공백만 제거가능
select trim('   s q l '); # 문자 사이의 공백은 안됨


# LEFT와 RIGHT: 문자열 사이를 컷
SELECT LEFT ('THIS IS MY SQL',4);
# 왼쪽 기준 몇번째 자리까지 자를지.
SELECT RIGHT('THIS IS ME',4); # > S ME
# 한국어를 넣어보자
SELECT RIGHT('이것이 마이에스큐엘이다.',4), LEFT ('이것도 마이에스큐엘이다.',4);
# 넣는 숫자가 정직하다
# 이 함수들은 LENGTH가 아니라 CAR_LENGTH를 사용한다는점

# SUBSTR: 문자열 중간에서 잘러
# 시작 위치를 정해줌
# SUBSTR(문자열, 시작점, 길이)
SELECT SUBSTR('ABCDEFGH',6,5);
SELECT SUBSTR('ABCDEFGH',6); #> FGH
# 길이 안알려줘도 잘린데서 있는대로 끝까지 보여줌
# 인덱싱: 숫자로 자리를 지정하는것

# TRIM(LEADING ' 삭제할문자' FROM, 전체 문자열);
SELECT TRIM(LEADING ' ' FROM '  MY  S Q L'); 
#>MY  S Q L
SELECT TRIM(TRAILING '*' FROM '*S* MY* *'); 
#>*S* MY* 
SELECT TRIM(BOTH '8' FROM '88 8MY8S88'); 
#> 8MY8S
# 공백도 문자니까 스킵못하고 겉에만 지워줌.
# 여기까지가 문자형 함수

## 날짜형 함수
# CURDATE() : 현재의 연월일
SELECT curdate();           #>2025-02-27
SELECT CURTIME();           #>16:18:30
SELECT NOW();               #>2025-02-27 16:18:57
SELECT current_timestamp(); #>2025-02-27 16:19:17

# DAYNAME(날짜) 요일표시 함수 
select DAYNAME("2025-02-27 16:18:57"); #>Thursday
select DAYNAME("2025-05-12 16:18:57"); #>Monday

# DAYOFWEEK: 요일을 번호로 
select dayofweek(now()); #>5
# DATE_FORMAT 함수하고 다른점 주의 일요일이 0으로 시작.
# DAYOFWEEK는 일요일이 1.

# DAYOFYEAR() : 1월1일부터 오늘이 며칠째인지.
SELECT DAYOFYEAR(NOW()); #>58

# LAST_DAY: 매달의 마지막날이 28,30,31일중 무엇인지 출력
SELECT LAST_DAY('2022-03-27 16:19:17'); #>2022-03-31

# YEAR : 연도만 추출
# MONTH, DAY도 같은 방식으로 씀
SELECT day('2020-03-31'); #>31
SELECT month('2020-03-31'); #>3
SELECT MONTHNAME('2020-03-31'); #>March

# QUARTER: 분기계산
SELECT QUARTER(now()); #>1
SELECT QUARTER(19930512); #>2
SELECT QUARTER('2093-05-12'); #>2
# 따옴표 안붙여도 되넹 좋다

# WEEKOFYEAR: 몇 주차인지
SELECT WEEKOFYEAR(20930512); #>20

# DATE_ADD 날짜를 지정한 날 수 만큼 더하기
SELECT ADDDATE(NOW(), 100);
SELECT ADDDATE(NOW(), -100); # 빼기도 가능
# 더 길게 쓰기 SELECT DATE_ADD(NOW(), INTERVAL 100 DAY)

# SUBDATE : 애드데이트 뺴기버전 2
SELECT SUBDATE(NOW(), 100);

# DATEDIFF(날짜1, 날짜2) : 날짜1빼기 날짜2
SELECT DATEDIFF(NOW(), 20241225); #>64
#작년 크리스마스에서 며칠째인지 *************************

# EXTRACT: 시분초년월일 중 원하는 것만 추출
# EXTRACT(옵션, FROM 연월일시분초)
SELECT EXTRACT(YEAR_MONTH FROM NOW()); #>202502
SELECT EXTRACT(DAY_HOUR FROM NOW()); #>16
SELECT EXTRACT(MINUTE_SECOND FROM NOW()); #>5045
# 50분45초라서 이렇게 나온듯

# DATE_FORMAT 날짜표기 커스텀~ 원하면 미국식 날짜표기가능
# %Y :YYYY
# %M :MM   두 자리 월
# %b :JAN  이런식으로 축약어 **소문자로
# %D :DD
# %E :1자리 일표기
select DATE_FORMAT(NOW(), '%E-%M-%Y'); #>E-February-2025
select DATE_FORMAT(NOW(), '%b'); #>Feb 
select DATE_FORMAT(20250301, '%y'); #>25

# %H :24시간제 표기
# %h :12시간제 표기
# %p :AM/PM 표시
# %i :00분 2자리로 표기
# %s :00초 2자리로 표기 이건 대문자도 되는듯
select DATE_FORMAT(NOW(), '%s'), DATE_FORMAT(NOW(), '%S');#>46	46

# %T : 시:분:초 (24시간제)
# %r : 시:분:초 (12시간제 AM/PM)
# %W : 영어요일 
# %w : 소문자로하면 숫자(토6 일0)
SELECT date_format(NOW(),'%T'); #>17:20:57
SELECT date_format(NOW(),'%r'); #>05:21:47 PM
SELECT date_format(NOW(),'%p %h : %i : %S'); #>PM 05 : 23 : 54

