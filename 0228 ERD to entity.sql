use db_model_practice

#department 학과
desc db_model_practice.department;

insert into Department(Department_id, Department_name) values(1, '수학');
insert into Department values(2, '국문학');
insert into Department values(3, '정보통신공학');
insert into Department values(4,'모바일공학');

#student 학생
SELECT * FROM db_model_practice.student;
desc student;

# select * from student left join department on stuent.department_id=department.department_id;

insert into Student(student_id, student_name, height, department_id) values(1, '가길동', 177, 1);
insert into student values(2, '나길동', 178, 1), 
insert into student values(3, '다길동', 179, 1);
insert into student values(4,'라길동', 180, 2);
insert into student values(5,'마길동', 170, 2);
insert into student values(6,'바길동', 172, 3);
insert into student values(7,'사길동', 166, 4);
insert into student values(8,'아길동', 192, 4);

delete from student where student_id=4;

#professor 교수
SELECT * FROM db_model_practice.professor;
desc db_model_practice.professor;

insert into professor(professor_id, professor_name, department_id) 
values(1, '가교수', 1),(2, '나교수', 2),(3, '다교수', 3), (4, '빌게이츠', 4), (5,'스티브잡스',3);


#course 개설과목
SELECT * FROM db_model_practice.course;
desc db_model_practice.course;
insert into course (course_id, course_name, professor_id, start_date, end_date) 
values(1, '교양영어', 1, '2016/9/2', '2016/11/30');
insert into course values (2, '데이터베이스 입문', 3, '2016/8/20', '2016/10/30') , (3, '회로이론', 2, '2016/10/20', '2016/12/30');
insert into course values (4, '공업수학', 3, '2016/11/2', '2017/1/28') , (4, '객체지향프로그래밍', 3, '2016/11/1', '2017/1/30');

# student_course
SELECT * FROM db_model_practice.student_course;
desc db_model_practice.student_course;
insert into student_course(Student_id, course_id) values(1, 1);
insert into student_course values(2, 1), (3, 2), (4, 3), (5, 4), (6, 5), (7, 5);


# 문제1
# auto_increment 줄것
#create view q1 as 
#select student.student_id, student_name, height, 
#from studnet

