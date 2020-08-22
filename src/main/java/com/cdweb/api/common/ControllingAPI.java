package com.cdweb.api.common;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
	public RentDetailModel checkInforIn(@RequestBody byte[] image, @PathVariable("idCardIn") String idCardIn) {
		RentDetailModel rentDetailModel = controllingService.saveHistoryIn(idCardIn, image);
		return rentDetailModel;
	}
	
	@PostMapping("/kiem-soat-xe-ra/{idCardOut}")
	@ResponseBody
	public RentDetailModel checkInforOut(@RequestBody byte[] image, @PathVariable("idCardOut") String idCardOut) {
		RentDetailModel rentDetailModel = controllingService.saveHistoryOut(idCardOut, image);
		return rentDetailModel;
	}
	
	@GetMapping(value = "/hinh-anh/{idCardIn}")
	@ResponseBody()
	public byte[] image() {
		return SystemConstant.bytes;
	}
	

}
