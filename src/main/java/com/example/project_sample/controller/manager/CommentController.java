package com.example.project_sample.controller.manager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.cs.CommentDao;
import com.example.project_sample.service.MyConstant;
import com.example.project_sample.service.Paging;
import com.example.project_sample.vo.cs.CommentVo;

@Controller
@RequestMapping("/board/")
public class CommentController {
    
    @Autowired
    HttpServletRequest request;

    CommentDao commentDao;

    
    public CommentController(CommentDao commentDao) {
        this.commentDao = commentDao;
    }


    // /board/comment_list.do?q_idx=5&page=1
    // 댓글목록 가져오기
    @RequestMapping("comment_list.do")
    public String comment_list(int q_idx,
                               @RequestParam(name="page",defaultValue = "1")int nowPage,
                               Model model){


        Map<String,Object> map = new HashMap<String,Object>();

        //검색범위 구하기
        int start = (nowPage-1)*MyConstant.Comment.BLOCK_LIST + 1 ; 
        int end   = start + MyConstant.Comment.BLOCK_LIST - 1;

        //검색조건을 map에 포장
        map.put("q_idx", q_idx);
        map.put("start", start);
        map.put("end", end);


        List<CommentVo> list = commentDao.selectList(map);

         //페이지 메뉴 작성
        int rowTotal = commentDao.selectRowTotal(map);

        String pageMenu = Paging.getCommentPaging(
                                            nowPage, 
                                            rowTotal,
                                            MyConstant.Comment.BLOCK_LIST,
                                            MyConstant.Comment.BLOCK_PAGE);
        //System.out.println(pageMenu);

        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);


        return "manager/man_comment_list"; // /WEB-INF/views/board/comment_list.jsp
    }



    @RequestMapping("comment_insert")
    @ResponseBody
    public Map<String,String> comment_insert(CommentVo vo){

        String comment_ip = request.getRemoteAddr();
        vo.setComment_ip(comment_ip);

        // \n -> <br>
        String comment_content = vo.getComment_content()
                                   .replaceAll("\n", "<br>");
        vo.setComment_content(comment_content);                                   

        int res = commentDao.insert(vo);


        Map<String,String> map = new HashMap<String,String>();
        
        if(res==1){
          map.put("result","success");
        }else{
          map.put("result","fail");  
        }

        return map;
    }


    //  /board/comment_delete.do?comment_idx=5&comment_page=3

    @RequestMapping("comment_delete")
    @ResponseBody
    public Map<String,String> comment_delete(int comment_idx,int comment_page,int q_idx){


      //댓글삭제
      int res = commentDao.delete(comment_idx);

      //페이지계산(마지막페이지 내용삭제시 전체페이지가 감소)
      Map<String,Object>map1 = new HashMap<String,Object>();
      map1.put("q_idx", q_idx);
      int rowTotal = commentDao.selectRowTotal(map1);

      int totalPage = rowTotal / MyConstant.Comment.BLOCK_LIST;
      if(rowTotal%MyConstant.Comment.BLOCK_LIST!=0) totalPage++;
      if(comment_page > totalPage)
         comment_page = totalPage;

        
      Map<String,String> map = new HashMap<String,String>();
        
      if(res==1){
        //  { "result" : "success" }
        map.put("result","success");
        map.put("comment_page",String.valueOf(comment_page));
      }else{
        map.put("result","fail");  
      }

      return map;
    }

}
