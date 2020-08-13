package com.cdweb.api.common;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.model.CustomerModel;
import com.cdweb.service.impl.CustomerServiceImpl;

@Controller
@RequestMapping("/api/khach-hang")
public class CustomerAPI {

	@Autowired
	CustomerServiceImpl customerService;

	@GetMapping("tim-kiem/{offset}/{numItem}/{searchedString}")
	@ResponseBody
	public List<CustomerModel> searchCustomer(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") String searchedString) {
		List<CustomerModel> historyModels = customerService.findAllById(offset, numItem, searchedString);
		return historyModels;
	}

	@DeleteMapping("/xoa")
	@ResponseBody
	public HashMap<String, Boolean> deleteCustomer(@RequestBody CustomerModel customerModel) {
		HashMap<String, Boolean> res = new HashMap<>();
		res.put("message", customerService.detele(customerModel.getId()));
		return res;
	}

	// @DeleteMapping("/xoa")
	// public HashMap<String, Boolean> deleteCustomer(@RequestBody String ids) {
	// HashMap<String, Boolean> res = new HashMap<>();
	// try {
	// res.put("message", customerService.detele(((HashMap<String, String>) new
	// ObjectMapper().readValue(ids,
	// new TypeReference<Map<String, String>>() {})).get("id")));
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// return res;
	// }

	@PostMapping("/them")
	public ModelAndView createCustomer(@Valid @RequestBody CustomerModel customerModel, BindingResult result,
			ModelAndView mav) {
		if (result.hasErrors()) {
			mav.setViewName("common/ajax/customerform");
			mav.addObject("customerModel", customerModel);
			return mav;
		}
		
		mav.setViewName("common/ajax/message");
		mav.addObject("message", "Tạo tài khoản thành công");
		return mav;
	}

}
