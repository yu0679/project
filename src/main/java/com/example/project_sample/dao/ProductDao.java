package com.example.project_sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.ProductVo;


@Mapper
public interface ProductDao {


	// Category별 조회
	public List<ProductVo> product_list(String category);



}
