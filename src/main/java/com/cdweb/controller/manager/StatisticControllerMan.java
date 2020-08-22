package com.cdweb.controller.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.service.impl.StatisticServiceImpl;
import com.cdweb.service.intf.StatisticService;

@RequestMapping("/quan-ly")
@Controller
public class StatisticControllerMan {

	@Autowired
	StatisticServiceImpl statisticService;

	@GetMapping("/thong-ke/{startDay}/{endDay}")
	public ModelAndView viewStatistic(@PathVariable("startDay") String startDay, @PathVariable("endDay") String endDay,
			ModelAndView mav) {
		System.out.println(startDay + endDay);
		mav.setViewName("manager/statistic");
		statisticService.getIncome(startDay, endDay);
		mav.addObject("listDays", StatisticServiceImpl.days);
		mav.addObject("listIncomes", StatisticServiceImpl.incomes);
		mav.addObject("startDate", StatisticServiceImpl.startDate);
		mav.addObject("endDate", StatisticServiceImpl.endDate);
		mav.addObject("startDate2", StatisticServiceImpl.startDate2);
		mav.addObject("endDate2", StatisticServiceImpl.endDate2);
		return mav;
	}
}
