package com.example.project_sample.vo.cs;

import lombok.Getter;
import lombok.Setter;

//마이바티스가 DB에서 같은 이름을 
//가져오기때문에 칼럼명과 정확히 일치해야함
@Getter
@Setter
public class QuestionVo {

int     no;
int     comment_count;
int     q_idx;                    
String  q_subject;            
String  q_filename;            
String  q_content;                   
String  q_ip;           
String  q_regdate;                 
int     q_readhit;     
String  q_use; 
int     mem_idx;            
String  mem_name;      
int     q_ref;            
int     q_step;            
int     q_depth;
}
