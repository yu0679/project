package com.example.project_sample.controller.place;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project_sample.dao.place.PlaceDao;
import com.example.project_sample.vo.place.PlaceVo;



@Controller
public class PlaceController {

    PlaceDao placeDao;


    @RequestMapping("place/location")
    public String location(@RequestParam("location_names") String p_name,
                                       @RequestParam("addr_name") String p_addr, Model model){



     Map<String,Object> map = new HashMap<String,Object>();
     map.put("p_name", p_name);
     map.put("p_addr", p_addr);

     List<PlaceVo> list = placeDao.selectList(map);

     model.addAttribute("list",list);




        return "/feed/feed_insert";
    }

    

}
