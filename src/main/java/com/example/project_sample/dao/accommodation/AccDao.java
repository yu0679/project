package com.example.project_sample.dao.accommodation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.accommodation.AccVo;



@Mapper
public interface AccDao {

    int insert(AccVo vo);

    int selectMaxIdx();

    AccVo selectIdxOne(String acc_location, String acc_name);

    List<AccVo> selectList(int mem_idx);

    AccVo selectOne(int acc_idx);

    int delete(int acc_idx);

    List<AccVo> selectBookAccOne(Map map);



}
