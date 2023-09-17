/*

--일련번호
create sequence  seq_photo_p_idx 

--테이블
create table photo
(
   p_idx	  int,						--포토일련번호
   p_subject  varchar2(200)  not null,	--제목
   p_content  varchar2(2000) not null,	--내용
   p_filename varchar2(200)  not null,	--사진화일이름
   p_ip		  varchar2(100)  not null,	--아이피
   p_regdate    date,					--등록일자
   p_modifydate date,					--마지막수정한 일자
   mem_idx      int						--사진의 주인
)

--jdbc insert문장

insert into photo values(seq_photo_p_idx.nextVal,?,?,?,?,sysdate,sysdate,?)


--기본키
alter table photo
  add constraint  pk_photo_p_idx primary key(p_idx) ;

--참조키
alter table photo
  add constraint  fk_photo_mem_idx  foreign key(mem_idx)
                                    references member(mem_idx)
                                    
                                    -- on delete cascade
                                    
                                    




*/