package com.example.project_sample.controller.day;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.day.DayDao;
import com.example.project_sample.vo.day.DayVo;



@Controller
public class DayController {

    @Autowired
    DayDao dayDao;

    //일차추가
    @RequestMapping("/day/plus")
    @ResponseBody
    public DayVo day(DayVo vo){

        int d_num = vo.getD_num();
        
        int res = dayDao.dayinsert(vo);
        
        vo = dayDao.recentData();
        
        int d_idx = vo.getD_idx();
       

        return vo;

    }

}
