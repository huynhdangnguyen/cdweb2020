package com.cdweb.api.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
@RequestMapping(value = "/api/lich-su")
public class HistoryAPI {
	
	@Autowired
	HistoryService historyService;

	@GetMapping(value = "/hinh-anh/{id}/{imageName}")
	@ResponseBody
	public byte[] getImageInOut(@PathVariable("id") long id, @PathVariable("imageName") String imageName) {
		return historyService.getImage(id, imageName);
	}

	@GetMapping(value = "/tim-kiem/{offset}/{numItem}/{searchedString}")
	public ModelAndView searchHistory(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") String searchedString, ModelAndView mav) {
		List<HistoryModel> historyModels = historyService.findAllHistoryByPlateNoOrIdCustomer(offset, numItem,
				searchedString);
		if(historyModels == null || historyModels.size() == 0) {
			mav.addObject("message", "Không tìm thấy kết quả phù hợp");
			mav.setViewName("common/ajax/message");
			return mav;
		}
		mav.addObject("historyModels", historyModels);
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.addObject("searchedString", searchedString);
		mav.setViewName("common/ajax/historysearchedtable");
		return mav;
	}

	@GetMapping(value = "/chi-tiet/{id}")
	@ResponseBody
	public HistoryModel viewDetailHistory(@PathVariable("id") Long id) {
		HistoryModel historyModel = historyService.getOne(id);
		return historyModel;
	}
	
	

}
