package com.example.project_sample.dao.cs;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.project_sample.vo.cs.CsCategoryVo;


//고객센터 자주묻는질문 list용
@Mapper
public interface CsDao {


    
    public List<CsCategoryVo> selectList();
    public CsCategoryVo selectOne(String category_num);

}


