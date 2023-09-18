package com.example.project_sample.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project_sample.dao.board.BoardDao;
import com.example.project_sample.dao.visit.VisitCountDao;
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

    @RequestMapping("/feed/feed.do")
    public String feed(@RequestParam(name="t_name" ,defaultValue="") String t_name, Model model){

        List<BoardVo> list = boardDao.selectFeedList("#" + t_name);
       // System.out.printf("t_name_list : " + list.size());

        model.addAttribute("t_name_list", list);

        return "feed/feed_list";
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



