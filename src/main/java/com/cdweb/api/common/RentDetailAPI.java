package com.cdweb.api.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.constant.SystemConstant;
import com.cdweb.model.RentDetailModel;
import com.cdweb.service.intf.RentDetailService;

@Controller
@RequestMapping("/api/chi-tiet-thue")
public class RentDetailAPI {
	
	@Autowired
	RentDetailService rentDetailService;
	
	@GetMapping("tim-kiem/{offset}/{numItem}/{searchedString}")
	@ResponseBody
	public List<RentDetailModel> searchRentDetail(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") String searchedString) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<RentDetailModel> rentDetailModels = rentDetailService.findAllByPlateNoOrCustomerId(offset, numItem, searchedString);
		response.put("rentDetailModels", rentDetailModels);
		response.put("pageNumber", SystemConstant.pageNumber);
		return rentDetailModels;
	}
	

	@DeleteMapping("/xoa")
	@ResponseBody
	public HashMap<String, Boolean> deleteRentDetail(@RequestBody RentDetailModel rentDetailModel) {
		HashMap<String, Boolean> res = new HashMap<>();
		res.put("message", rentDetailService.detele(rentDetailModel.getId()));
		return res;
	}


	@GetMapping(value = "/chi-tiet/{id}")
	@ResponseBody
	public RentDetailModel viewDetailCustomer(@PathVariable("id") String id) {
		RentDetailModel rentDetailModel = rentDetailService.getOne(id);
		return rentDetailModel;
	}

	@PutMapping(value = "/chinh-sua")
	public ModelAndView modifyRentDetail(@Valid @RequestBody RentDetailModel rentDetailModel, BindingResult result,
			ModelAndView mav) {
		if (result.hasErrors()) {
			mav.setViewName("common/ajax/rentdetailmodifyingform");
			mav.addObject("rentDetailModel", rentDetailModel);
			return mav;
		}
		Boolean res = rentDetailService.modifyRentDetail(rentDetailModel);
		mav.setViewName("common/ajax/message");
		mav.addObject("message", res ? "Chỉnh sửa thẻ thành công" : "Chỉnh sửa thẻ thất bại");
		return mav;
	}
	
}
