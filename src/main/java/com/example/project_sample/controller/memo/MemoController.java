package com.example.project_sample.controller.memo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.memo.MemoDao;
import com.example.project_sample.vo.memo.MemoVo;



@Controller
public class MemoController {

    @Autowired
    MemoDao memoDao;

    @RequestMapping("/memo/memo_insert")
    @ResponseBody
    public MemoVo memo_insert(MemoVo vo){

    String memo_content = vo.getMemo_content();    
    int mem_idx = vo.getMem_idx();
    int d_idx = vo.getD_idx();
    int d_num = vo.getD_num();
    int b_idx = vo.getB_idx();


    //System.out.println(b_idx);
    Map<String,Object> map = new HashMap<String,Object>();

    map.put("memo_content", memo_content);
    map.put("mem_idx", mem_idx);
    map.put("d_idx", d_idx);
    map.put("d_num", d_num);
    map.put("b_idx", b_idx);


    //메모 추가
     int res = memoDao.memo_insert(map);

    //최근 추가한 메모(memo_idx) 
     MemoVo resultvo = memoDao.recentMemoData();

    

     return vo;

    }




}
