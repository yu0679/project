package com.example.project_sample.listener;

import com.example.project_sample.dao.visit.VisitCountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@WebListener
public class VisitSessionListener implements HttpSessionListener {

    @Autowired
    VisitCountDao dao;

    @Override
    public void sessionCreated(HttpSessionEvent sessionEve) {

        // 세션이 새로 생성되면 execute() 실행한다.
        if (sessionEve.getSession().isNew()) {
            execute(sessionEve);
            System.out.println("-------------------------------------------------------");
        }
    }

    private void execute(HttpSessionEvent sessionEve) {

        try {
            // 전체 방문자 수 증가
            int res = dao.setTotalCount();

            // 총 방문자 수
            int totalCount = dao.getTotalCount();

            // 오늘 방문자 수
            int todayCount = dao.getTodayCount();

            HttpSession session = sessionEve.getSession();

            // 세션에 방문자 수를 담는다.
            session.setAttribute("totalCount", totalCount);
            session.setAttribute("todayCount", todayCount);

        } catch (Exception e) {
            System.out.println("===== 방문자 카운터 오류 =====\n");
            e.printStackTrace();
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {
    }

}
