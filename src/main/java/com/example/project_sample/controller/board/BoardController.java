package com.example.project_sample.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    @RequestMapping("/board/feed_board_insert.do")
    public String board_insert(BoardVo bVo ,ThemeVo tVo, PlaceVo pVo, MemoVo mVo, DayVo dVo, RedirectAttributes ra,
        @RequestParam("t_name") String t_name)
    {

        MemberVo user = (MemberVo)session.getAttribute("user");

        if(user==null){
            ra.addAttribute("reson", "fail_session_timeout");
            return "redirect:../member/member_login.jsp";
        }


        int mem_idx =  user.getMem_idx();
        //bVo.setMem_idx(user.getMem_idx());

        int b_idx = bVo.getB_idx();


        //----------시작날짜와 끝날짜------------------
        String b_start   = bVo.getB_start();
        String b_end     = bVo.getB_end();
        String b_content = bVo.getB_content();

        System.out.println(b_start);
        System.out.println(b_end);

        String b_ip = request.getRemoteAddr();
        bVo.setB_ip(b_ip);
        
        //----------Theme------------------
        tVo.setT_name(t_name); 
        System.out.println(t_name);

        //--------Theme DB insert-----------
        int theme_res = themeDao.theme_insert(tVo);

        //--------Theme idx 불러오기-----------
        int t_idx = tVo.getT_idx();
        //System.out.println(t_idx);
        //System.out.println(bVo.getT_idx());

        //----------Day------------------
        int d_num = dVo.getD_num();
        int d_res = dayDao.recent_onIdx_Data();
        int d_idx = d_res;
      

        System.out.println(d_idx);
        //System.out.println(d_num);

        //----------Place------------------
        List<PlaceVo> p_res = placeDao.recentData();
        List<PlaceVo> p_idx = p_res;

         System.out.println(p_idx);


        // String p_name = pVo.getP_name();
        // String p_addr = pVo.getP_addr();
        // String p_lat  = pVo.getP_lat();
        // String p_log  = pVo.getP_log();

        //----------Memo------------------
        int memo_idx = mVo.getMemo_idx();
        String memo_content = mVo.getMemo_content();

        int b_hit = 0;

        Map map = new HashMap();
        map.put("b_idx", b_idx);
        map.put("b_ip", b_ip);
        map.put("b_start", b_start);
        map.put("b_end", b_end);
        map.put("b_content", b_content);
        map.put("d_idx", d_idx);
        map.put("d_num", d_num);
        map.put("t_idx", t_idx);
        map.put("t_name", t_name);
        map.put("p_idx", p_idx);
        map.put("memo_idx", memo_idx);
        map.put("mem_idx", mem_idx);
        map.put("b_hit", b_hit);

        
        int Board_update = boardDao.Board_update(map);

        

        
        return "redirect:../feed/feed";
    }

 


    

}
