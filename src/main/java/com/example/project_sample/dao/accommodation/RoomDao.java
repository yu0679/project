package com.example.project_sample.dao.accommodation;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.accommodation.AccVo;
import com.example.project_sample.vo.accommodation.RoomVo;



@Mapper
public interface RoomDao {

     int roominsert(RoomVo vo);

    int selectMaxIdx();

    List<RoomVo> selectRoomList(int acc_idx);

    AccVo selectOne(int acc_idx);

    RoomVo selectRoomOne(int room_idx);

    int delete(int acc_idx);

    List<RoomVo> selectBookRoomList(Map map);

    List<RoomVo> resvRoomList(Map<String,Object> map ) ;


    
}
