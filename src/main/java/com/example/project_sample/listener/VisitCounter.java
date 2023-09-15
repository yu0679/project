package com.example.project_sample.listener;

import com.example.project_sample.dao.visit.VisitCountDao;
import com.example.project_sample.vo.visitor.VisitorVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
@Service
public class VisitCounter implements HttpSessionListener {


    public VisitCounter() {
    }

    @Autowired
    VisitCountDao visitCountDAO;

    @Override
    public void sessionCreated(HttpSessionEvent arg0){


        HttpSession session = arg0.getSession();
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
        //등록되어있는 빈을 사용할수 있도록 설정해준다
        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        //request를 파라미터에 넣지 않고도 사용할수 있도록 설정

        VisitorVo vo = new VisitorVo();

        vo.setVisit_ip(req.getRemoteAddr());

        int res = visitCountDAO.insertVisitor(vo);

    }


    
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0){
    }
}