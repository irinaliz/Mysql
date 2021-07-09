insert into studentscore_copy value (1,'st101', 1, 82,95);
insert into studentscore_copy value (2,'st102', 2, 45,96);
insert into studentscore_copy value (3,'st103', 3, 78,17);
insert into studentscore_copy value (4,'st104', 4, 89,28);
insert into studentscore_copy value (5,'st105', 4, 55,48);
insert into studentscore_copy value (6,'st106', 3, 81,18);
insert into studentscore_copy value (7,'st107', 2, 72,99);
insert into studentscore_copy value (8,'st108', 1, 54,91);
insert into studentscore_copy value (9,'st109', '서울', 54,99);
insert into studentscore_copy value (10,'st110', '서울', 82,95);

Update studentscore set loc=(case
    when loc=1 then '서울'
    when loc=2 then '대구'
    when loc=3 then '원주'
    when loc=4 then '전주'
    end );

select * from studentscore order by eng DESC;

SELECT * from studentscore
where eng= (SELECT max(eng) from studentscore);

SELECT (kor+eng)/2 from studentscore where userid ='st101';

select userid from studentscore where kor < 60;

select * from studentscore where kor >= 60 and eng >= 60;

select * from studentscore where kor < 60 or eng < 60;

select * from studentscore order by eng Desc limit 0,5;
/* 0번에서 시작해서 5줄을 체크 */
select * from studentscore order by eng DEsc limit 5,5;
/* 6번부터 시작해서 5줄을 체크 */

select userid, loc, (kor+eng) from studentscore order by (kor+eng) DESC limit 0,1;

update studentscore set eng=eng+5 where userid = 'st101';

select * from studentscore where loc ='대구';

select count(loc) from studentscore where loc='대구';

select userid, eng from studentscore where loc='대구' and  eng = (select max(eng) from studentscore where loc= '대구');
select userid ,eng from studentscore where loc='대구' order by eng DESC limit 0,1;

select userid, (kor+eng) as '총점'
from studentscore order by kor+eng DESC limit 0,1;
/* 위에 구문은 limit으로 같든, 안같든 무조건 1명만 출력 */
select userid, (kor+eng) as '총점' from studentscore
where kor+eng = (select max(eng+kor) from studentscore);
/* 위에 구문은 두 합 같고 최고인 사람을 다 출력 */

update studentscore set loc = (
    case
        when loc='서울' then '서울특별시 강남구'
        when loc='대구' then '대구광역시 수성구'
        when loc='원주' then '강원도 원주시'
        when loc='전주' then '전라북도 전주시'
    end
    );

select *
from studentscore where loc like '%전주%';

select * from studentscore
where kor>50 and loc like '%전주%';

select * from studentscore
where kor like '%5' and loc like '%전주%';

SELECT count(loc) from studentscore where loc like '대구%';

select avg(eng) from studentscore where loc like '%강원도%'


CREATE table board_copy (
    unq int unsigned not null auto_increment,
    title varchar(200) not null ,
    pass varchar(100) not null ,
    name varchar(20),
    content text,
    hits int unsigned default 0,
    rdate datetime,
    primary key (unq)
);