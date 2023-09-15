package com.example.project_sample.controller.payment;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project_sample.service.KakaoPay;
import com.example.project_sample.vo.accommodation.RoomVo;

import lombok.Setter;
import lombok.extern.java.Log;


@Log
@Controller
public class PaymentController {
    


    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @RequestMapping("/payment")
    public String payment(RoomVo vo) {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady(vo);
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);

        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        
        return "payment/kakaoPaySuccess";
    }
    

}