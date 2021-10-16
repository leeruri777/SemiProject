show user;
-- USER이(가) "SEMIORAUSER4"입니다.
SELECT * FROM tabs;



SELECT * FROM TBL_MEMBER
SELECT * FROM TBL_LOGINHISTORY
SELECT * FROM TBL_PROD
SELECT * FROM TBL_STOCK


select *
from ALL_TAB_COLUMNS
where TABLE_NAME = 'TBL_MEMBER' ;

select *
from ALL_TAB_COLUMNS
where TABLE_NAME = 'TBL_PROD_INFO' ;


SELECT * FROM TBL_BASKET

/*

create table TBL_BASKET
(BASKET_NO      number         not null      -- 시퀀스로 입력받음. 기본키
,FK_USER_ID     varchar2(40)   not null       -- 아이디 (foreign key) -- 회원 아이디도 TBL_MEMBER 에서 포린키로 받아와야 할것같다
,FK_PROD_CODE   varchar2(100)  not null      -- 상품코드(foreign key) -- TBL_PROD(상품)에서 기본키인 PROD_CODE 를 받아와야 하나?
,GOODS_QY	    number                       -- 주문량
,constraint PK_TBL_BASKET primary key(BASKET_NO)
,constraint FK_TBL_BASKET foreign key(FK_USER_ID) references TBL_MEMBER(USERID) on delete cascade 
,constraint FK_TBL_BASKET foreign key(FK_PROD_CODE) references  TBL_PROD(PROD_CODE) on delete cascade 
);


create sequence BASKET_NO
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
*/





create table ORDER_SETLE
(ORDER_NO		VARCHAR2(8)      not null         -- 시퀀스로 입력받음. 기본키
,FK_USER_ID 	VARCHAR2(40)     not null         -- 아이디 (foreign key) -- TBL_MEMBER
,USER_NAME		VARCHAR2(30)     not null         -- 회원명
,FK_PROD_CODE	VARCHAR2(20)     not null         -- 상품코드(foreign key) -- TBL_PROD(상품)
,PROD_NAME		VARCHAR2(3000)                    -- 상품명
,PROD_PRICE		NUMBER  (22)                      -- 상품가격
,GOODS_QY		NUMBER                            -- 주문량
,DSCNT_AMOUNT	NUMBER                            -- 할인금액
,TOT_AMOUNT		NUMBER                            -- 총 결제 금액  
,ORDER_DT		date default     sysdate          -- 주문날짜
,USER_REQ		VARCHAR2(4000)                    -- 배송 메세지
,PAYMENT_TYPE	VARCHAR2(200)                     -- 결제방식
,constraint PK_ORDER_SETLE primary key(ORDER_NO)
,constraint FK_ORDER_SETLE_FK_USER_ID foreign key(FK_USER_ID) references TBL_MEMBER(USERID) on delete cascade 
,constraint FK_ORDER_SETLE_FK_PROD_CODE foreign key(FK_PROD_CODE) references  TBL_PROD(PROD_CODE) on delete cascade 
);
-- Table ORDER_SETLE이(가) 생성되었습니다.

create sequence ORDER_NO
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence ORDER_NO이(가) 생성되었습니다.





--OrderSetleVO.java
SELECT * FROM ORDER_SETLE;



/*
 insert into ORDER_SETLE(ORDER_NO, ,FK_USER_ID , USER_NAME
                       , FK_PROD_CODE, PROD_NAME, PROD_PRICE 
                       , GOODS_QY, DSCNT_AMOUNT , TOT_AMOUNT
                       , ORDER_DT, USER_REQ, PAYMENT_TYPE)
 values( sysdate, '허니버터칩', 30);
 
 */


