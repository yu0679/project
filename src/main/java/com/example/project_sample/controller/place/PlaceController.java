package com.example.project_sample.controller.place;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project_sample.dao.place.PlaceDao;
import com.example.project_sample.dao.theme.ThemeDao;
import com.example.project_sample.vo.place.PlaceVo;
import com.example.project_sample.vo.theme.ThemeVo;



@Controller
public class PlaceController {

    @Autowired
    PlaceDao placeDao;
    
    @Autowired
    ThemeDao themeDao;


    //장소추가
    @RequestMapping("/place/location")
    @ResponseBody
    public List<PlaceVo> location(PlaceVo pVo  ){


        String p_name = pVo.getP_name();
        int d_idx = pVo.getD_idx();
        int d_num = pVo.getD_num();
        int b_idx = pVo.getB_idx();


        int mem_idx = pVo.getMem_idx();

        String p_addr = pVo.getP_addr();

        String p_code = pVo.getP_code();

        
        int res = placeDao.insert(pVo);

        List<PlaceVo> resultvo = placeDao.recentData();


        return resultvo;

    }


    @RequestMapping("/place/delete")
    @ResponseBody
	public PlaceVo delete(PlaceVo vo) {
        
        //DB delete
		int res = placeDao.place_delete(vo);

        return vo;
	}


    

}
