show user;
-- USER이(가) "SEMIORAUSER4"입니다.

select *
from ORDER_SETLE;

select *
from tabs;

select *
from ORDER_SETLE
where fk_user_id  = 'quant54';

select *
from tbl_member
where userid  = 'quant54';

update ORDER_SETLE set status = 'beingdelivered'
where fk_user_id = 'quant54'

commit;



select * 

from ALL_TAB_COLUMNS

where TABLE_NAME = 'ORDER_SETLE' ;