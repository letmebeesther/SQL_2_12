-- 장바구니 테이블에 레코드가 삽입될때마다 총금액이 출력되는 트리거를 생성하세요.
-- 또한, 장바구니 테이블에 레코드를 삽입하고 트리거 실행결과를 캡처해서 제출하세요.

create table 장바구니
(번호 int identity, 상품 char(20), 가격 int)

select * from 장바구니
drop trigger 상품구입
drop table 장바구니

create trigger 상품구입
on 장바구니
after insert
as
begin
select sum(가격) from 장바구니
end

insert 장바구니 values ('쌀',20000)
insert 장바구니 values ('맥주',3000)

