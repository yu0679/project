create table member(
    mem_idx number,
    mem_distinguish varchar2(30),        
    mem_photo varchar2(200),
    mem_id varchar2(200),
    mem_nickname varchar2(100),
    mem_pwd varchar2(200),
    mem_name varchar2(200),
    mem_zipcode number,
    mem_addr varchar2(300),
    mem_phone varchar2(100),
    mem_email varchar2(200),
    mem_regidate date,
    mem_partner varchar2(200),
    mem_point number
);


create table member(
    mem_idx number,
    mem_distinguish varchar2(30),
   mem_photo varchar2(200),
    mem_id varchar2(200),
    mem_nickname varchar2(100),
    mem_pwd varchar2(200),
    mem_name varchar2(200),
    mem_zipcode number,
    mem_addr varchar2(300),
    mem_phone varchar2(100),
    mem_email varchar2(200),
    mem_regidate date,
    mem_partner varchar2(200),
    mem_point number,
    mem_root varchar2(30),
    mem_code varchar2(30)
);

-- 23.09.07
create table member(
    mem_idx number,
    mem_distinguish varchar2(30),
   mem_photo varchar2(200),
    mem_id varchar2(200),
    mem_nickname varchar2(100),
    mem_pwd varchar2(200),
    mem_name varchar2(200),
    mem_zipcode number,
    mem_addr varchar2(300),
    mem_phone varchar2(100),
    mem_email varchar2(200),
    mem_regidate date,
    mem_partner varchar2(200),
    mem_point number,
    mem_root varchar2(30),
    mem_code varchar2(30)
);



alter table member add constraint mem_pk_idx primary key (mem_idx);
create sequence seq_mem_idx;


select * from MEMBER
--sample data
insert into member values( seq_member_mem_idx.nextVal,
                           '관리자',
                           'admin',
                           '관리자',
                           '1234',
                           '12345',
                           '서울시 관악구 시흥대로 552',
                           '192.168.0.23',
                           sysdate,
                           '관리자'
                         ) ;




create table board(
  b_idx number,
  b_subject varchar2(500),
  b_ip varchar2(100),
  b_start date,
  b_end date,
  b_main_photo varchar2(200),
  b_content blob,
  b_good number,
  b_hit number,
  day_idx number,
  mem_idx number
);

alter table board add constraint b_pk_idx primary key (b_idx);
create sequence seq_b_idx;
alter table board add constraint b_fk_idx foreign key(mem_idx) references member(mem_idx);





select * from place
WHERE  D_IDX = (select max(d_idx) from place)


create table good(
    good_idx number,
    mem_idx number,
    b_idx number
);

alter table good add constraint good_pk_idx primary key (good_idx);
create sequence seq_good_idx;
alter table good add constraint good_fk_mem_idx foreign key(mem_idx) references member(mem_idx);
alter table good add constraint good_fk_b_idx foreign key(b_idx) references board(b_idx);







create table reply(
    reply_idx number,
    reply_content blob,
    reply_date date,
    reply_regidate date,
    b_idx number,
    mem_idx number
);

alter table reply add constraint reply_pk_idx primary key (reply_idx);
create sequence seq_reply_idx;
alter table reply add constraint reply_fk_mem_idx foreign key(mem_idx) references member(mem_idx);
alter table reply add constraint reply_fk_b_idx foreign key(b_idx) references board(b_idx);








create table good_r(
    good_r_idx number,
    reply_idx number,
    mem_idx number
);

alter table good_r add constraint good_r_pk_idx primary key (good_r_idx);
create sequence seq_good_r_idx;
alter table good_r add constraint good_r_fk_mem_idx foreign key(mem_idx) references member(mem_idx);
alter table good_r add constraint good_r_fk_reply_idx foreign key(reply_idx) references reply(reply_idx);








create table accommodation(
    acc_idx number,
    acc_name varchar2(300),
    acc_location varchar2(500),
    acc_type varchar2(200),
    acc_grade varchar2(200),
    acc_count number,
    acc_person number,
    acc_service varchar2(2000),
    acc_cancle varchar2(2000),
    acc_contect varchar2(200),
    acc_photo varchar2(300),
    mem_idx number
);

alter table accommodation add constraint acc_pk_idx primary key (acc_idx);
create sequence seq_acc_idx;
alter table accommodation add constraint acc_fk_mem_idx foreign key(mem_idx) references member(mem_idx);





create table good_acc(
                       good_acc_idx number,
                       acc_idx number,
                       mem_idx number
);

alter table good_acc add constraint good_acc_pk_idx primary key (good_acc_idx);
create sequence seq_good_acc_idx;
alter table good_acc add constraint good_acc_fk_mem_idx foreign key(mem_idx) references member(mem_idx);
alter table good_acc add constraint good_acc_fk_acc_idx foreign key(acc_idx) references accommodation(acc_idx);





create table accommodation_list(
    acc_list_idx number,
    mem_idx number,
    acc_idx number
);


alter table accommodation_list add constraint acc_list_pk_idx primary key (acc_list_idx);
create sequence seq_acc_list_idx;
alter table accommodation_list add constraint acc_list_fk_mem_idx foreign key(mem_idx) references member(mem_idx);
alter table accommodation_list add constraint acc_list_fk_acc_idx foreign key(acc_idx) references accommodation(acc_idx);


create table place(
    p_idx number,
    p_name varchar2(300),
    p_addr varchar2(300),
    p_lat varchar2(100),
    p_log varchar2(100),
    p_exp varchar2(2000),
    d_idx number,
    d_num number,
    mem_idx NUMBER
);

SELECT * from MEMBER

drop table place CASCADE CONSTRAINT

alter table place add constraint place_pk_idx primary key (p_idx);
create sequence seq_p_idx;
alter table place add constraint place_fk_d_idx foreign key(d_idx) references day(d_idx);


SELECT * FROM PLACE




create table theme(
  t_idx number,
  t_name varchar2(200),
  mem_idx number
);

alter table theme add constraint theme_pk_idx primary key (t_idx);
create sequence seq_t_idx;



create table day(
  d_idx number,         --일련번호
  d_num number,         --일차
  t_idx number,         --테마일련번호
  acc_idx number        --숙소일련번호
);

insert into day(d_idx,d_num) VALUES(1,1)

drop table day CASCADE CONSTRAINT
SELECT * from day

select * from memo



drop table day CASCADE CONSTRAINT

alter table day add constraint day_pk_idx primary key (d_idx);
create sequence seq_day_idx;
-- alter table day add constraint day_fk_p_idx foreign key(p_idx) references place(p_idx);
alter table day add constraint day_fk_acc_idx foreign key(acc_idx) references accommodation(acc_idx);
alter table day add constraint day_fk_t_idx foreign key(t_idx) references theme(t_idx);

alter table day add constraint day_fk_memo_idx foreign key(memo_idx) references memo(memo_idx);


commit;



--1:1 문의하기 일련번호
DROP SEQUENCE SEQ_question_q_IDX

create SEQUENCE SEQ_question_q_IDX

--1:1 문의하기 테이블생성
drop table question
DROP TABLE question CASCADE CONSTRAINTS;
create table question
(
    q_idx           int,                 --일련번호
    q_subject       varchar2(500),       --제목
    q_content       clob,                --내용
    q_IP            varchar2(100),       --아이피
    q_regdate       date,                --작성일자
    q_readhit       int DEFAULT 0,       --조회수
    q_use           char(1) default 'y', --사용 유무
    mem_idx         int,                 --회원번호
    mem_name        varchar2(200),       --작성자명
    q_ref           int,                 --메인글번호
    q_step          int,                 --글순서
    q_depth         int                  --글깊이(0=주인   1=자식)
);
