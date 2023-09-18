package com.example.project_sample.dao.visit;

import com.example.project_sample.vo.visitor.VisitorVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitCountDao {

 int insertVisitor(VisitorVo vo);

// 하루동안 방문자수
 int todayVisitorCount();
// 한달동안 방문자수
int monthlyVisitorCount();
// 연간 방문자수
int yearlyVisitorCount();

int getSun();

 int getMon();

 int getTue();

 int getWed();

 int getThu();

 int getFri();

 int getSat();
}
