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



    @RequestMapping("feed/feed")
    public String feed(){

        return "feed/feed";
    }

    @RequestMapping("feed/my_feed")
    public String my_feed(){

        

        return "feed/my_feed";
    }
    @RequestMapping("feed/feed_insert")
    public String feed_insert(BoardVo vo, Model model){

        int res = boardDao.Main_insert();

        int resultvo = boardDao.recentData();

        model.addAttribute("b_idx", resultvo);


        return "feed/feed_insert";
    }
    
    
    @RequestMapping("feed/location_search")
    public String location_search(){

        return "feed/location_search";
    }

    @RequestMapping("mypage/mypage")
    public String mypage(){

        return "mypage/mypage";
    }

    @RequestMapping("national/domestic")
    public String domestic(){

        return "national/domestic";
    }    


}



