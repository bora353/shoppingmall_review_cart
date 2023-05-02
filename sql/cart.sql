--DROP SEQUENCE CART_SEQ;
--DROP TABLE CART;

CREATE TABLE CART 
(
  CART_IDX NUMBER NOT NULL 
, USER_IDX NUMBER 
, P_IDX NUMBER 
, QUANT NUMBER

, CONSTRAINT TABLE1_PK123 PRIMARY KEY 
  (
    CART_IDX 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TABLE1_PK123 ON CART (CART_IDX ASC) 
  )
  ENABLE 
);



CREATE SEQUENCE CART_SEQ;

INSERT INTO CART
VALUES (CART_SEQ.NEXTVAL, 1, 1, 1);

INSERT INTO CART
VALUES (CART_SEQ.NEXTVAL, 1, 2, 1);

INSERT INTO CART
VALUES (CART_SEQ.NEXTVAL, 1, 3, 1);

commit;

select * from cart;

-- 장바구니 보기(join)
select * 
from cart c inner join product_setting p
on c.p_idx = p.p_idx
where c.user_idx = 1 and c.p_idx = 1;






