show user;
-- USER이(가) "SEMIORAUSER4"입니다.

SELECT * FROM tabs

SELECT * FROM TBL_MEMBER
SELECT * FROM TBL_LOGINHISTORY
SELECT * FROM TBL_PROD

select *
from ALL_TAB_COLUMNS
where TABLE_NAME = 'TBL_MEMBER' ;

select *
from ALL_TAB_COLUMNS
where TABLE_NAME = 'TBL_PROD' ;





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

