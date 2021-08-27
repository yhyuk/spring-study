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

-- DML
-- 업무에 필요한 SQL를 작성
-- 1. 유저 목록 보기
select * from tblAjaxUser order by name asc;

-- 2. 유저 등록하기
insert into tblAjaxUser (seq, name, age, address, birthday) values (seqAjaxUser.nextVal, '호호호', 20, '서울시 은평구', '1999-01');

-- 3. 특정 유저 가져오기
select * from tblAjaxUser where seq = 1;

-- 4. 유저 수정하기
update tblAjaxUser set name = '', age = 0, address = '', birthday = '' where seq = 1;

-- 5. 유저 삭제하기
delete from tblAjaxUser where seq = 1;

-- 6. 유저 검색하기(주소)
select * from tblAjaxUser where address like '%검색어%';
