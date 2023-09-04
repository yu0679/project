package com.example.project_sample.controller.cs;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project_sample.dao.cs.CsDao;
import com.example.project_sample.vo.cs.CsCategoryVo;

@Controller
public class CsController {
CsDao csDao;



@Autowired
HttpSession session;

@Autowired
HttpServletRequest request;


public CsController(CsDao csDao) {
	this.csDao = csDao;
}




    @RequestMapping("/cs")
    public String cs(@RequestParam(name="category_num",defaultValue = "c001")String category_num,Model model){

		// 카테고리 목록
		List<CsCategoryVo> category_list = csDao.selectList();

		System.out.println(category_list);

		CsCategoryVo  		category_one = csDao.selectOne(category_num);


		//System.out.println("category_list.size()=" + category_list.size());
		// request binding
		model.addAttribute("category_list", category_list);
		model.addAttribute("category_one", category_one);

        return "cs/cs";
    }


	
	@RequestMapping("insert_form")
	public String insert_form(){

		return "cs/cs_insert_form";
	}






}
