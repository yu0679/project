CREATE TABLE CATEGORYTB
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
