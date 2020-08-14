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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.model.CustomerModel;
import com.cdweb.model.HistoryModel;
import com.cdweb.service.impl.CustomerServiceImpl;
import com.cdweb.service.intf.CustomerService;

@Controller
@RequestMapping("/api/khach-hang")
public class CustomerAPI {

	@Autowired
	CustomerService customerService;

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
			mav.setViewName("common/ajax/customercreatingform");
			mav.addObject("customerModel", customerModel);
			return mav;
		}
		Boolean res = customerService.saveCustomer(customerModel);
		mav.setViewName("common/ajax/message");
		mav.addObject("message", res ? "Tạo tài khoản thành công" : "Tạo tài khoản thất bại");
		return mav;
	}

	@GetMapping(value = "/chi-tiet/{id}")
	@ResponseBody
	public CustomerModel viewDetailCustomer(@PathVariable("id") String id) {
		CustomerModel customerModel = customerService.getOne(id);
		return customerModel;
	}

	@PutMapping(value = "/chinh-sua")
	public ModelAndView modifyCustomer(@Valid @RequestBody CustomerModel customerModel, BindingResult result,
			ModelAndView mav) {
		if (result.hasErrors()) {
			mav.setViewName("common/ajax/customermodifyingform");
			mav.addObject("customerModel", customerModel);
			return mav;
		}
		Boolean res = customerService.modifyCustomer(customerModel);
		mav.setViewName("common/ajax/message");
		mav.addObject("message", res ? "Chỉnh sửa tài khoản thành công" : "Chỉnh sửa tài khoản thất bại");
		return mav;
	}

}
