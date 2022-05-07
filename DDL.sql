CREATE DATABASE Course

USE Course;

create table department(
dept_id int not null,
dept_name varchar(225) not null,
PRIMARY KEY (dept_id)
);

create table student(
student_id int not null,
student_name varchar(225) not null,
major varchar(225) not null,
`level` char(5) not null,
age int not null,
PRIMARY KEY (student_id)
);

create table professor(
prof_id int not null,
prof_name varchar(225) not null,
dept_id int not null,
PRIMARY KEY (prof_id),
FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE CASCADE
);

create table course(
course_code varchar(225) not null,
name varchar(225) not null,
PRIMARY KEY (course_code)
);

create table semester_course(
course_code varchar(225) not null,
quarter varchar(225) not null,
`year` int not null,
prof_id int not null,
PRIMARY KEY (course_code,quarter,`year`),
FOREIGN KEY (course_code) REFERENCES course(course_code) ON DELETE CASCADE,
FOREIGN KEY (prof_id) REFERENCES professor(prof_id) ON DELETE CASCADE
);


create table enrolled(
student_id int not null,
course_code varchar(225) not null,
quarter varchar(225) not null,
`year` int not null,
enrolled_at DATE not null,
PRIMARY KEY (student_id,course_code,quarter,`year`),
FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
FOREIGN KEY (course_code) REFERENCES course(course_code) ON DELETE CASCADE
);
