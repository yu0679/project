package com.example.project_sample.controller.cs;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.project_sample.dao.cs.CommentDao;
import com.example.project_sample.dao.cs.CsDao;
import com.example.project_sample.dao.cs.QuestionDao;
import com.example.project_sample.service.MyConstant;
import com.example.project_sample.service.Paging;
import com.example.project_sample.vo.cs.CommentVo;
import com.example.project_sample.vo.cs.CsCategoryVo;
import com.example.project_sample.vo.cs.QuestionVo;
import com.example.project_sample.vo.member.MemberVo;

@Controller
@RequestMapping("/cs")
public class CsController {




	QuestionDao questionDao;
	CsDao csDao;
	CommentDao commentDao;



	@Autowired
	ServletContext application;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	public CsController(QuestionDao questionDao, CsDao csDao,CommentDao commentDao) {
		this.questionDao = questionDao;
		this.csDao = csDao;
		this.commentDao = commentDao;
	}

	@RequestMapping("/cs")
	public String cs(@RequestParam(name = "category_num", defaultValue = "c001") String category_num, Model model) {

		// 카테고리 목록
		List<CsCategoryVo> category_list = csDao.selectList();

		

		CsCategoryVo category_one = csDao.selectOne(category_num);

		// System.out.println("category_list.size()=" + category_list.size());
		// request binding
		model.addAttribute("category_list", category_list);
		model.addAttribute("category_one", category_one);

		return "cs/cs";
	}

	
    //문의하기 폼
    @RequestMapping("/cs_insert_form")
    public String insert_form(){

        return "cs/cs_insert_form";
    }


//문의하기
	@RequestMapping("/cs_question_insert")
		public String cs_question_insert(QuestionVo vo,
	@RequestParam MultipartFile photo,
	RedirectAttributes ra ) throws IOException {



			//로그인 유저정보 구하기
			MemberVo user = (MemberVo) session.getAttribute("user");

			//로그아웃된 상태면
			if(user==null){

				ra.addAttribute("reason","fail_session_timeout");
				//login_form.do?reason=fail_session_timeout 
				return "redirect:../member/login_form.do";
			}
			// 파일 업로드 처리
			String webPath = "/upload/";
			String absPath = application.getRealPath(webPath);
			String qFilename = "no_file";
			
			if (!photo.isEmpty()) {
				// 임시 파일 이름
				qFilename = photo.getOriginalFilename();
				// 저장 파일 정보
				File f = new File(absPath, qFilename);
		
				if (f.exists()) {
					// 동일한 파일이 존재하면 이름에 시간을 추가
					long tm = System.currentTimeMillis();
					qFilename = String.format("%d_%s", tm, qFilename);
					f = new File(absPath, qFilename);
				}
		
				// 임시 파일을 실제 파일로 복사
				photo.transferTo(f);
			}
			// 로그인된 유저정보를 vo에 넣는다
			vo.setMem_idx(user.getMem_idx());
			vo.setMem_name(user.getMem_name());
			String q_ip = request.getRemoteAddr();
			vo.setQ_ip(q_ip);

			// \n -> <br>
			String q_content = vo.getQ_content().replaceAll("\n", "<br>");
			vo.setQ_content(q_content);
			vo.setQ_filename(qFilename);

			//DB Insert
			int res = questionDao.insert(vo);
			if(res==0){

			}

		



	return "redirect:cs_question_list";
	}



// 나의 문의 내역 불러오기
@RequestMapping("/cs_question_list")
public String cs_question_list( @RequestParam(name = "page", defaultValue = "1") int nowPage,
		@RequestParam(name = "search", defaultValue = "all") String search,
		@RequestParam(name = "search_text", defaultValue = "") String search_text,
		Model model) {

	// 가져올 게시물 시작/끝을 구한다
	int start = (nowPage - 1) * MyConstant.Question.BLOCK_LIST + 1;
	int end = start + MyConstant.Question.BLOCK_LIST - 1;
    MemberVo user = (MemberVo) session.getAttribute("user");
	// 카테고리 목록
	Map<String, Object> map = new HashMap<String, Object>();
	

	
	map.put("start", start);
	map.put("end", end);
	map.put("mem_idx",user.getMem_idx());

	// 검색조건을 map에 포장
	if (search.equals("subject_content")) {
		map.put("subject", search_text);
		map.put("content", search_text);

	} else if (search.equals("subject")) {

		map.put("subject", search_text);

	} else if (search.equals("content")) {

		map.put("content", search_text);
	}

	List<QuestionVo> list = questionDao.cs_selectConditionList(map);
	System.out.println(list);
	// 전체게시물수(검색정보포함)
	int rowTotal = questionDao.selectRowTotal(map); // 현재 map정보는 일단무시

	// 페이징메뉴 생성하기
	// 검색조건 필터
	String search_filter = String.format("search=%s&search_text=%s", search, search_text);
	

	String pageMenu = Paging.getPaging("cs_question_list",
			search_filter,
			nowPage,
			rowTotal,
			MyConstant.Question.BLOCK_LIST,
			MyConstant.Question.BLOCK_PAGE);
	

	//이전 view.do에서 session저장해놓은 show값 지우기
	//session.removeAttribute("show");

	// model->DispatcherServlet전달->request binding
	// ->return되는 뷰정보를 이용해서 forward
	model.addAttribute("list", list);
	model.addAttribute("pageMenu", pageMenu);

	return "cs/cs_question_list";
}






 
    @RequestMapping("/cs_question_view")
    public String cs_question_view(int q_idx,Model model){

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

        return "cs/cs_question_view";
    }



		
 //문의내역 삭제
@RequestMapping("/cs_question_delete")
	public String cs_question_delete(String search,String search_text,int q_idx,int page,RedirectAttributes ra){

		int res = questionDao.delete(q_idx);//내부적인 명령 update board set b_use='n'

		if(res==0){}
	
		ra.addAttribute("page", page);// list.do?page=4
		ra.addAttribute("search", search);// list.do?page=4
		ra.addAttribute("search_text", search_text);// list.do?page=4

		return "redirect:cs_question_list";
}



// /board/comment_list.do?q_idx=5&page=1
    // 댓글목록 가져오기
    @RequestMapping("cs_comment_list")
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
        

        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

		
        return "cs/cs_comment_list"; // /WEB-INF/views/board/comment_list.jsp
    }



}
