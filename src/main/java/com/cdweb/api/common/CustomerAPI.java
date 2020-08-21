package com.cdweb.api.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
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

import com.cdweb.constant.SystemConstant;
import com.cdweb.model.CustomerModel;
import com.cdweb.model.RentDetailModel;
import com.cdweb.service.impl.CustomerServiceImpl;
import com.cdweb.service.intf.CustomerService;

@Controller
@RequestMapping("/api/khach-hang")
public class CustomerAPI {

	@Autowired
	CustomerService customerService;

	@GetMapping("tim-kiem/{offset}/{numItem}/{searchedString}")
	@ResponseBody
	public ModelAndView searchCustomer(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") String searchedString, ModelAndView mav) {
		List<CustomerModel> customerModels = customerService.findAllByIdAndStatus(offset, numItem, searchedString);
		if (customerModels == null || customerModels.size() == 0) {
			mav.addObject("message", "Không tìm thấy kết quả phù hợp");
			mav.setViewName("common/ajax/message");
			return mav;
		}
		mav.addObject("customerModels", customerModels);
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.addObject("searchedString", searchedString);
		mav.setViewName("common/ajax/customersearchedtable");
		return mav;
	}

	@DeleteMapping("/xoa")
	@ResponseBody
	public HashMap<String, Boolean> deleteCustomer(@RequestBody CustomerModel customerModel) {
		HashMap<String, Boolean> res = new HashMap<>();
		res.put("message", customerService.detele(customerModel.getId()));
		return res;
	}

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
		mav.addObject("message", res ? "Tạo khách hàng thành công" : "Tạo khách hàng thất bại");
		return mav;
	}

	@GetMapping(value = "/chi-tiet/{id}")
	@ResponseBody
	public ModelAndView viewDetailCustomer(@PathVariable("id") String id, ModelAndView mav) {

		CustomerModel customerModel = customerService.getOne(id);
		mav.addObject("customerModel", customerModel);
		mav.addObject("listRentDetail", customerModel.getListRentDetail());
		mav.setViewName("common/ajax/cusDetailForm");
		return mav;
	}

	@PostMapping(value = "/chinh-sua")
	public ModelAndView modifyCustomer(@Valid @RequestBody CustomerModel customerModel, BindingResult result,
			ModelAndView mav) {
		if (result.hasErrors()) {
			System.out.println("error in API");
			mav.setViewName("common/ajax/customermodifyingform");
			mav.addObject("customerModel", customerModel);
			return mav;
		}
		Boolean res = customerService.modifyCustomer(customerModel);
		mav.setViewName("common/ajax/message");
		mav.addObject("message", res ? "Chỉnh sửa tài khoản thành công" : "Chỉnh sửa tài khoản thất bại");
		System.out.println("success in API");
		System.out.println(res);
		return mav;
	}

}
