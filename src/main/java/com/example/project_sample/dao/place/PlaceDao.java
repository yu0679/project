package com.example.project_sample.dao.place;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.place.PlaceVo;


@Mapper
public interface PlaceDao {

     List<PlaceVo> selectList(Map<String, Object> map);


    PlaceVo selectOne(int mem_idx);

   //장소 추가
   int insert(PlaceVo pVo);

   //장소 마지막 저장값
   List<PlaceVo> recentData();

   //장소 삭제
   int place_delete(PlaceVo vo);


PlaceVo selectList();


List<PlaceVo> recent_p_idx_Data();



}
