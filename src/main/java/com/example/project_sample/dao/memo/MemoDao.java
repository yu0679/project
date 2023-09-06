package com.example.project_sample.dao.memo;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.memo.MemoVo;


@Mapper
public interface MemoDao {

   int memo_insert(Map<String, Object> map);

   MemoVo recentMemoData();



}
