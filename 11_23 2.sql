create table e1
(사번 int, 이름 char(20), 직급 char(10))

create table total
(번호 int, 직급 char(10), 총인원 int)

insert total values (1,'사원', 0)
insert total values (2,'대리', 0)
insert total values (3,'과장', 0)
insert total values (4,'부장', 0)

-- 1. 
create proc proc0
as
select * 
from 제품
exec proc0

-- 2.
create proc proc1
@제품번호 int
as
select 제품명
from 제품
where 제품번호=@제품번호

exec proc1 1

drop proc proc2

create proc proc2
@제품번호 int, @인상가격 int output
as
select @인상가격=(가격*0.1)
from 제품
where 제품번호=@제품번호

declare @인상가격 int
exec proc2 1, @인상가격 output
select @인상가격

create proc proc3
@제품번호 int
as
declare @가격 int
select @가격=가격
from 제품
where 제품번호=@제품번호
return @가격

declare @가격 int
exec @가격 = proc3 1
select @가격

drop trigger inserttrg

create trigger inserttrg
on e1
after insert
as
begin
	update total 
		set 총인원 = 총인원 + 1
		where 직급=(select 직급 from inserted)
end

insert e1 values(1,'홍길동','과장')

select * from total
select * from e1