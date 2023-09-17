package com.example.project_sample.controller.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.project_sample.dao.cs.CommentDao;
import com.example.project_sample.dao.cs.QuestionDao;
import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.service.EmailService;
import com.example.project_sample.service.MyConstant;
import com.example.project_sample.service.Paging;
import com.example.project_sample.service.UserService;
import com.example.project_sample.vo.cs.CommentVo;
import com.example.project_sample.vo.cs.QuestionVo;
import com.example.project_sample.vo.member.EmailMessage;
import com.example.project_sample.vo.member.MemberVo;

import lombok.RequiredArgsConstructor;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequiredArgsConstructor
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    EmailService emailService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @Autowired
    CommentDao commentDao;

    @Autowired
    MemberDao memberDao;

    @Autowired
    QuestionDao questionDao;

    @Autowired
    UserService userService;

    public ManagerController(MemberDao memberDao, QuestionDao questionDao, CommentDao commentDao,
            UserService userService) {
        this.memberDao = memberDao;
        this.questionDao = questionDao;
        this.commentDao = commentDao;
        this.userService = userService;
    }

    // 매니저 메인
    @RequestMapping("/main")
    public String ManagerMain(Model model) {

        //일반유저수
        int mem_count = userService.selectNormalCount();
        //CEO유저수
        int ceo_count = userService.selectCeoCount();
        //피드 수
        int b_count = userService.select_B_AllCount();
        //하루 방문자수
        int t_count = userService.todayVisitorCount();
        //한달 방문자수
        int m_count = userService.monthlyVisitorCount();
        //한달 방문자수
        int y_count = userService.yearlyVisitorCount();

        model.addAttribute("mem_count", mem_count);
        model.addAttribute("b_count", b_count);
        model.addAttribute("ceo_count", ceo_count);
        model.addAttribute("t_count", t_count);
        model.addAttribute("m_count", m_count);
        model.addAttribute("y_count", y_count);


        return "manager/managerMain";
    }

    // 로그인 폼 (로그인은 시큐리티가 진행)
    @GetMapping("/man_login_Form")
    public String man_login_Form() {

        return "manager/man_login_Form";
    }



    //로그아웃
    @GetMapping("/man_logout")
    public String man_logout(Authentication authentication) {


        //세션지우기
        session.removeAttribute("admin_user");


        if (authentication != null) {

            new SecurityContextLogoutHandler().logout(request, null, authentication);
        }


        return "redirect:/manager/man_login_Form";
    }

    // 아이디, 비밀번호 찾기 폼
    @RequestMapping("/find_idPwd")
    public String find_Id() {

        return "member/find_idPwd";
    }

    // 일반 회원만 목록가져오기
    @RequestMapping("/man_member_list")
    public String man_member_list(Model model) {

        List<MemberVo> list = memberDao.selectNormalList();


        
        // request binding
        model.addAttribute("list", list);
        
        return "manager/man_member_list";
    }
    // CEO 회원만 목록가져오기
    @RequestMapping("/man_ceo_list")
    public String man_ceo_list(Model model) {

        List<MemberVo> list = memberDao.selectCeoList();

        // request binding
        model.addAttribute("list", list);
        
        return "manager/man_ceo_list";
    }



    // 문의 내역 불러오기
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
    public String man_question_view(int q_idx, Model model) {

        // Session에 show값이 있냐?
        if (session.getAttribute("show") == null) {
            // 조회수 증가
            int res = questionDao.update_readhit(q_idx);
            if (res == 0) {
            }

            session.setAttribute("show", true);
        }

        QuestionVo vo = questionDao.selectOne(q_idx);
        // 결과적으로 request binding
        model.addAttribute("vo", vo);

        return "manager/man_question_view";
    }

    // 문의내역 삭제
    @RequestMapping("/man_question_delete")
    public String man_question_delete(String search, String search_text, int q_idx, int page, RedirectAttributes ra) {

        int res = questionDao.delete(q_idx);// 내부적인 명령 update board set b_use='n'

        if (res == 0) {
        }

        ra.addAttribute("page", page);// list.do?page=4
        ra.addAttribute("search", search);// list.do?page=4
        ra.addAttribute("search_text", search_text);// list.do?page=4

        return "redirect:man_question_list";
    }

    // /board/comment_list.do?q_idx=5&page=1
    // 댓글목록 가져오기
    @RequestMapping("/man_comment_list")
    public String man_comment_list(int q_idx,
            @RequestParam(name = "page", defaultValue = "1") int nowPage,
            Model model) {

        Map<String, Object> map = new HashMap<String, Object>();

        // 검색범위 구하기
        int start = (nowPage - 1) * MyConstant.Comment.BLOCK_LIST + 1;
        int end = start + MyConstant.Comment.BLOCK_LIST - 1;

        // 검색조건을 map에 포장
        map.put("q_idx", q_idx);
        map.put("start", start);
        map.put("end", end);

        List<CommentVo> list = commentDao.selectList(map);

        // 페이지 메뉴 작성
        int rowTotal = commentDao.selectRowTotal(map);

        String pageMenu = Paging.getCommentPaging(
                nowPage,
                rowTotal,
                MyConstant.Comment.BLOCK_LIST,
                MyConstant.Comment.BLOCK_PAGE);
        // System.out.println(pageMenu);

        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        return "manager/man_comment_list"; // /WEB-INF/views/board/comment_list.jsp
    }

    //1:1문의 답변등록
    @RequestMapping("/man_comment_insert")
    @ResponseBody
    public Map<String, String> man_comment_insert(CommentVo vo) {

        String comment_ip = request.getRemoteAddr();
        vo.setComment_ip(comment_ip);

        // \n -> <br>
        String comment_content = vo.getComment_content()
                .replaceAll("\n", "<br>");
        vo.setComment_content(comment_content);

        int res = commentDao.insert(vo);

        Map<String, String> map = new HashMap<String, String>();

        if (res == 1) {
            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }

        return map;
    }

    // /board/comment_delete.do?comment_idx=5&comment_page=3

    @RequestMapping("/man_comment_delete")
    @ResponseBody
    public Map<String, String> man_comment_delete(int comment_idx, int comment_page, int q_idx) {

        // 댓글삭제
        int res = commentDao.delete(comment_idx);

        // 페이지계산(마지막페이지 내용삭제시 전체페이지가 감소)
        Map<String, Object> map1 = new HashMap<String, Object>();
        map1.put("q_idx", q_idx);
        int rowTotal = commentDao.selectRowTotal(map1);

        int totalPage = rowTotal / MyConstant.Comment.BLOCK_LIST;
        if (rowTotal % MyConstant.Comment.BLOCK_LIST != 0)
            totalPage++;
        if (comment_page > totalPage)
            comment_page = totalPage;

        Map<String, String> map = new HashMap<String, String>();

        if (res == 1) {
            // { "result" : "success" }
            map.put("result", "success");
            map.put("comment_page", String.valueOf(comment_page));
        } else {
            map.put("result", "fail");
        }

        return map;
    }

    @RequestMapping("/check_ceo")
    public String check_ceo(Model model) {

        List<MemberVo> ceoList = memberDao.checkingCeoList();
        model.addAttribute("list", ceoList);

        return "manager/man_ceo_checking";
    }


    //숙소 승인 요청 ceo목록
    @RequestMapping("/man_room_check_list")
    public String room_check_list(Model model) {

        List<MemberVo> ceo_acc_n_List = memberDao.selectCeo_acc_state_n_list();
        model.addAttribute("ceo_acc_n_List", ceo_acc_n_List);
        
        return "manager/man_room_check_list";
    }







    @RequestMapping("/approve")
    public String approveCeo(int mem_idx) throws CoolsmsException {

        MemberVo ceo = memberDao.selectByIdx(mem_idx);

        ceo.setMem_state("Y");

        // 메일 전송 시작
        EmailMessage emailMessage = EmailMessage.builder()
                .to(ceo.getMem_email())
                .subject(ceo.getMem_nickname() + " 사의 승인 결과 안내입니다.")
                .build();

        emailService.confirmedMail(emailMessage, mem_idx);
        // 메일 전송 종료

        // sms 전송 시작
        String api_key = "NCSM3THYTSTGQHHC";
        String api_secret = "TPMADJNL20GNVCDHZU3YEV076B0JKJNC";
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();

        params.put("to", ceo.getMem_phone());
        params.put("from", "010-9231-8717");
        params.put("type", "SMS");
        params.put("text", ceo.getMem_nickname() + " 사의 승인 결과가 메일로 발송되었습니다.");

        JSONObject result = coolsms.send(params);

        int res = memberDao.modifyCeo(ceo);

        return "redirect:check_ceo";
    }

    @RequestMapping("/reject")
    //@ResponseBody
    public String rejectCeo(int mem_idx, String rejectmsg) throws CoolsmsException {


        MemberVo ceo = memberDao.selectByIdx(mem_idx);

        // 메일 전송 시작
        EmailMessage emailMessage = EmailMessage.builder()
                .to(ceo.getMem_email())
                .subject(ceo.getMem_nickname() + " 사의 승인 결과 안내입니다.")
                .build();

        emailService.sendMailtoCeo(emailMessage, mem_idx, rejectmsg);
        // 메일 전송 종료

        // sms 전송 시작
        String api_key = "NCSM3THYTSTGQHHC";
        String api_secret = "TPMADJNL20GNVCDHZU3YEV076B0JKJNC";
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();

        params.put("to", ceo.getMem_phone());
        params.put("from", "010-9231-8717");
        params.put("type", "SMS");
        params.put("text", ceo.getMem_nickname() + " 사의 승인 결과가 메일로 발송되었습니다.");

        JSONObject result = coolsms.send(params);

        int res = memberDao.deleteCeo(ceo); // 데이터 삭제

        return  "redirect:check_ceo";
       // return (Map) new HashMap().put("result", true);
    }


    


  @RequestMapping("/man_member_email")
    public String man_member_email(Model model) {

        List<MemberVo> ceoList = memberDao.checkingCeoList();
        model.addAttribute("list", ceoList);

        return "manager/man_member_email";
    }

    
    //회원 CEO에게 이메일 발송
    @RequestMapping("/email")
    //@ResponseBody
    public String email(int mem_idx, String rejectmsg) throws CoolsmsException {


        MemberVo ceo = memberDao.selectByIdx(mem_idx);

        // 메일 전송 시작
        EmailMessage emailMessage = EmailMessage.builder()
                .to(ceo.getMem_email())
                .subject(ceo.getMem_nickname() + " 사의 승인 결과 안내입니다.")
                .build();

        emailService.sendman_mail(emailMessage, mem_idx, rejectmsg);
        // 메일 전송 종료

        // sms 전송 시작
        String api_key = "NCSM3THYTSTGQHHC";
        String api_secret = "TPMADJNL20GNVCDHZU3YEV076B0JKJNC";
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();

        params.put("to", ceo.getMem_phone());
        params.put("from", "010-9231-8717");
        params.put("type", "SMS");
        params.put("text", ceo.getMem_nickname() + " 사의 승인 결과가 메일로 발송되었습니다.");

        JSONObject result = coolsms.send(params);

         // 데이터 삭제

        return  "redirect:check_ceo";
       // return (Map) new HashMap().put("result", true);
    }

}
