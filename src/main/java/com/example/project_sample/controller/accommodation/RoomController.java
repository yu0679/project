package com.example.project_sample.controller.accommodation;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.example.project_sample.dao.accommodation.RoomDao;
import com.example.project_sample.dao.accommodation.Room_PhotoDao;
import com.example.project_sample.vo.accommodation.AccVo;
import com.example.project_sample.vo.accommodation.RoomVo;
import com.example.project_sample.vo.accommodation.Room_PhotoVo;
import com.example.project_sample.vo.member.MemberVo;

@Controller
@RequestMapping("/room/")
public class RoomController {

    @Autowired
    HttpSession session;

    @Autowired
    ServletContext application;

    @Autowired
    RoomDao roomDao;

    @Autowired
    Room_PhotoDao room_PhotoDao;

    @Autowired
    AccDao accDao;



    @RequestMapping("room_insert_form.do")
    public String room_insert_form(int acc_idx){

        return "ceo/room_insert_form";
    }

    
    @RequestMapping("room_insert.do")
    public String room_insert(
            RoomVo vo,
            @RequestParam("room_photo_name") MultipartFile[] photo_array,
            RedirectAttributes ra, Model model) throws IllegalStateException, IOException {

        // 로그인 유저정보 구하기
        MemberVo user = (MemberVo) session.getAttribute("user");

        // 로그아웃된 상태면
        if (user == null) {

            ra.addAttribute("reason", "fail_session_timeout");
            // login_form.do?reason=fail_session_timeout
            return "redirect:../member/login_form.do";
        }

        System.out.println(vo.getAcc_idx());


        // 1.숙소등록정보->숙소등록:DB insert
        int res = roomDao.roominsert(vo);
        if (res == 0) {
        }

        // 2.등록된 숙소 acc_idx
        // 현재 추가된 acc_idx 얻어오기
        int room_idx= roomDao.selectMaxIdx();

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

                Room_PhotoVo photoVo = new Room_PhotoVo();
                photoVo.setRoom_photo_name(filename);
                photoVo.setRoom_idx(room_idx);

                if (i == 0) {
                    photoVo.setRoom_photo_main(1);
                }

              System.out.println(photoVo.getRoom_photo_main());

                // Photo정보 insert
                res = room_PhotoDao.room_photo_insert(photoVo);


            } // end-if

        } // end-for

            // int acc_idx = vo.getAcc_idx();
            // List<RoomVo> list = roomDao.selectList(acc_idx);
             
       //model.addAttribute("acc_idx", vo.getAcc_idx());
       ra.addAttribute("acc_idx", vo.getAcc_idx());

        /*model통해서 Data DispatcherServlet에게 전달
        DS는 전달받은 Data를 request binding시킨다
        model.addAttribute("acc_name", vo.acc_name);
        model.addAttribute("acc_location", vo.acc_location);
        model.addAttribute("acc_service", vo.acc_service);
        model.addAttribute("acc_type", vo.acc_type);
        model.addAttribute("acc_cancel", vo.acc_photo_name);
        model.addAttribute("acc_contact", vo.acc_contact);
        model.addAttribute("filename_list", filename_list);*/

        return "redirect:room_list.do";  //redirect는 이 페이지에 정보는 뿌려주지 않는 것. 그냥 정보는  db에 저장한 뒤 저 페이지로 가는 것. 
    }

    @RequestMapping("room_list.do")
    public String room_list( int acc_idx, Model model){


        List<RoomVo> list = roomDao.selectRoomList(acc_idx);

        for(RoomVo vo : list){

            System.out.println(vo.getRoom_name());

            for(Room_PhotoVo photo: vo.getRoom_photo_list()){
                System.out.println("        "+ photo.getRoom_photo_name());
            }

        }



        model.addAttribute("list",list);

        return "ceo/ceo_room_list";

    }


    @RequestMapping("/ceo_room_detail.do")
    public String ceo_room_detail(int room_idx,Model model){
  
      RoomVo vo = roomDao.selectRoomOne(room_idx);
  
      model.addAttribute("vo", vo);
  
      return "ceo/ceo_room_detail";
    }
  


      @RequestMapping("book_acc_list.do")
    public String book_acc_list( String acc_location, String check_in_date, Model model){

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("room_check_in", check_in_date);
        map.put("acc_location", acc_location);

        String [] addr = acc_location.split(" ");

        // addr[0] : 서울시
        // addr[1] : 관악구

        map.put("sido", addr[0]);
        map.put("gu", addr[1]);


        List<AccVo> accList = accDao.selectBookAccOne(map);

        System.out.println("--------------------------------------");
        for(AccVo vo : accList){
            System.out.println(vo);
        }
        System.out.println("--------------------------------------");
            


        // int acc_idx= vo.getAcc_idx();

        // List<RoomVo> list = roomDao.selectRoomList(acc_idx);

        // for(RoomVo roomVo : list){

        //     System.out.println(roomVo.getRoom_name());

        //     for(Room_PhotoVo photo: roomVo.getRoom_photo_list()){
        //         System.out.println("        "+ photo.getRoom_photo_name());
        //     }

        // }


        model.addAttribute("list",accList);




        return "accommodation/book_acc_list";
    }


    @RequestMapping("book_acc_detail.do")
    public String book_acc_detail(int acc_idx, Model model){
  
       AccVo vo = accDao.selectOne(acc_idx);
       
      System.out.println("----------------------------------------------------------");
      System.out.println(acc_idx);
       System.out.println(vo.getAcc_idx());
        System.out.println("----------------------------------------------------------");
  
      model.addAttribute("vo", vo);
  
  
      return "accommodation/book_acc_detail";
  
  
    }

    @RequestMapping("book_room_list.do")
    public String book_room_list(int acc_idx, String check_in_date, Model model) {
  
    //   List<RoomVo> list = roomDao.selectRoomList(acc_idx);
  
    //       for(RoomVo vo : list){
  
    //           System.out.println(vo.getRoom_name());
  
    //           for(Room_PhotoVo photo: vo.getRoom_photo_list()){
    //               System.out.println("        "+ photo.getRoom_photo_name());
    //           }
  
    //      }

          Map<String,Object> map = new HashMap<String, Object>();
          map.put("acc_idx", acc_idx);
          map.put("check_in_date", check_in_date);
          List<RoomVo> list = roomDao.resvRoomList(map);

          

        //  model.addAttribute("list",list);
          model.addAttribute("list", list);
  
        return "accommodation/book_room_list";
    }
    

    @RequestMapping("book_room_detail.do")
    public String book_room_detail(int room_idx,Model model){
  
      RoomVo vo = roomDao.selectRoomOne(room_idx);
  
      model.addAttribute("vo", vo);
  
      return "accommodation/book_room_detail";
    }



}

