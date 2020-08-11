package com.cdweb.controller.manager;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.entity.VehicleEntity;
import com.cdweb.model.HistoryModel;
import com.cdweb.model.MyUserModel;
import com.cdweb.model.UserModel;
import com.cdweb.model.VehicleModel;
import com.cdweb.repository.intf.HistoryRepository;
import com.cdweb.service.impl.HistoryServiceImpl;
import com.cdweb.util.ImageUtils;
import com.cdweb.util.SecurityUtils;
import com.sun.imageio.plugins.common.ImageUtil;

@Controller
@RequestMapping("/quan-ly")
public class CustomerControllerMan {
	
//	@Autowired
//	HistoryServiceImpl historyServiceImpl;
	
	@GetMapping("/khach-hang")
	public ModelAndView Home() {
//		File file = new File("D:\\study\\19-20 hk2\\cdhttt\\workspace\\PlateDetection\\GreenParking\\0000_00532_b.jpg");
//		HistoryModel historyModel = new HistoryModel();
//		historyModel.setPlateInImage(ImageUtils.convert(file));
//		historyModel.setPlateNo("59-P166480");
//		HistoryModel historyModel2 = new HistoryModel();
//		historyModel2 = historyServiceImpl.saveHistory(historyModel);
//		System.out.println(historyModel2.toString());
//		ImageUtils.convert(historyModel2.getPlateInImage(), "D:\\0000_00532_b.jpg");
		return new ModelAndView("common/customer");
	}
	
	@GetMapping("/Vehicle")
	public ModelAndView VehicleView(ModelAndView modelAndView) {
		modelAndView.setViewName("manager/vehicle");
		return modelAndView;
	}
}
