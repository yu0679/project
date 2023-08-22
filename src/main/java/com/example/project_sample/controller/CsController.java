package com.example.project_sample.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project_sample.dao.CsDao;
import com.example.project_sample.dao.ProductDao;
import com.example.project_sample.vo.CsCategoryVo;
import com.example.project_sample.vo.ProductVo;

@Controller

public class CsController {

	CsDao csDao;
	
	ProductDao productDao;

@Autowired
HttpSession session;

@Autowired
HttpServletRequest request;

@Autowired
public CsController(CsDao csDao) {
	this.csDao = csDao;
}




    @RequestMapping("/main")
    public String mainView(){

        return "main";
    }


    @RequestMapping("/login")
    public String test(){

        return "login";
    }

    @RequestMapping("/cs")
    public String cs(Model model){

		// 카테고리 목록
		List<CsCategoryVo> category_list = csDao.selectList();

		System.out.println("category_list.size()=" + category_list.size());
		// request binding
		model.addAttribute("category_list", category_list);
		
        return "cs";
    }

    @RequestMapping("/cs/list")
	public String list(Model model) {
// /product/list.do?
		// /product/list.do?category =com001
		// /product/list.do?category =ele002
		// /product/list.do?category =sp003

		String category = request.getParameter("category");

		if (category == null)

			category = "com001";

		List<ProductVo> list = productDao.product_list(category);

		// 카테고리 목록
		List<CsCategoryVo> category_list = csDao.selectList();

		// request binding
		model.addAttribute("list", list);
		model.addAttribute("category_list", category_list);

		return "cs";
		// 프론트컨트롤러가 호출한후 호출된 곳으로 return한다

		
	}


}
