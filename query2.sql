SELECT * FROM student;

insert into student value ('st101', 'Tom', 15, 'M', 2);
insert into student value ('st102', 'Jane', 16, 'F', 3);
insert into student value ('st103', 'Yakima', 14, 'M', 1);
insert into student value ('st104', 'Yong', 14, null, 1);
insert into student value ('st105', 'Minyo', 0, 'F', null);
insert into student value ('st106', 'Kang', 15, null, 2);
insert into student value ('st107', 'Kim', 0, 'M', null);
insert into student value ('st108', 'Miranda', 15, 'F', 2);

SELECT COUNT(distinct(userid)) ,
       COUNT(distinct(username)),
       count(distinct(age)),
       count(distinct(gender)),
       count(distinct(grade))
       from student;


SELECT userid as '아이디' from student;

SELECT username as '이름' from student where grade = 1;

SELECT username, age from student where age>=15;

SELECT userid from student where gender is null or gender = '';

SELECT username as '이름' , age as '연령', grade as '학년' from student where userid = 'st101' or userid ='st102';

select * from student where gender = 'F' and age >= 15;

SELECT userid, username from student where grade = 2 and gender='M';

select avg(age) from student where gender = 'M' and age > 0 ;

select *
from student order by age asc;

UPDATE student set age = 14 where userid = 'st105';
UPDATE student set age = 15 where userid = 'st107';

UPDATE student set grade=
case
    when age = 14 then 1
    when age = 15 then 2
    when age = 16 then 3
end where grade is null;

update student
set gender = 'M' where gender is null or gender ='';

select if(gender = 'M', '남자', '여자') as '성별' from student;

select userid as '아이디', (case
    when gender ='M' then '남'
    when gender= 'F' then '여'
end) as '성별' from student;


select userid, username, concat(grade, '학년') as '학년'
from student;

select username , length(username) from student;

select concat(username,length(username)) as '이름(길이)' from student;

select userid as '아이디' , substring(username , 1, 2) as '이름' from student;

select userid as '아이디', concat(substring(username,1,2),'**') as '이름' from student;

select * from student where length(username) >= 5;

create table studentscore_copy(
    unq int not null ,
    userid varchar(20) not null ,
    loc varchar(10) not null,
    kor tinyint unsigned default '0',
    eng tinyint unsigned default '0'
);