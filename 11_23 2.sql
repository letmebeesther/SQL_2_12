create table e1
(��� int, �̸� char(20), ���� char(10))

create table total
(��ȣ int, ���� char(10), ���ο� int)

insert total values (1,'���', 0)
insert total values (2,'�븮', 0)
insert total values (3,'����', 0)
insert total values (4,'����', 0)

-- 1. 
create proc proc0
as
select * 
from ��ǰ
exec proc0

-- 2.
create proc proc1
@��ǰ��ȣ int
as
select ��ǰ��
from ��ǰ
where ��ǰ��ȣ=@��ǰ��ȣ

exec proc1 1

drop proc proc2

create proc proc2
@��ǰ��ȣ int, @�λ󰡰� int output
as
select @�λ󰡰�=(����*0.1)
from ��ǰ
where ��ǰ��ȣ=@��ǰ��ȣ

declare @�λ󰡰� int
exec proc2 1, @�λ󰡰� output
select @�λ󰡰�

create proc proc3
@��ǰ��ȣ int
as
declare @���� int
select @����=����
from ��ǰ
where ��ǰ��ȣ=@��ǰ��ȣ
return @����

declare @���� int
exec @���� = proc3 1
select @����

drop trigger inserttrg

create trigger inserttrg
on e1
after insert
as
begin
	update total 
		set ���ο� = ���ο� + 1
		where ����=(select ���� from inserted)
end

insert e1 values(1,'ȫ�浿','����')

select * from total
select * from e1