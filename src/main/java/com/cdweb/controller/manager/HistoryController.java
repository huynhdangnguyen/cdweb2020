package com.cdweb.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cdweb.model.HistoryModel;
import com.cdweb.service.intf.HistoryService;

@Controller
@RequestMapping("/quan-ly")
public class HistoryController {

	@Autowired
	HistoryService historyService;

	@GetMapping("/lich-su/{offset}/{numItem}")
	@ResponseBody
	public String History(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem){
		List<HistoryModel> historyModels = historyService.findAllHistorySortedByInDate(offset, numItem);
		String s = "";
		for (HistoryModel historyModel : historyModels) {
			s += historyModel.toString() + "\n";
		}
		
		return s;
	}

}
