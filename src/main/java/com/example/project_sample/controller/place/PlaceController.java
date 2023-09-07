package com.example.project_sample.controller.place;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.place.PlaceDao;
import com.example.project_sample.vo.place.PlaceVo;



@Controller
public class PlaceController {

    @Autowired
    PlaceDao placeDao;


    //장소추가
    @RequestMapping("/place/location")
    @ResponseBody
    public PlaceVo location(PlaceVo vo){

        int d_idx = vo.getD_idx();

        int mem_idx = vo.getMem_idx();

        //System.out.println(mem_idx);

        String p_addr = vo.getP_addr().substring(0, 2);
        
        int res = placeDao.insert(vo);

        PlaceVo resultvo = placeDao.recentData();


        //System.out.println(resultvo.getD_idx());

        return resultvo;

    }

    // //장소추가
    // @RequestMapping("/place/location")
    // @ResponseBody
    // public PlaceVo location(@RequestParam("p_name") String p_name,
    //                        @RequestParam("p_addr") String p_addr,
    //                        @RequestParam("p_lat")  String p_lat,
    //                        @RequestParam("p_log")  String p_log,
    //                        @RequestParam("mem_idx")int mem_idx
                          
                           
    //                        )
    //     {

    //     p_addr = p_addr.substring(0, 2);

    //     Map<String,String> map = new HashMap<String,String>();

    //     map.put("p_name", p_name);
    //     map.put("p_addr", p_addr);
    //     map.put("p_lat", p_lat);
    //     map.put("p_log", p_log);


        
    //     //장소 추가
    //     int res = placeDao.insert(map);
        
    //     //최근 추가한 장소(p_idx) 
    //     PlaceVo vo = placeDao.recentData();
    //     //System.out.println(p_addr);
        
        
    //     List<String,Object> list = new ArrayList<String,Object>(vo);
        
    //     return vo;

    // }


   
    @RequestMapping("/place/delete")
    @ResponseBody
	public Map<String,String> delete(@RequestParam(name="p_idx") int p_idx) {
        
        System.out.println(p_idx);
        //DB delete
		int res = placeDao.place_delete(p_idx);

        Map<String,String> map = new HashMap<String,String>();

        return map;
	}


    

}
