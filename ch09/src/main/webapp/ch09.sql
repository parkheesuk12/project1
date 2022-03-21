drop table member1;
create table member1 (
	id varchar2(12) primary key,
	password varchar2(12) not null,
	name varchar2(12) not null,
	reg_date date not null
);
select * from member1;