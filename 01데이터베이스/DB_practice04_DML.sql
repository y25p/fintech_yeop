select * from db_model_practice.department;
SELECT * FROM db_model_practice.student;
select * from student s left join department d
on s.department_id = d.Department_id;

#select * from student s left join department d
#on s.department_id = d.Department_id

# 문제2.
select professor_id from professor 
where professor_name='가교수';
# 마지막에 셀렉트를 수정

# 문제3
# 별이니까 그룹바이 학과이름 . 교수의 수
# join해서 그룹연산 해야 나오는값.
SELECT * FROM professor;
SELECT * FROM department;
SELECT * FROM professor p left join department d
on p.department_id = d.Department_id;

#학과이름 별이니까 이름이 중심이되어야한다.
SELECT department_name, count(professor_id) '교수의 수'
from professor p left join department d
on p.department_id = d.Department_id
group by d.department_name;

# 문제4
SELECT * FROM student s
left join department d
on s.department_id=d.Department_id
where Department_name='정보통신공학';

# 문제5
# 교수테이블과 과목테이블 조인한 후 where로 정보통신공학과 교수이름 나오게
SELECT * FROM professor p
left join department d
on p.department_id=d.Department_id
where department_name = '정보통신공학';

#이렇게만하면 department_id가 두번나오게됨 셀렉트에 어느테이블쓸건지 정해주기
SELECT  FROM professor p
left join department d
on p.department_id=d.Department_id
where department_name = '정보통신공학';

# 6. 성(맨앞글자)가 '아'인 학생이 속한 학과명과 학생명 출력
SELECT Student_name, department_name FROM student s 
left join department d on s.department_name = d.department_name
where student_name like '아%';

#7.키가 180~190 사이 속하는 학생수
SELECT count(student_id) FROM student where height between 180 and 190;

#8. 학과이름별 키 최고값, 평균값
# 이름별이면 group by #round에 소수점몇자리인지 지정하지 않으면 정수로 떨굼
SELECT department_name, max(height), round(avg(height), 0) FROM student s
left join department d on s.Department_id=d.Department_id
group by department_name;

# 문제9
# 다길동과 같은학과인 학우이름을 출력하세요
SELECT Student_name FROM student where Student_name='다길동';
SELECT Student_name FROM student where department_id=4;
# 서브쿼리로 한줄 쿼리 가능.
SELECT Student_name FROM student where department_id=(
SELECT department_id FROM student where Student_name='아길동');


# 문제 10
# 2016년 11월 시작하는 과목을 수강하는 학생의 이름과 수강과목
# s.student_name, c.course_name
SELECT * FROM course c where start_date like '2016/11/%';
# 문제 앞부분은 풀었음 

SELECT student_name, course_name FROM student s left join student_course sc
on s.Student_id = sc.Student_id 
left join course c
on sc.course_id= c.course_id
where start_date like '2016-11-%';

# 문제 12
# course_id가 4번인것 먼저찾고
SELECT * FROM professor p left join course c
on p.professor_id = c.professor_id
where professor_name='빌게이츠';

# 코스아이디=4인 수업의 학생리스트 뽑고 카운트 씌우기

# 서브쿼리로 한꺼번에 해보기

SELECT count(*) FROM student s left join student_course sc
on s.student_id = sc.studnet_id
where professor_name='빌게이츠';