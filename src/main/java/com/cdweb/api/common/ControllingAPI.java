package com.cdweb.api.common;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cdweb.constant.SystemConstant;
import com.cdweb.model.HistoryModel;
import com.cdweb.service.intf.RentDetailService;

@Controller
@RequestMapping("/api/kiem-soat")
public class ControllingAPI {

	@Autowired
	RentDetailService rentDetailService;
	
	
	
	@GetMapping("/kiem-soat-xe-vao")
	@ResponseBody
	public Long checkInforIn(@RequestBody HistoryModel historyModel) {
		SystemConstant.bytes = historyModel.getPlateInImage();
		System.out.println(historyModel.getRentDetailModel().getId());
		return historyModel.getRentDetailModel().getId();
	}
	
	@GetMapping("/hinh-anh")
	@ResponseBody
	public byte[] image() {
		return SystemConstant.bytes;
	}
	

}
