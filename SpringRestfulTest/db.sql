create table tblColor (
    seq number primary key,         --PK
    name varchar2(100) not null,    --색상명
    rgb varchar2(7) not null,       --RGB(#FFFFFF)
    example varchar2(100) null
);

create sequence seqColor;

DROP SEQUENCE seqColor;

insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'gold', '#FFD700', '병아리');
insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'tomato', '#FF6347', '토마토');
insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'cornflowerblue', '#6495ED', '포카리');
insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'white', '#FFFFFF', '마스크');
insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'black', '#000000', '선글라스');

commit;

select * from tblcolor;




-- 스프링 트랜잭션
create table tblSpringMember (
    id varchar2(30) primary key,
    point number default 1000 not null
);

create table tblSpringBoard (
    subject varchar2(1000) primary key,
    id varchar2(30) not null references tblSpringMember(id)
);

-- 정책
-- > 글쓰기 > 포인트 적립(+100)

insert into tblSpringMember values ('hong', default);
commit;

select * from tblSpringBoard;
select * from tblSpringMember;























