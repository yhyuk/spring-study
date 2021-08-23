--db.sql (aJax)

create table tblAjaxUser (
    seq number primary key,
    name varchar2(30) not null,
    age number not null,
    address varchar2(300) not null,
    birthday varchar2(10) not null
);

create sequence seqAjaxUser;

insert into tblAjaxUser (seq, name, age, address, birthday) values (seqAjaxUser.nextVal, '홍길동', 20, '서울시 강남구', '2001-01');
insert into tblAjaxUser (seq, name, age, address, birthday) values (seqAjaxUser.nextVal, '아무개', 20, '서울시 강동구', '1995-11');
insert into tblAjaxUser (seq, name, age, address, birthday) values (seqAjaxUser.nextVal, '테스트', 20, '인천시 동구', '1997-10');
insert into tblAjaxUser (seq, name, age, address, birthday) values (seqAjaxUser.nextVal, '하하하', 20, '인천시 남구', '2001-05');
insert into tblAjaxUser (seq, name, age, address, birthday) values (seqAjaxUser.nextVal, '호호호', 20, '서울시 은평구', '1999-01');

commit;

select * from tblAjaxUser;