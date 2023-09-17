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


--기본키
alter table question
  add CONSTRAINT pk_question_q_idx PRIMARY key(q_idx);

--외래키
alter table question
  add CONSTRAINT fk_question_mem_idx FOREIGN key(mem_idx)
                references member(mem_idx);

select * from member

--sample data
--새글쓰기
insert into question VALUES(
                    seq_question_q_idx.nextVal,
                    '내가 1등이다내가 1등이다내가 1등이다내가 1등이다내가 1등이다',
                    '이번에도 1등이네',
                    '핑핑이',
                    '192.168.0.23',
                    sysdate,
                    0,
                    'y',
                    1,
                    '고성민',
                    SEQ_question_q_IDX.CURRVAL,
                    0,
                    0
);
--답변쓰기
insert into question VALUES(
                    seq_question_q_idx.nextVal,
                    'ㅋㅋ',
                    '답변',
                    '',
                    '192.168.0.23',
                    sysdate,
                    0,
                    'y',
                    1,
                    '고성민',
                    1,
                    1,
                    1
);
insert into question VALUES(
                    seq_question_q_idx.nextVal,
                    'ㅎㅎ',
                    '안녕하세요',
                    '',
                    '192.168.0.23',
                    sysdate,
                    0,
                    'y',
                    1,
                    '고성민',
                    1,
                    2,
                    2
);

create sequence seq_acc_photo_idx;
  

TRUNCATE TABLE question 
select * from question

insert into question VALUES(
                    seq_question_q_idx.nextVal,
                    #{q_subject},
                    #{q_content},
                    #{q_q_filename},
                    #{q_ip},
                    #{q_ip},
                    sysdate,
                    0,
                    'y',
                    #{mem_idx},
                    #{mem_name},
                    seq_question_q_idx.currVal,
                    0,
                    0
);

--조회
select * from question where  q_ref=1
order by q_ref desc,q_step asc


 select * from accommodation   where mem_idx=21