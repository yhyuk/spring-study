-- Restful API

create table tblColor (
    seq number primary key,         --PK
    name varchar2(100) not null,    -- 색상명
    rgb varchar2(7) not null,       -- RGB(#FFFFF)
    example varchar2(100) null
);

create sequence seqColor;


insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'gold', '#FFD700', '병아리');
insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'tomato', '#FF6347', '토마토');
insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'cornflowerblue', '#6495ED', '포카리');
insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'white', '#FFFFFF', '마스크');
insert into tblColor (seq, name, rgb, example) values (seqColor.nextVal, 'black', '#000000', '선글라스');

commit;

select * from tblColor;