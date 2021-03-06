package com.cdweb.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.constant.SystemConstant;
import com.cdweb.model.HistoryModel;
import com.cdweb.service.intf.HistoryService;

@Controller
@RequestMapping("/nhan-vien/lich-su")
public class HistoryControllerEmp {

	@Autowired
	HistoryService historyService;

	@GetMapping("/{offset}/{numItem}")
	public ModelAndView history(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem, ModelAndView mav){
		mav.addObject("historyModels", historyService.findAllHistorySortedByInDate(offset, numItem));
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.setViewName("common/history");
		return mav;
	}
}
