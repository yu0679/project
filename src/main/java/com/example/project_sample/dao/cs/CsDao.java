package com.example.project_sample.dao.cs;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.project_sample.vo.cs.CsCategoryVo;
@Mapper
public interface CsDao {


    
    public List<CsCategoryVo> selectList();


    public CsCategoryVo selectOne(String category_num);

}


