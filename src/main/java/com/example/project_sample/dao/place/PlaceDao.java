package com.example.project_sample.dao.place;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.place.PlaceVo;


@Mapper
public interface PlaceDao {

     List<PlaceVo> selectList(Map<String, String> map);

     //List<PlaceVo> insert(Map<String, String> map);

     void insert(String p_name,String p_addr, String p_lat, String p_log);

    

}
