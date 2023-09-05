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

import com.example.project_sample.dao.cs.QuestionDao;
import com.example.project_sample.service.MyConstant;
import com.example.project_sample.service.Paging;
import com.example.project_sample.vo.cs.QuestionVo;

@Controller
public class QuestionController {


QuestionDao questionDao;


@Autowired
HttpSession session;

@Autowired
HttpServletRequest request;





public QuestionController(QuestionDao  questionDao) {
	this.questionDao = questionDao;
}

    
	








}
