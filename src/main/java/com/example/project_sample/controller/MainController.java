package com.example.project_sample.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project_sample.dao.board.BoardDao;
import com.example.project_sample.vo.board.BoardVo;



@Controller
public class MainController {


    @Autowired
    BoardDao boardDao;


    @Autowired
    HttpServletRequest request;

    @RequestMapping("/main")
    public String mainView(){

        return "main";
    }



    @RequestMapping("/feed/feed")
    public String feed(){

        return "feed/feed";
    }

    @RequestMapping("/feed/my_feed")
    public String my_feed(){

        

        return "feed/my_feed";
    }

    // @RequestMapping("feed/my_feed.do")
    // public String feed_myfeed(){


    //     return "feed/my_feed";
    // }


    // 코스그리기
    @RequestMapping("/feed/feed_insert_day_plus")
    public String feed_insert_day(BoardVo bVo, Model model){


        int recentb_idx = boardDao.recentb_idx(bVo.getB_idx());

        model.addAttribute("b_idx", recentb_idx);

        int b_idx = recentb_idx;

        //System.out.println(b_idx);

        return "feed/feed_insert_day";
    }

    
    
    @RequestMapping("/feed/location_search")
    public String location_search(){

        return "feed/location_search";
    }

    @RequestMapping("/mypage/mypage")
    public String mypage(){

        return "mypage/mypage";
    }

    @RequestMapping("/national/domestic")
    public String domestic(){

        return "national/domestic";
    }    


}



