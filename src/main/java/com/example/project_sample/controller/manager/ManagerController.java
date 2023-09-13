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
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.cs.CommentDao;
import com.example.project_sample.dao.cs.QuestionDao;
import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.service.MyConstant;
import com.example.project_sample.service.Paging;
import com.example.project_sample.vo.cs.CommentVo;
import com.example.project_sample.vo.cs.QuestionVo;
import com.example.project_sample.vo.member.MemberVo;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    HttpServletRequest request;

    @Autowired
	HttpSession session;

	CommentDao commentDao;
    MemberDao memberdao;
    QuestionDao questionDao;

    
    public ManagerController(MemberDao memberdao, QuestionDao questionDao, CommentDao commentDao) {
        this.memberdao = memberdao;
        this.questionDao = questionDao;
        this.commentDao = commentDao;
    }

    //매니저 메인
    @RequestMapping("/main")
    public String ManagerMain(){

        return "manager/managerMain";
    }


	//로그인 폼
	@RequestMapping("/man_login_Form")
    public String man_login_Form() {

        return "manager/man_login_Form";
    }

    // //로그인
    // @RequestMapping("/man_login")
    // public String man_login(){
    //      return "manager/man_login";
    // }
	


    // //로그아웃
    // @RequestMapping("/man_logout")
    // public String man_logout() {
    //     session.removeAttribute("user");

    //     return "redirect:../main";
    // }


    //아이디, 비밀번호 찾기 폼
    @RequestMapping("/find_idPwd")
    public String find_Id() {

        return "member/find_idPwd";
    }






    //일반 회원 목록
	@RequestMapping("/man_member_list")
	public String man_member_list(Model model) {

		List <MemberVo> list = memberdao.selectList();
		
		//request binding
		model.addAttribute("list", list);
		
		return "manager/man_member_list";
	}




    //캘린더
    @RequestMapping("/man_calendar")
    public String man_calendar(){

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

	List<QuestionVo> list = questionDao.man_selectConditionList(map);

	// 전체게시물수(검색정보포함)
	int rowTotal = questionDao.selectRowTotal(map); // 현재 map정보는 일단무시

	// 페이징메뉴 생성하기
	// 검색조건 필터
	String search_filter = String.format("search=%s&search_text=%s", search, search_text);
	// System.out.println(search_filter);

	String pageMenu = Paging.getPaging("man_question_list",
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

  //문의내역 삭제
  @RequestMapping("/man_question_delete")
  public String man_question_delete(String search,String search_text,int q_idx,int page,RedirectAttributes ra){
  
      int res = questionDao.delete(q_idx);//내부적인 명령 update board set b_use='n'
  
      if(res==0){}
  
      ra.addAttribute("page", page);// list.do?page=4
      ra.addAttribute("search", search);// list.do?page=4
      ra.addAttribute("search_text", search_text);// list.do?page=4
  
      return "redirect:man_question_list";
  }
  


 // /board/comment_list.do?q_idx=5&page=1
    // 댓글목록 가져오기
    @RequestMapping("/man_comment_list")
    public String man_comment_list(int q_idx,
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



    @RequestMapping("/man_comment_insert")
    @ResponseBody
    public Map<String,String> man_comment_insert(CommentVo vo){

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

    @RequestMapping("/man_comment_delete")
    @ResponseBody
    public Map<String,String> man_comment_delete(int comment_idx,int comment_page,int q_idx){


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


    @RequestMapping("/ckeck_ceo")
    public String ckeckCeo(Model model){

        List<MemberVo> ceoList = memberdao.checkingCeoList();
        model.addAttribute("list",ceoList);

        return "manager/man_ceo_checking";
    }

    @RequestMapping("/approve")
    public String approveCeo(String mem_idx, RedirectAttributes ra){

        MemberVo ceo = memberdao.selectByIdx(mem_idx);

        ceo.setMem_state("Y");

        List<MemberVo> ceoList = memberdao.checkingCeoList();
        ra.addAttribute("list",ceoList);

        return "rediract:../manager/man_ceo_checking";
    }




}

