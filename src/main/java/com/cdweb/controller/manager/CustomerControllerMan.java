package com.cdweb.controller.manager;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.VehicleEntity;
import com.cdweb.model.HistoryModel;
import com.cdweb.model.MyUserModel;
import com.cdweb.model.UserModel;
import com.cdweb.model.VehicleModel;
import com.cdweb.repository.intf.HistoryRepository;
import com.cdweb.service.impl.CustomerServiceImpl;
import com.cdweb.service.impl.HistoryServiceImpl;
import com.cdweb.service.intf.CustomerService;
import com.cdweb.util.ImageUtils;
import com.cdweb.util.SecurityUtils;
import com.sun.imageio.plugins.common.ImageUtil;

@Controller
@RequestMapping("/quan-ly/khach-hang")
public class CustomerControllerMan {

	@Autowired
	CustomerService customerService;

	@GetMapping("/{offset}/{numItem}")
	public ModelAndView customer(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem, ModelAndView mav) {
		mav.addObject("customerModels", customerService.findAllByStatus(offset, numItem));
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.setViewName("common/customer");
		return mav;
	}

}
