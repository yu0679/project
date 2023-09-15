package com.example.project_sample.dao.visit;

import com.example.project_sample.vo.visitor.VisitorVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitCountDao {

 int insertVisitor(VisitorVo vo);


 int todayVisitorCount();


}
