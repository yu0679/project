package com.example.project_sample.dao.accommodation;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.accommodation.AccVo;

@Mapper
public interface AccDao {

    int insert(AccVo vo);

    int selectMaxIdx();

    AccVo selectIdxOne(String acc_location, String acc_name);

}
