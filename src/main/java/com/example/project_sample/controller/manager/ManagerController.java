package com.example.project_sample.controller.manager;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.vo.member.MemberVo;







@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    HttpServletRequest request;

    @Autowired
	HttpSession session;

    MemberDao memberdao;
    //QuestionDao questionDao;

    public ManagerController(MemberDao memberdao) {
        this.memberdao = memberdao;
    }

    //매니저 메인
    @RequestMapping("/main")
    public String ManagerMain(){

        return "manager/managerMain";
    }

    //일반 회원 목록
	@RequestMapping("/member_list")
	public String list(Model model) {

		List <MemberVo> list = memberdao.selectList();
		
		//request binding
		model.addAttribute("list", list);
		
		return "manager/member_list";
	}


    // //1:1 문의 문의하기 답변용
    // @RequestMapping("/question_list")
    // public String question_list(int b_idx,
    //                         @RequestParam(name="page",defaultValue = "1")int nowPage,
    //                         Model model){


    //   //검색범위 구하기 
    // int start = (nowPage-1)*MyConstant.Comment.BLOCK_LIST + 1;
    // int end   = start + MyConstant.Comment.BLOCK_LIST -1;



    // Map<String,Object> map = new HashMap<String,Object>();
    //   //검색조건을 map에 포장해 xml에 셀렉트
    // map.put("b_idx", b_idx);
    // map.put("start", start);
    // map.put("end", end);  

    // List<QuestionVo> list = questionDao.selectList(map);

    //   //전체게시물수(검색정보포함)
    // int rowTotal = questionDao.selectRowTotal(map);

    // String pageMenu = Paging.getPaging1(
    //                                     nowPage, 
    //                                     rowTotal, 
    //                                     MyConstant.Comment.BLOCK_LIST,
    //                                     MyConstant.Comment.BLOCK_PAGE);

    // model.addAttribute("list", list);
    // model.addAttribute("pageMenu", pageMenu);




    //     return "manager/question_list"; // /WEB-INF/views/board/comment_list.jsp
    // }

    //캘린더
    @RequestMapping("/calendar")
    public String calendar(){

        return "manager/calendar";
    }



}

