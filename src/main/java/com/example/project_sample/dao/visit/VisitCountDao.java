package com.example.project_sample.dao.visit;

public interface VisitCountDao {

    int setTotalCount(); //총 방문자수 증가

    int getTotalCount();

    int getTodayCount();



}
