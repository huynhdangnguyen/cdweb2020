package com.cdweb.api.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cdweb.model.HistoryModel;
import com.cdweb.service.intf.HistoryService;

@RestController
@RequestMapping(value = "/api/lich-su")
public class HistoryAPI {
	
	@Autowired
	HistoryService historyService;

	@GetMapping(value = "/hinh-anh/{id}/{imageName}", produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] getImageInOut(@PathVariable("id") long id, @PathVariable("imageName") String imageName) {
		return historyService.getImage(id, imageName);
	}

	@GetMapping(value = "/tim-kiem/{offset}/{numItem}/{searchedString}")
	public List<HistoryModel> searchHistory(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") String searchedString) {
		List<HistoryModel> historyModels = historyService.findAllHistoryByIdRentDetailOrIdCustomer(offset, numItem,
				searchedString);
		return historyModels;
	}

	@GetMapping(value = "/chi-tiet/{id}")
	public HistoryModel viewDetailHistory(@PathVariable("id") Long id) {
		HistoryModel historyModel = historyService.getOne(id);
		return historyModel;
	}

}
