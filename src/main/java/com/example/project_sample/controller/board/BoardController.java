package com.example.project_sample.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project_sample.dao.board.BoardDao;
import com.example.project_sample.dao.day.DayDao;
import com.example.project_sample.dao.place.PlaceDao;
import com.example.project_sample.dao.theme.ThemeDao;
import com.example.project_sample.vo.board.BoardVo;



@Controller
public class BoardController {

    @Autowired
    BoardDao boardDao;

    @Autowired
    DayDao dayDao;

    @Autowired
    PlaceDao placeDao;
    
    @Autowired
    ThemeDao themeDao;

    @Autowired
    HttpServletRequest request;
    
    @Autowired
    HttpSession session;
    
    //--------------------내 피드 누른 후--------------------
    @RequestMapping("/feed/my_feed.do")
    public String my_feed(Model model){

        
        List<BoardVo> list = boardDao.board_list();

        //System.out.println("list'size=" + list.size());

        model.addAttribute("board_list", list);
        //mem_idx가 자기꺼 인것만 불러 오기

        return "feed/my_feed";
    }

    //--------------------보드 추가(코스 그리기 클릭후)하기--------------------
    @RequestMapping("/board/feed_insert.do")
    public String feed_insert(@RequestParam("mem_idx") int mem_idx, BoardVo bVo){

        int xx = 1111;

        System.out.println(xx);
        bVo.setMem_idx(mem_idx);
        System.out.println(mem_idx);


        return "feed/feed_insert";
    }

    //--------------------일정추가하기--------------------
    @RequestMapping("/board/feed_insert_day.do")
    public String board_insert(BoardVo bVo, Model model){

        String b_ip = request.getRemoteAddr();
        bVo.setB_ip(b_ip);

        String b_subject = bVo.getB_content();
        
        int res = boardDao.Main_insert(bVo);

        // return "redirect:../feed/feed_insert_day_plus";
        return "redirect:../feed/my_feed.do";
    }


    //--------------------일차 추가 페이지 이동--------------------
    @RequestMapping("/board/my_feed_day.do")
    public String my_feed_day(@RequestParam("b_idx") int b_idx,
    Model model){

        //System.out.println(b_idx);
        model.addAttribute("b_idx", b_idx);

        return "feed/feed_insert_day";
       
    }


    //--------------------보드 합친 페이지로 이동--------------------
    @RequestMapping("/board/my_feed_b_idx_look.do")
    public String my_feed_b_idx_look(@RequestParam("b_idx") int b_idx,
        BoardVo bVo, Model model){

       // System.out.println(b_idx);

       model.addAttribute("b_idx", b_idx);
       

        return "redirect:../board/my_feed_b_idx_main.do?b_idx="+b_idx;
    }

    @RequestMapping("/board/my_feed_b_idx_main.do")
    public String my_feed_b_idx_main(@RequestParam("b_idx") int b_idx, Model model){

        //System.out.println(b_idx);

       List<BoardVo> list = boardDao.selectBoardOne(b_idx);
        //List<TotalVo> tVo = boardDao.selectBoardOne(b_idx);

        model.addAttribute("total_list", list);
        //model.addAttribute("total_list", tVo);
        System.out.println(list.size());


        return "feed/feed_board";
    }
    
    @RequestMapping("/board/feed_select.do")
    public String t_name_select(String t_name, Model model){

        //String t_name = bVo.getT_name();
        System.out.println(t_name);
        List<BoardVo> list = boardDao.selectFeedList(t_name);

        model.addAttribute("t_name_list", list);

        System.out.println(list.size());
   
        return "feed/feed";
    }


}
