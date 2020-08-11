package com.cdweb.api.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cdweb.model.CustomerModel;
import com.cdweb.service.impl.CustomerServiceImpl;

@RestController
@RequestMapping("/api/khach-hang")
public class CustomerAPI {

	@Autowired
	CustomerServiceImpl customerService;

	@RequestMapping("tim-kiem/{offset}/{numItem}/{searchedString}")
	public List<CustomerModel> searchHistory(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") String searchedString) {
		List<CustomerModel> historyModels = customerService.findAllById(offset, numItem, searchedString);
		return historyModels;
	}

}
