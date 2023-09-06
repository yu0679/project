package com.example.project_sample.controller.memo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.memo.MemoDao;
import com.example.project_sample.vo.memo.MemoVo;



@Controller
public class MemoController {

    @Autowired
    MemoDao memoDao;


    @RequestMapping("/memo/memo_insert")
    @ResponseBody
    public MemoVo memo_insert(@RequestParam("memo_content") String memo_content,
                              @RequestParam("mem_idx")int mem_idx,
                                         Model model){

    System.out.println(memo_content);

    //memo_content = memo_content.replaceAll("\n", "<br>");

    Map<String,Object> map = new HashMap<String,Object>();

    map.put("memo_content", memo_content);
    map.put("mem_idx", mem_idx);

    //장소 추가
     int res = memoDao.memo_insert(map);

    //최근 추가한 메모(memo_idx) 
     MemoVo vo = memoDao.recentMemoData();

    

     return vo;

    }




}
