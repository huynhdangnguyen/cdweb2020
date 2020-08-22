package com.cdweb.api.common;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cdweb.constant.SystemConstant;
import com.cdweb.model.HistoryModel;
import com.cdweb.model.RentDetailModel;
import com.cdweb.service.intf.ControllingService;
import com.cdweb.service.intf.HistoryService;
import com.cdweb.service.intf.RentDetailService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/api/kiem-soat")
public class ControllingAPI {

	@Autowired
	RentDetailService rentDetailService;
	
	@Autowired
	HistoryService HistoryService;
	
	@Autowired
	ControllingService controllingService;
	
	
	@PostMapping("/kiem-soat-xe-vao/{idCardIn}")
	@ResponseBody
	public String checkInforIn(@RequestBody byte[] map, @PathVariable("idCardIn") String idCardIn) {
		System.out.println("hello");
		System.out.println(map);
		System.out.println(idCardIn);
		RentDetailModel rentDetailModel = controllingService.saveHistoryIn(idCardIn, map);
		return "123456";
	}
	
	@GetMapping("/hinh-anh")
	@ResponseBody
	public byte[] image() {
		return SystemConstant.bytes;
	}
	

}
