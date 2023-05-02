--drop table review;
--drop SEQUENCE REVIEW_SEQ;

-- REVIEW TABLE 생성
CREATE TABLE REVIEW 
(
  REVIEW_IDX NUMBER NOT NULL 
, USER_IDX NUMBER 
, P_IDX NUMBER 
, SUBJECT VARCHAR2(50 BYTE) 
, WRITER VARCHAR2(50 BYTE) 
, CONTENT VARCHAR2(500 BYTE) 
, FILE_NAME VARCHAR2(200 BYTE) DEFAULT 'noimg.png'
, ORI_NAME VARCHAR2(200 BYTE) DEFAULT 'noimg.png'
, PWD VARCHAR2(50 BYTE) 
, WRITE_DATE DATE DEFAULT SYSDATE 
, HIT NUMBER DEFAULT 0
, STAR NUMBER DEFAULT 0
, GOOD NUMBER DEFAULT 0
, BAD NUMBER DEFAULT 0
, CONSTRAINT REVIEW_PK PRIMARY KEY 
  (
    REVIEW_IDX 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX REVIEW_PK ON REVIEW (REVIEW_IDX ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

-- 시퀀스
CREATE SEQUENCE REVIEW_SEQ;


--FK 2개 설정
--ALTER TABLE [FK를 생성시킬 테이블명]
--ADD CONSTRAINT [FK명] foreign KEY(FK가 될 컬럼명) references [PK가 위치하는 테이블] ([PK컬럼명]);
--ALTER TABLE REVIEW
--ADD CONSTRAINT FK_USER_NO FOREIGN KEY(USER_NO) REFERENCES Member.User (USER_ID);
--ALTER TABLE REVIEW
--ADD CONSTRAINT FK_P_IDX FOREIGN KEY(P_IDX) REFERENCES SET_PRODUCT (P_IDX);

-- cascade도 고민해보기!!


-- INSERT 6개

INSERT INTO REVIEW
VALUES (REVIEW_SEQ.NEXTVAL,0,0, '깨끗한 물', '작성자1', 
'원래 다른 물을 마셨는데<br>
가격대가 나가서 다른 제품으로 바꿨어요^^<br>
아주만족합니다~ 추천!',
'chi.jpg', 'chi.jpg', '1234', SYSDATE-5, 0, 5, 3, 1);

INSERT INTO REVIEW
VALUES (REVIEW_SEQ.NEXTVAL,0,0, '귀여워요~~', '작성자2', 
'배송이 바로 다음날 왔어요<br>
하나 더 살까 고민중이에요~
추천합니다!',
'sanchou.jpeg', 'sanchou.jpeg', '1234', SYSDATE-3, 0, 3, 0, 1);

INSERT INTO REVIEW
VALUES (REVIEW_SEQ.NEXTVAL,0,0, '기분 좋아지는 상품', '작성자3', 
'엄청 저렴하게 잘 샀어요<br>
친구들에게도 선물하려구요~<br>
짱짱!',
'chi.jpg', 'chi.jpg', '1234', SYSDATE-1, 0, 1, 5, 0);

INSERT INTO REVIEW
VALUES (REVIEW_SEQ.NEXTVAL,0,0, '최고에요!!!', '작성자4', 
'배송이 바로 다음날 왔어요<br>
하나 더 살까 고민중이에요~
추천합니다!',
'dog.jpeg', 'dog.jpeg', '1234', SYSDATE-4, 0, 5, 3, 1);

INSERT INTO REVIEW
VALUES (REVIEW_SEQ.NEXTVAL,0,0, '깨끗한 물', '작성자5', 
'원래 다른 물을 마셨는데<br>
가격대가 나가서 다른 제품으로 바꿨어요^^<br>
아주만족합니다~ 추천!',
'sanchou.jpeg', 'sanchou.jpeg', '1234', SYSDATE-5, 0, 3, 0, 1);

INSERT INTO REVIEW
VALUES (REVIEW_SEQ.NEXTVAL,0,0, '귀여워요~~', '작성자6', 
'엄청 저렴하게 잘 샀어요<br>
친구들에게도 선물하려구요~<br>
짱짱!',
'dog.jpeg', 'dog.jpeg', '1234', SYSDATE, 0, 1, 5, 0);



COMMIT;

SELECT * FROM REVIEW ORDER BY REVIEW_IDX;
