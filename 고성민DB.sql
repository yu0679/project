CREATE TABLE MEMBER(
  MEM_IDX NUMBER,
  MEM_DISTINGUISH VARCHAR2(30),
  MEM_PHOTO VARCHAR2(200),
  MEM_ID VARCHAR2(200),
  MEM_NICKNAME VARCHAR2(100),
  MEM_PWD VARCHAR2(200),
  MEM_NAME VARCHAR2(200),
  MEM_ZIPCODE NUMBER,
  MEM_ADDR VARCHAR2(300),
  MEM_PHONE VARCHAR2(100),
  MEM_EMAIL VARCHAR2(200),
  MEM_REGIDATE DATE,
  MEM_PARTNER VARCHAR2(200),
  MEM_POINT NUMBER,
  MEM_ROOT VARCHAR2(30),
  MEM_CODE VARCHAR2(30),
  MEM_STATE VARCHAR2(20), --승인된 ceo는 'Y', 승인 대기중은 'checking',
  MEM_WITHDRAWALDATE DATE
);

ALTER TABLE MEMBER ADD CONSTRAINT MEM_PK_IDX PRIMARY KEY (MEM_IDX);

CREATE SEQUENCE SEQ_MEM_IDX;

--고객센터 카테고리 테이블
CREATE TABLE CATEGORYTB (
  CATEGORY_IDX INT PRIMARY KEY,
  CATEGORY_NUM VARCHAR2(100) UNIQUE,
  CATEGORY_NAME VARCHAR2(200)
) INSERT INTO CATEGORYTB VALUES(
  1,
  'c001',
  '계정/로그인/가입/탈퇴'
);

INSERT INTO CATEGORYTB VALUES(
  2,
  'c002',
  '내피드/설정'
);

INSERT INTO CATEGORYTB VALUES(
  3,
  'c003',
  '기타'
);

--

--1:1 문의하기 일련번호
DROP SEQUENCE SEQ_QUESTION_Q_IDX
CREATE SEQUENCE SEQ_QUESTION_Q_IDX
--1:1 문의하기 테이블생성
DROP TABLE QUESTION
DROP TABLE QUESTION CASCADE CONSTRAINTS;

CREATE TABLE question (
  Q_IDX INT, --일련번호
  Q_SUBJECT VARCHAR2(500), --제목
  Q_CONTENT CLOB, --내용
  Q_FILENAME VARCHAR2(200), --사진화일이름
  Q_IP VARCHAR2(100), --아이피
  Q_REGDATE DATE, --작성일자
  Q_READHIT INT DEFAULT 0, --조회수
  Q_USE CHAR(1) DEFAULT 'y', --사용 유무
  MEM_IDX INT, --회원번호
  MEM_NAME VARCHAR2(200), --작성자명
  Q_REF INT, --메인글번호
  Q_STEP INT, --글순서
  Q_DEPTH INT --글깊이(0=주인   1=자식)
);
--기본키
alter table QUESTION
  add CONSTRAINT pk_QUESTION_q_idx PRIMARY key(q_idx);

--외래키
alter table QUESTION
  add CONSTRAINT fk_QUESTION_mem_idx FOREIGN key(mem_idx)
                                  references member(mem_idx);

select * from QUESTION 


--1:1 문의 답변 시퀀스
CREATE SEQUENCE SEQ_COMMENT_TB_COMMENT_IDX
DROP SEQUENCE ROLE
--1:1 문의 답변테이블
DROP TABLE COMMENT_TB CASCADE CONSTRAINTS;

DROP TABLE MEM_ROLE CASCADE CONSTRAINTS;

CREATE TABLE COMMENT_TB (
  COMMENT_IDX INT, --댓글번호
  COMMENT_CONTENT VARCHAR2(2000), --댓글내용
  COMMENT_IP VARCHAR2(200), --아이피
  COMMENT_REGDATE DATE, --작성일자
  Q_IDX INT, --게시글번호
  MEM_IDX INT, --회원번호
  MEM_ID VARCHAR2(100), --회원아이디
  MEM_NAME VARCHAR2(200) --회원명
);

--기본키
ALTER TABLE COMMENT_TB ADD CONSTRAINT PK_COMMENT_TB_COMMENT_IDX PRIMARY KEY(COMMENT_IDX);

--외래키(참조값)
ALTER TABLE COMMENT_TB ADD CONSTRAINT FK_COMMENT_TB_Q_IDX FOREIGN KEY(Q_IDX) REFERENCES QUESTION(Q_IDX);

--on delete cascade  :부모글삭제시 자식들모두 삭제

ALTER TABLE COMMENT_TB ADD CONSTRAINT FK_COMMENT_TB_MEM_IDX FOREIGN KEY(MEM_IDX) REFERENCES MEMBER(MEM_IDX);




--드로잉썸 접속수
CREATE TABLE VISITOR(
  VISIT_IDX NUMBER,
  VISIT_IP VARCHAR2(100),
  VISIT_TIME DATE
);CREATE TABLE CATEGORYTB
(
    CATEGORY_IDX INT PRIMARY KEY,
    CATEGORY_NUM VARCHAR2(100) UNIQUE,
    CATEGORY_NAME VARCHAR2(200)
)


insert into CATEGORYTB VALUES(
                    1,
                    'c001',
                    '계정/로그인/가입/탈퇴'
);
insert into CATEGORYTB VALUES(
                    2,
                    'c002',
                    '내피드/설정'
);
insert into CATEGORYTB VALUES(
                    3,
                    'c003',
                    '기타'
);
SELECT * FROM CATEGORYTB




--시퀀스
create sequence seq_comment_tb_comment_idx
DROP SEQUENCE ROLE

--테이블

DROP TABLE comment_tb CASCADE CONSTRAINTS;
DROP TABLE MEM_ROLE CASCADE CONSTRAINTS;

--답변 테이블
create table comment_tb
(
   comment_idx int ,                --댓글번호
   comment_content varchar2(2000),  --댓글내용
   comment_ip  varchar2(200),       --아이피  
   comment_regdate date,            --작성일자  
   q_idx       int,                 --게시글번호
   mem_idx     int,                 --회원번호
   mem_id      varchar2(100),       --회원아이디   
   mem_name    varchar2(200)        --회원명 
);


--1:1 문의하기 일련번호
DROP SEQUENCE SEQ_question_q_IDX

create SEQUENCE SEQ_question_q_IDX

--1:1 문의하기 테이블생성
drop table question
DROP TABLE question CASCADE CONSTRAINTS;

create table question
(
    q_idx           int,                     --일련번호
    q_subject       varchar2(500),           --제목
    q_content       clob,                    --내용
    q_filename      varchar2(200),           --사진화일이름
    q_IP            varchar2(100),           --아이피
    q_regdate       date,                    --작성일자
    q_readhit       int DEFAULT 0,           --조회수
    q_use           char(1) default 'y',     --사용 유무
    mem_idx         int,                     --회원번호
    mem_name        varchar2(200),           --작성자명
    q_ref           int,                     --메인글번호
    q_step          int,                     --글순서
    q_depth         int                      --글깊이(0=주인   1=자식)
    
);

--드로잉썸 접속수
create table visitor(
                        visit_idx number,
                        visit_ip varchar2(100),
                        visit_time date
);
