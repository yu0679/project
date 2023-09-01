package com.example.project_sample.controller.place;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.place.PlaceDao;
import com.example.project_sample.vo.place.PlaceVo;





@Controller
public class PlaceController {

    PlaceDao placeDao;


    @RequestMapping("/place/location")
    @ResponseBody
    public String location (PlaceVo vo,
                             @RequestParam("p_name") String p_name,
                            @RequestParam("p_addr") String p_addr,
                            @RequestParam("p_lat")  String p_lat,
                            @RequestParam("p_log")  String p_log,
                            Model model
                           )
                           {

        
        vo.setP_name(p_name);
        vo.setP_addr(p_addr);
        vo.setP_lat(p_lat);
        vo.setP_log(p_log);

        placeDao.insert( p_name, p_addr,  p_lat,  p_log);

        System.out.println(p_name);
        System.out.println(p_addr);
        System.out.println(p_lat);
        System.out.println(p_log);

       // System.out.println(res==0);

        model.addAttribute("vo", vo);


        return "feed/feed_insert";
    }
    
    // @RequestMapping("/place/location")
    // @ResponseBody
    // public Object location (@RequestParam("p_name") String p_name,
    //                         @RequestParam("p_addr") String p_addr,
    //                         @RequestParam("p_lat")  String p_lat,
    //                         @RequestParam("p_log")  String p_log
    //                        ){

    //     Map<String,String> map = new HashMap<String,String>();

    //     map.put("p_name", p_name);
    //     map.put("p_addr", p_addr);
    //     map.put("p_lat", p_lat);
    //     map.put("p_log", p_log);

    //     List<PlaceVo> list = placeDao.insert(map);

    //     System.out.println(p_name);
    //     System.out.println(p_addr);
    //     System.out.println(p_lat);
    //     System.out.println(p_log);


    //     return map;
    // }

    

}
