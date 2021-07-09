insert into board_copy (title,pass,name,content,rdate) value
('축구경기', '1234','축구사랑','어제 아이들과 땅콩을 먹으며 축구를 보았다.',now());

insert into board_copy (title,pass,name,content,rdate) value
('학습과목','qwerty','행정','JAVA,JSP,HTML',now());

insert into board_copy(title, pass, name, content, rdate) value
('땅콩회항','4321','뱅기','어제 비행기가 땅콩 때문에 회항함',now());

SELECT title,name,content from board where unq=3;
select concat(title,'(',length(content),')') from board;

update board_copy set hits=15 where unq=3;
update board_copy set hits=50 where unq=2;
update board_copy set hits=43 where unq=1;

select *
from board where title like '%축구%';

select *
from board where content like '%JAVA%';

select *
from board where title or content like '%땅콩%';

select *
from board order by hits DESC;

select * from board order by rdate DESC;

select * from board order by hits DESC limit 0,1;

UPDATE board set title='땅콩회항사건' , name='김기자' where unq=3;

update board set hits=hits+1 where unq=(SELECT unq from board where name='축구사랑');
                                        /* 리턴값 1 */
SELECT unq from board where name='축구사랑';