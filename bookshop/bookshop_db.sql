use bookshop;

-- 회원(member) 테이블 생성
create table member(id varchar(20) primary key, 
pw varchar(300) not null, 
name varchar(100) not null,
age int, 
gender varchar(10), 
tel varchar(100), 
email varchar(200), 
addr1 varchar(200), 
addr2 varchar(200), 
postcode varchar(20),  
resdate datetime default current_timestamp,
rcnt int default 0,
point int default 1000);

/** 회원 테이블 전체 조회
limit #{startRowNumber}, #{contentNumberPerPage}: 백엔드에서 페이징 처리할때 사용. 프론트단에서 페이징 할 경우 필요없음
select * from member order by rcnt desc limit #{startRowNumber}, #{contentNumberPerPage}
*/

/** 회원id로 회원정보 조회
select * from member where id=#{id};
*/

/** 전체 회원 수
select count(*) from member
*/

/** 회원 가입
insert into member values(id=#{id}, pw=#{pw}, name=#{name}, age=#{age}, gender=#{gender}, tel=#{tel},
email=#{email}, addr1=#{addr1}, addr2=#{addr2}, postcode=#{postcode}, default, default, default)
*/

/** 포인트 추가
update member set point=point+#{point} where id=#{id}
*/ 

/** 회원 수정
update member set pw=#{pw}, name=#{name}, age=#{age}, gender=#{gender}, tel=#{tel}, email=#{email},
addr1=#{addr1}, addr2=#{addr2}, postcode=#{postcode} where id=#{id}
*/

/** 회원 탈퇴
delete from member where id=#{id}
*/
--------------------------------------------------------------------------------------------------------------------


-- 공지사항(notice) 테이블 생성
create table notice(nno int auto_increment primary key,
title varchar(200),
content varchar(2000),
author varchar(20) default 'admin',
filename varchar(300),
visited int default 0,
resdate datetime default current_timestamp);

/** 공지사항 전체 조회
select * from notice order by resdate desc limit #{startRowNumber}, #{contentNumberPerPage};
*/

/** 공지사항 상세보기
select * from notice where nno=#{nno}
*/

/** 공지사항 전체 게시물 수
select count(*) from notice
*/

/** 공지사항 등록
insert into notice(title, content, file) values (#{title}, #{content}, #{file})
*/

/** 공지사항 수정
update notice set title=#{title}, content=#{content}, filename=#{filename} where bno=#{bno}
*/

/** 공지사항 조회수 증가
update notice set visited=visited+1 where nno=#{nno}
*/

/** 공지사항 삭제
delete from notice where nno=#{nno}
*/


--------------------------------------------------------------------------------------------------------------------


-- 문의게시판(qna) 테이블 생성
create table qna(qno int auto_increment primary key,
lev int,
parno int default 0,
title varchar(200),
content varchar(2000),
img varchar(300),
member_id varchar(20),
visited int default 0,
resdate datetime default current_timestamp,
foreign key(member_id) references member(id));

/** 문의게시판 목록
select * from qna order by resdate desc limit #{startRowNumber}, #{contentNumberPerPage};
*/

/** 문의게시판 상세보기
select * from qna where qno=#{qno}
*/

/** 문의게시판 전체 게시글 수
select count(*) from qna
*/

/** 질문 등록
insert into qna values(default, lev=#{lev}, default, title=#{title}, content=#{content}, img=#{img},
member_id=#{member_id}, default, default)
*/

/** 질문 parno 업데이트
update qna set parno=qno where qno=#{qno}
*/

/** 답변 등록
insert into qna values(default, lev=#{lev}, parno=#{parno}, title=#{title}, content=#{content}, photo=#{photo},
member_id=#{member_id}, default, default)
*/

/** 질문 및 답변 수정
update qna set title=#{title}, content=#{content}, img=#{img} where qno=#{qno}
*/

/** 문의게시판 조회수 증가
update qna set visited=visited+1 where qno=#{qno}
*/

/** 질문 삭제
delete from qna where parno=#{parno}
*/

/** 답변 삭제
delete from qna where qno=#{qno}
*/


--------------------------------------------------------------------------------------------------------------------


-- 상품(product) 테이블 생성
create table product(pid varchar(30) primary key,
category1 varchar(30) not null,
category2 varchar(30) not null,
pname varchar(100) not null,
subtitle varchar(1000),
price int,
author varchar(30),
content varchar(3000),
company varchar(30),
stock int default 0,
img1 varchar(300), 
img2 varchar(300),
img3 varchar(300),
img4 varchar(300),
pstar float default 0,
rcnt int default 0);

-- 각 카테고리 조합에 대한 시퀀스 관리
create table category_seq(category1 varchar(30) not null,
category2 varchar(30) not null,
seq int not null,
primary key (category1, category2));

-- 해당 카테고리 조합에 맞는 시퀀스를 증가시키는 트리거
DELIMITER $$
CREATE TRIGGER tg_product_insert
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
  DECLARE seq_no INT;

  -- 해당 카테고리 조합의 시퀀스를 조회
  SELECT seq INTO seq_no FROM category_seq 
  WHERE category1 = NEW.category1 AND category2 = NEW.category2
  FOR UPDATE;

  -- 시퀀스가 존재하지 않으면 초기화
  IF seq_no IS NULL THEN
    INSERT INTO category_seq (category1, category2, seq) 
    VALUES (NEW.category1, NEW.category2, 1);
    SET seq_no = 1;
  ELSE
    -- 시퀀스 증가
    UPDATE category_seq 
    SET seq = seq + 1 
    WHERE category1 = NEW.category1 AND category2 = NEW.category2;
    SET seq_no = seq_no + 1;
  END IF;

  -- 고유 ID 생성
  SET NEW.pid = CONCAT(SUBSTRING(NEW.category1, 1, 1), 
                       SUBSTRING(NEW.category2, 1, 2), 
                       LPAD(seq_no, 5, '0'));
END$$
DELIMITER ;

insert into product(category1, category2, pname) values('culture','novel','inbeom');
insert into product(category1, category2, pname) values('culture','essay','inbedm');
insert into product(category1, category2, pname) values('culture','essay','inbeom');
insert into product(pid, category1, category2, pname) values('b','a', 'b', 'c');
select * from product;

/** 상품 전체 목록
select * from product order by category desc, pno desc limit #{startRowNumber}, #{contentNumberPerPage}
*/

/** 대 카테고리별 상품 목록
select * from product where pcategory1=#{pcategory1} order by pno desc limit #{startRowNumber}, #{contentNumberPerPage}
*/

/** 소 카테고리별 상품 목록
select * from product where pcategory2=#{pcategory2} order by pno desc limit #{startRowNumber}, #{contentNumberPerPage}
*/

/** 총 상품 수
select count(*) from product
*/

/** 대 카테고리별 상품 수
select count(*) from product where pcategory1=#{pcategory1}
*/

/** 소 카테고리별 상품 수
select count(*) from product where pcategory2=#{pcategory2}
*/

/** 상품 상세 보기
select * from product where pno=#{pno}
*/

/** 상품 등록
insert into product values (#{pid}, #{pcategory1}, #{pcategory2}, #{pname}, #{subtitle}, #{pprice},
#{author}, #{pcontent}, #{pcompany}, #{pstock}, #{img1}, #{img2}, #{img3}, #{img4}, #{star})
*/

/** 상품 변경
update product set pid=#{pid}, pcategory1=#{pcategory1}, pcategory2=#{pcategory2}, pname=#{pname}, 
subtitle=#{subtitle}, pprice=#{pprice}, author=#{author}, pcompany=#{pcompany}, pstock=#{pstock},
img1=#{img1}, img2=#{img2}, img3=#{img3}, img4=#{img4} where pno=#{pno}
*/

/** 상품 삭제
delete from product where pid=#{pid}
*/


--------------------------------------------------------------------------------------------------------------------


-- 타인의 책상(review) 테이블 생성
create table review(rno int auto_increment primary key,
product_id varchar(30),
member_id varchar(20),
content varchar(2000),
img varchar(300),
resdate datetime default current_timestamp,
rstar float,
foreign key(product_id) references product(pid),
foreign key(member_id) references member(id));

/** 타인의 책상 전체 목록
select * from review order by resdate desc limit #{startRowNumber}, #{contentNumberPerPage}
*/

/** 도서 별 리뷰 목록
select * from review where product_id=#{product_id} order by resdate desc 
limit #{startRowNumber}, #{contentNumberPerPage}
*/

/** 총 리뷰 개수
select count(*) from review
*/

/** 상품 별 별점 평균
select ROUND(AVG(rstar),1) as avgstar from review where product_id=#{product_id} group by product_id;
*/

/** 도서 별 총 리뷰 개수
select count(*) from review where product_id=#{product_id}
*/

/** 리뷰 상세보기
select * from review where rno=#{rno}
*/

/** 리뷰 등록
insert into review values(default, product_id=#{product_id}, member_id=#{member_id}, content=#{content},
img=#{img}, default, rstar=#{rstar}
*/

/** 리뷰 수정
update review set product_id=#{product_id}, member_id=#{member_id}, rcontent=#{rcontent},
roriginfilename=#{roriginfilename}, rrenamedfilename=#{rrenamedfilename}, star=#{star} where rno=#{rno}
*/

/** 리뷰 삭제
delete from review where rno=#{rno}
*/


--------------------------------------------------------------------------------------------------------------------


-- 창고(inventory) 테이블 생성
create table inventory(ino int auto_increment primary key,
product_id varchar(30),
orderno int,
member_id varchar(20),
amount int,
status varchar(200),
pdate datetime default current_timestamp,
iprice int,
oprice int,
foreign key(product_id) references product(pid),
foreign key(member_id) references member(id));

/** 창고 테이블 전체 조회

*/

/** 입고 테이블 

*/

/** 출고 

*/

/** 반품

*/





--------------------------------------------------------------------------------------------------------------------


-- 주문(buy) 테이블 생성
create table buy(orderno int auto_increment primary key,
member_id varchar(20),
paymethod varchar(20),
paynum varchar(30),
tel varchar(100),
res_require varchar(1000),
totalprice int,
orderdate datetime default current_timestamp,
foreign key(member_id) references member(id));

/** 주문 테이블 목록

*/

/** 주문

*/

/** 반품

*/

/** 

*/


--------------------------------------------------------------------------------------------------------------------


-- 배송지(delivery) 테이블 생성
create table delivery(orderno int,
res_name varchar(100),
addr1 varchar(200),
addr2 varchar(200),
postcode varchar(20),
memo varchar(1000),
status varchar(1000),
foreign key(orderno) references buy(orderno));

/** 배송 테이블 목록
select * from delivery order by orderno desc limit #{startRowNumber}, #{contentNumberPerPage}
*/

/** 

*/


--------------------------------------------------------------------------------------------------------------------


-- 장바구니(cart) 테이블 생성
create table cart(cno int auto_increment primary key,
product_id varchar(30),
member_id varchar(20),
pname varchar(100),
amount int,
price int,
cartdate datetime default current_timestamp,
foreign key(product_id) references product(pid),
foreign key(member_id) references member(id));

/** 회원별 장바구니 목록
select * from cart where member_id=#{member_id} order by cartdate desc
*/

/** 장바구니 물품 등록
insert into cart values(product_id=#{product_id}, member_id=#{member_id}, pname=#{pname},
amount=#{amount}, price=#{price}, default)
*/

/** 장바구니 물품 수량 증가
update cart set amount=#{amount} where cno=#{cno}
*/

/** 장바구니 물품 삭제
delete from cart where cno=#{cno}
*/













