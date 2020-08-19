package com.cdweb.controller.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.service.intf.StatisticService;

@RequestMapping("/quan-ly")
@Controller
public class StatisticControllerMan {

	@Autowired
	StatisticService statisticService;
	
	@GetMapping("/thong-ke/{startDay}/{endDay}")
	public ModelAndView viewStatistic(@PathVariable("startDay") String startDay, @PathVariable("endDay") String endDay, ModelAndView mav) {
		mav.setViewName("manager/statistic");
		mav.addObject("listIncome", statisticService.getIncome(startDay, endDay));
		return mav;
	}
}
