package com.example.project_sample.vo.cs;


import lombok.Getter;
import lombok.Setter;

//마이바티스가 DB에서 같은 이름을 
//가져오기때문에 칼럼명과 정확히 일치해야함
@Getter
@Setter
public class CsCategoryVo {
	
	int category_idx;
	String category_num;
	String category_name;
	
	
	
	
	
}
