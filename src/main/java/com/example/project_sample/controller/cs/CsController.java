package com.example.project_sample.controller.cs;

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

import com.example.project_sample.dao.cs.CsDao;
import com.example.project_sample.dao.cs.QuestionDao;
import com.example.project_sample.service.MyConstant;
import com.example.project_sample.service.Paging;
import com.example.project_sample.vo.cs.CsCategoryVo;
import com.example.project_sample.vo.cs.QuestionVo;

@Controller
public class CsController {

	QuestionDao questionDao;
	CsDao csDao;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	public CsController(QuestionDao questionDao, CsDao csDao) {
		this.questionDao = questionDao;
		this.csDao = csDao;
	}

	@RequestMapping("/cs")
	public String cs(@RequestParam(name = "category_num", defaultValue = "c001") String category_num, Model model) {

		// 카테고리 목록
		List<CsCategoryVo> category_list = csDao.selectList();

		System.out.println(category_list);

		CsCategoryVo category_one = csDao.selectOne(category_num);

		// System.out.println("category_list.size()=" + category_list.size());
		// request binding
		model.addAttribute("category_list", category_list);
		model.addAttribute("category_one", category_one);

		return "cs/cs";
	}

	@RequestMapping("/insert_form")
	public String insert_form() {

		return "cs/cs_insert_form";
	}

	@RequestMapping("/cs_question_list")
	public String cs_question_list(@RequestParam(name = "page", defaultValue = "1") int nowPage,
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

		return "cs/cs_question_list";
	}

}
