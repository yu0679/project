package com.example.project_sample.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.project_sample.dao.board.BoardDao;
import com.example.project_sample.dao.day.DayDao;
import com.example.project_sample.dao.place.PlaceDao;
import com.example.project_sample.dao.theme.ThemeDao;
import com.example.project_sample.vo.board.BoardVo;
import com.example.project_sample.vo.day.DayVo;
import com.example.project_sample.vo.member.MemberVo;
import com.example.project_sample.vo.memo.MemoVo;
import com.example.project_sample.vo.place.PlaceVo;
import com.example.project_sample.vo.theme.ThemeVo;



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

      //피드추가
    @RequestMapping("/board/feed_insert_day.do")
    public String board_insert(BoardVo bVo, Model model){

        String b_ip = request.getRemoteAddr();
        bVo.setB_ip(b_ip);

        String b_subject = bVo.getB_content();
        System.out.println(b_subject);

        int res = boardDao.Main_insert(bVo);


        int recentb_idx = boardDao.recentb_idx(bVo.getB_idx());

        model.addAttribute("b_idx", recentb_idx);

        return "redirect:../feed/feed_insert_day_plus";
    }


    // //피드추가
    // @RequestMapping("/board/feed_board_insert.do")
    // public String board_insert(BoardVo Vo ,ThemeVo tVo, PlaceVo pVo, MemoVo mVo, DayVo dVo, RedirectAttributes ra,
    //     @RequestParam("t_name") String t_name)
    // {

    //     MemberVo user = (MemberVo)session.getAttribute("user");

    //     if(user==null){
    //         ra.addAttribute("reson", "fail_session_timeout");
    //         return "redirect:../member/member_login.jsp";
    //     }


    //     int mem_idx =  user.getMem_idx();
    //     //bVo.setMem_idx(user.getMem_idx());

    //     int b_idx = Vo.getB_idx();
    //     System.out.println(b_idx);


        
    //     //----------Theme------------------
    //     tVo.setT_name(t_name); 
    //     System.out.println(t_name);

    //     //--------Theme DB insert-----------
    //     int theme_res = themeDao.theme_insert(tVo);


    //     //List<BoardVo> board_res = boardDao.all_data(); //검색결과


    //     int recent = boardDao.recentData(b_idx);

    //     //System.out.println(recent);

    //      List<BoardVo> board_all = boardDao.all_data(b_idx); //검색결과

    //      //String p_name = board_all.getP_name;

    //     int b_hit = 0;
        

    //     Map map = new HashMap();
    //     map.put("t_name", t_name);
    //     map.put("b_hit", b_hit);

        
    //    // int Board_update = boardDao.Board_update(map);

        

        
    //     return "redirect:../feed/feed";
    // }

 


    

}
