-- ��ٱ��� ���̺� ���ڵ尡 ���Եɶ����� �ѱݾ��� ��µǴ� Ʈ���Ÿ� �����ϼ���.
-- ����, ��ٱ��� ���̺� ���ڵ带 �����ϰ� Ʈ���� �������� ĸó�ؼ� �����ϼ���.

create table ��ٱ���
(��ȣ int identity, ��ǰ char(20), ���� int)

select * from ��ٱ���
drop trigger ��ǰ����
drop table ��ٱ���

create trigger ��ǰ����
on ��ٱ���
after insert
as
begin
select sum(����) from ��ٱ���
end

insert ��ٱ��� values ('��',20000)
insert ��ٱ��� values ('����',3000)

