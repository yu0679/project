package com.example.project_sample.dao.accommodation;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.accommodation.Room_PhotoVo;

@Mapper
public interface Room_PhotoDao {
 
    int room_photo_insert(Room_PhotoVo roomphotoVo);
}
