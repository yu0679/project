package com.example.project_sample.dao.theme;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.theme.ThemeVo;


@Mapper
public interface ThemeDao {

    int theme_insert(ThemeVo tVo);




}
