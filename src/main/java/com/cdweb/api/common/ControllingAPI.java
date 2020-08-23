package com.cdweb.api.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.method.P;
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
	public HistoryModel checkInforIn(@RequestBody byte[] image, @PathVariable("idCardIn") String idCardIn) {
		HistoryModel historyModel = controllingService.getLastHistoryByRentDetailEntity(Long.parseLong(idCardIn));

		historyModel.setPlateInImage(null);
		
		SystemConstant.plateOutImage = historyModel.getPlateOutImage();
		historyModel.setPlateOutImage(null);
		
		RentDetailModel rentDetailModel = controllingService.saveHistoryIn(idCardIn, image);
		historyModel.setRentDetailModel(rentDetailModel);
		
		return historyModel;
	}

	@PostMapping("/kiem-soat-xe-ra/{idCardOut}")
	@ResponseBody
	public HistoryModel checkInforOut(@RequestBody byte[] image, @PathVariable("idCardOut") String idCardOut) {
		HistoryModel historyModel = controllingService.getLastHistoryByRentDetailEntity(Long.parseLong(idCardOut));

		SystemConstant.plateInImage = historyModel.getPlateInImage();
		historyModel.setPlateInImage(null);
		
		historyModel.setPlateOutImage(null);
		
		historyModel = controllingService.saveHistoryOut(idCardOut, image);
		return historyModel;
	}

	@GetMapping(value = "/hinh-anh/{typeImage}")
	@ResponseBody()
	public byte[] image(@PathVariable("typeImage") String typeImage) {
		typeImage = typeImage.toLowerCase();
		if (typeImage.equals("plateinimage"))
			return SystemConstant.plateInImage;
		else
			return SystemConstant.plateOutImage;
	}

}
