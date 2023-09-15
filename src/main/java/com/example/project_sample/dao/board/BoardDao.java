package com.example.project_sample.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.board.BoardVo;


@Mapper
public interface BoardDao {



    int Main_insert(BoardVo bVo);

    int recentb_idx(int b_idx);

    int selectAllCount();


    // int Board_update(Map map);

    // List<BoardVo> all_data(int b_idx);

    // int recent_main_Data();


    // int recentData(int b_idx);


 

}
