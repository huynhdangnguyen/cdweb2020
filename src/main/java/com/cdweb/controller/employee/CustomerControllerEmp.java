package com.cdweb.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cdweb.model.HistoryModel;
import com.cdweb.model.VehicleModel;
import com.cdweb.service.impl.HistoryServiceImpl;
import com.cdweb.service.impl.VehicleServiceImpl;
import com.cdweb.service.intf.HistoryService;

@Controller
@RequestMapping("/nhan-vien")
public class CustomerControllerEmp {
	
	@Autowired
	HistoryService historyService;
	
	@RequestMapping(value = "/khach-hang")
	public String Home(Model model) {
//		HistoryModel historyModel = new HistoryModel();
//		historyModel.setPlateNo("59-P166480");
//		historyService.saveHistory(historyModel);
		return "common/customer";
	}
}
