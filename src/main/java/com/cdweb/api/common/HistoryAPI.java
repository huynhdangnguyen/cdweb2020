package com.cdweb.api.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cdweb.model.HistoryModel;
import com.cdweb.service.impl.HistoryServiceImpl;

@Controller
@RequestMapping(value = "/api")
public class HistoryAPI {
	@Autowired
	HistoryServiceImpl historyServiceImpl;
	
	@GetMapping(value = "/lich-su/hinh-anh/{id}/{imageName}", produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] getImageInOut(@PathVariable("id") long id,@PathVariable("imageName") String imageName){
		return historyServiceImpl.getImage(id, imageName);
	}
	
	@GetMapping(value = "/lich-su/tim-kiem/{offset}/{numItem}/{searchedString}")
	@ResponseBody
	public String searchHistory(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem, @PathVariable String searchedString) {
		List<HistoryModel> historyModels = historyServiceImpl.findAllHistoryByIdRentDetailOrIdCustomer(offset, numItem, searchedString);
		String s = "";
		for (HistoryModel historyModel : historyModels) {
			s += historyModel.toString() + "\n";
		}
		return s;
	}
	
	@GetMapping(value = "/lich-su/chi-tiet/{id}")
	@ResponseBody
	public String viewDetailHistory(@PathVariable("id") Long id) {
		HistoryModel historyModel = historyServiceImpl.getOne(id);
		return historyModel.toString();
	}
	
}
