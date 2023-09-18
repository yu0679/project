package com.example.project_sample.controller.day;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.day.DayDao;
import com.example.project_sample.vo.day.DayVo;
import com.example.project_sample.vo.memo.MemoVo;



@Controller
public class DayController {

    @Autowired
    DayDao dayDao;

    //일차추가
    @RequestMapping("/day/plus")
    @ResponseBody
    public DayVo day(DayVo vo){

        int d_num = vo.getD_num();
        int b_idx = vo.getB_idx();
        System.out.println(b_idx);
        int res = dayDao.dayinsert(vo);
        
        vo = dayDao.recentData();
        
        int d_idx = vo.getD_idx();
       

        return vo;

    }

    @RequestMapping("/day/memo_insert")
    @ResponseBody
    public DayVo memo_insert(DayVo vo){

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
    map.put("mem_idx", mem_idx);


    //메모 추가
     int res = dayDao.day_memo_insert(map);

    //최근 추가한 메모(memo_idx) 
     DayVo resultvo = dayDao.recentMemoData();

    
     return vo;

    }



}
