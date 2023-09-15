package com.example.project_sample.controller.accommodation;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.project_sample.dao.accommodation.AccDao;
import com.example.project_sample.dao.accommodation.Acc_PhotoDao;
import com.example.project_sample.dao.accommodation.RoomDao;
import com.example.project_sample.vo.accommodation.AccVo;
import com.example.project_sample.vo.accommodation.Acc_PhotoVo;
import com.example.project_sample.vo.accommodation.RoomVo;
import com.example.project_sample.vo.accommodation.Room_PhotoVo;
import com.example.project_sample.vo.member.MemberVo;




@Controller
public class AccommodationController {

    @Autowired
    HttpSession session;

    @Autowired
    ServletContext application;

    @Autowired
    AccDao accDao;

    @Autowired
    RoomDao roomDao;

    @Autowired
    Acc_PhotoDao acc_PhotoDao;

    @RequestMapping("/acc_insert.do")
    public String acc_insert(
            AccVo vo,
            @RequestParam("acc_photo_name") MultipartFile[] photo_array,
            RedirectAttributes ra, Model model) throws IllegalStateException, IOException {

        // 로그인 유저정보 구하기
        MemberVo user = (MemberVo) session.getAttribute("user");

        // 로그아웃된 상태면
        if (user == null) {

            ra.addAttribute("reason", "fail_session_timeout");
            // login_form.do?reason=fail_session_timeout
            return "redirect:../member/login_form.do";
        }

        vo.setMem_idx(user.getMem_idx());

        System.out.println(vo.getMem_idx());

        // 1.숙소등록정보->숙소등록:DB insert
        int res = accDao.insert(vo);
        if (res == 0) {
        }

        // 2.등록된 숙소 acc_idx
        // 현재 추가된 acc_idx 얻어오기
        int acc_idx = accDao.selectMaxIdx();

        // 3.여러개 이미지 등록
        String web_path = "/images/";
        String abs_path = application.getRealPath(web_path);
        // Acc_PhotoVo phovo = phovo.setAcc_idx(acc_idx);

        for (int i = 0; i < photo_array.length; i++) {
            // for(MultipartFile photo : photo_array){

            MultipartFile photo = photo_array[i];

            // Acc_PhotoVo phovo = phovo.setAcc_photo_main(0);

            // 1개화일 업로드
            if (photo.isEmpty() == false) {// 업로드화일 존재하면
                // 임시화일이름
                String filename = photo.getOriginalFilename();
                // 저장화일정보
                File f = new File(abs_path, filename);

                if (f.exists()) {// 동일화일 존재하면

                    long tm = System.currentTimeMillis();
                    // 화일명 => 시간_화일명
                    filename = String.format("%d_%s", tm, filename);
                    f = new File(abs_path, filename);
                }

                // 임시파일->f로 복사
                photo.transferTo(f);

                // 첫번째 업로드화일 : 기본이미지로 ....
                // 사진등록 DB insert
                // pp_idx filename acc_idx dis
                // 5 1 <= i==0
                // 5 0
                // 5 0

                Acc_PhotoVo photoVo = new Acc_PhotoVo();
                photoVo.setAcc_photo_name(filename);
                photoVo.setAcc_idx(acc_idx);

                if (i == 0) {
                    photoVo.setAcc_photo_main(1);
                }

                // Photo정보 insert
                res = acc_PhotoDao.insert(photoVo);


            } // end-if

        } // end-for

        /*model통해서 Data DispatcherServlet에게 전달
       // DS는 전달받은 Data를 request binding시킨다
        model.addAttribute("acc_name", vo.acc_name);
        model.addAttribute("acc_location", vo.acc_location);
        model.addAttribute("acc_service", vo.acc_service);
        model.addAttribute("acc_type", vo.acc_type);
        model.addAttribute("acc_cancel", vo.acc_photo_name);
        model.addAttribute("acc_contact", vo.acc_contact);
        model.addAttribute("filename_list", filename_list);*/

        return "redirect:acc_list.do";  //redirect는 이 페이지에 정보는 뿌려주지 않는 것. 그냥 정보는  db에 저장한 뒤 저 페이지로 가는 것. 
    }

    @RequestMapping("/acc_list.do")
    public String acc_list( Model model, RedirectAttributes ra){

        MemberVo user = (MemberVo) session.getAttribute("user");

         //로그아웃된 상태면
         if(user==null){
            
            ra.addAttribute("reason","fail_session_timeout");
            //login_form.do?reason=fail_session_timeout 
            return "redirect:../member/login_form.do";
        }

        int mem_idx = user.getMem_idx();

        List<AccVo> list = accDao.selectList(mem_idx);

        for(AccVo vo : list){

            System.out.println(vo.getAcc_name());

            for(Acc_PhotoVo photo: vo.getAcc_photo_list()){
                System.out.println("        "+ photo.getAcc_photo_name());
            }

        }



        model.addAttribute("list",list);

        return "accommodation/accommodation_list";
    }


 

    
    @RequestMapping("/ceopage")
    public String ceopage(){



        return "/payment/ceopage";
	
    }

    

 @RequestMapping("/button.do")
 public String button(){

    return "accommodation/button";
 }


  @RequestMapping("/ceo_acc_detail.do")
  public String ceo_acc_detail(int acc_idx,Model model){

    AccVo vo = accDao.selectOne(acc_idx);

    model.addAttribute("vo", vo);

    return "ceo/ceo_acc_detail";
  }


  @RequestMapping("/ceo_acc_modify_form.do")
  public String ceo_acc_modify_form(int acc_idx,Model model){

    AccVo vo = accDao.selectOne(acc_idx);

    model.addAttribute("vo", vo);

    return "ceo/ceo_acc_modify_form";
  }

  @RequestMapping("/delete.do")
    public String delete(int acc_idx){

        int res = accDao.delete(acc_idx);

        if (res==0){};

        return "redirect:acc_list.do";
    }






}
