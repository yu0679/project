package com.example.project_sample.controller;

import javax.servlet.http.HttpServletRequest;

import com.example.project_sample.dao.visit.VisitCountDao;
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

    @Autowired
    VisitCountDao visitCountDao;

    @RequestMapping("/main")
    public String mainView(){

        return "main";
    }


    @RequestMapping("/chart")
    public String chart(Model model){

        int sun = visitCountDao.getSun();

        int mon = visitCountDao.getMon();
        int tue = visitCountDao.getTue();
        int wed = visitCountDao.getWed();
        int thu = visitCountDao.getThu();
        int fri = visitCountDao.getFri();
        int sat = visitCountDao.getSat();

        model.addAttribute("sun",sun);
        model.addAttribute("mon",mon);
        model.addAttribute("tue",tue);
        model.addAttribute("wed",wed);
        model.addAttribute("thu",thu);
        model.addAttribute("fri",fri);
        model.addAttribute("sat",sat);

        return "chart";
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



