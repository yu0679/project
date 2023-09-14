package com.example.project_sample.dao.board;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface BoardDao {



    int Main_insert();

    int recentData();

    int Board_update(Map map);


}
