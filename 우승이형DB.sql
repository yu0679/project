--day
create table day(
  d_idx number,         --일련번호
  d_num number,         --일차
  t_idx number,         --테마일련번호
  acc_idx number,        --숙소일련번호
  mem_idx number,
  p_idx number,
  b_idx number,
  memo_idx number,
  memo_content varchar2(3000)
);

drop table day CASCADE CONSTRAINTs;
drop sequence seq_day_idx;
drop sequence seq_memo_idx;

create sequence seq_day_idx;
create sequence seq_memo_idx;
create table memo(
  memo_idx number,
  memo_content varchar2(3000),
  d_idx number,         --일련번호
  d_num number,         --일차
  b_idx number,
  mem_idx number
);

alter table day add constraint day_fk_acc_idx foreign key(acc_idx) references accommodation(acc_idx);
alter table day add constraint day_fk_t_idx foreign key(t_idx) references theme(t_idx);

alter table day add constraint day_fk_memo_idx foreign key(memo_idx) references memo(memo_idx);







--place
drop table place CASCADE CONSTRAINTS;
drop table seq_p_idx;

create table place(
    p_idx number,
    p_name varchar2(300),
    p_addr varchar2(300),
    p_lat varchar2(100),
    p_log varchar2(100),
    p_exp varchar2(2000),
    p_code varchar2(2000),
    d_idx number,
    d_num number,
    b_idx number,
    mem_idx NUMBER
);

alter table place add constraint place_pk_idx primary key (p_idx);
create sequence seq_p_idx;


alter table place add constraint place_fk_d_idx foreign key(d_idx) references day(d_idx);

--board
SELECT * FROM board
drop table board CASCADE CONSTRAINTS;
drop table seq_b_idx;
drop table seq_t_idx;
create table board(
      b_idx number,
      b_subject varchar2(500),
      b_ip varchar2(100),
      b_start date,
      b_end date,
      b_main_photo varchar2(200),
      b_content varchar2(3000),
      b_hit number,
      d_idx number,
      d_num number,
      t_idx number,
      t_name varchar2(300),
      p_idx number,
      memo_idx number,
      mem_idx number
);

alter table board add constraint b_pk_idx primary key (b_idx);

create sequence seq_b_idx;
create sequence seq_t_idx;



   insert into day(d_idx,d_num,b_idx)
    values(seq_day_idx.nextVal, 1,1)


      select *
        from member
        where mem_name = #{mem_name}
          and mem_phone = #{mem_phone}
          and mem_id = {admin123
          and MEM_DISTINGUISH='normal'