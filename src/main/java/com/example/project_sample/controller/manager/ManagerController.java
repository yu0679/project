package com.example.project_sample.controller.manager;
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

import com.example.project_sample.dao.cs.QuestionDao;
import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.service.MyConstant;
import com.example.project_sample.service.Paging;
import com.example.project_sample.vo.cs.QuestionVo;
import com.example.project_sample.vo.member.MemberVo;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    HttpServletRequest request;

    @Autowired
	HttpSession session;

    MemberDao memberdao;
    QuestionDao questionDao;

    
    public ManagerController(MemberDao memberdao, QuestionDao questionDao) {
        this.memberdao = memberdao;
        this.questionDao = questionDao;
    }

    //매니저 메인
    @RequestMapping("/main")
    public String ManagerMain(){

        return "manager/managerMain";
    }

    //일반 회원 목록
	@RequestMapping("/man_member_list")
	public String list(Model model) {

		List <MemberVo> list = memberdao.selectList();
		
		//request binding
		model.addAttribute("list", list);
		
		return "manager/man_member_list";
	}




    //캘린더
    @RequestMapping("/man_calendar")
    public String calendar(){

        return "manager/calendar";
    }

//문의 내역 불러오기
@RequestMapping("/man_question_list")
public String man_question_list(@RequestParam(name = "page", defaultValue = "1") int nowPage,
		@RequestParam(name = "search", defaultValue = "all") String search,
		@RequestParam(name = "search_text", defaultValue = "") String search_text,
		Model model) {

	// 가져올 게시물 시작/끝을 구한다
	int start = (nowPage - 1) * MyConstant.Question.BLOCK_LIST + 1;
	int end = start + MyConstant.Question.BLOCK_LIST - 1;

	Map<String, Object> map = new HashMap<String, Object>();
	map.put("start", start);
	map.put("end", end);

	// 검색조건을 map에 포장
	if (search.equals("subject_content")) {
		map.put("subject", search_text);
		map.put("content", search_text);

	} else if (search.equals("subject")) {

		map.put("subject", search_text);

	} else if (search.equals("content")) {

		map.put("content", search_text);
	}

	List<QuestionVo> list = questionDao.selectConditionList(map);

	// 전체게시물수(검색정보포함)
	int rowTotal = questionDao.selectRowTotal(map); // 현재 map정보는 일단무시

	// 페이징메뉴 생성하기
	// 검색조건 필터
	String search_filter = String.format("search=%s&search_text=%s", search, search_text);
	// System.out.println(search_filter);

	String pageMenu = Paging.getPaging("cs_question_list",
			search_filter,
			nowPage,
			rowTotal,
			MyConstant.Question.BLOCK_LIST,
			MyConstant.Question.BLOCK_PAGE);
	// System.out.println(pageMenu);

	// 이전 view.do에서 session저장해놓은 show값 지우기
	session.removeAttribute("show");

	// model->DispatcherServlet전달->request binding
	// ->return되는 뷰정보를 이용해서 forward
	model.addAttribute("list", list);
	model.addAttribute("pageMenu", pageMenu);

	return "manager/man_question_list";
	
}
  //  /board/view.do?b_idx=4
  @RequestMapping("/man_question_view")
  public String man_question_view(int q_idx,Model model){

	  //Session에 show값이 있냐?
	  if(session.getAttribute("show")==null){
		  //조회수 증가
		  int res = questionDao.update_readhit(q_idx);
		  if(res==0){}

		  session.setAttribute("show", true);
	  }

	  QuestionVo vo = questionDao.selectOne(q_idx);
	  //결과적으로 request binding
	  model.addAttribute("vo", vo);

	  return "manager/man_question_view";
  }

}

