package com.cdweb.api.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.hibernate.validator.constraints.pl.REGON;
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
	public ModelAndView searchRentDetail(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") String searchedString, ModelAndView mav) {
		List<RentDetailModel> rentDetailModels = rentDetailService.findAllByPlateNoOrCustomerId(offset, numItem, searchedString);
		if(rentDetailModels == null || rentDetailModels.size() == 0) {
			mav.addObject("message", "Không tìm thấy kết quả phù hợp");
			mav.setViewName("common/ajax/message");
			return mav;
		}
		mav.addObject("rentDetailModels", rentDetailModels);
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.addObject("searchedString", searchedString);
		mav.setViewName("common/ajax/rentdetailsearchedtable");
		return mav;
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
	@ResponseBody
	public Map<String, String> modifyRentDetail(@RequestBody RentDetailModel rentDetailModel, BindingResult result,
			ModelAndView mav) {
		Boolean res = rentDetailService.modifyRentDetail(rentDetailModel);
		Map<String, String> response = new HashMap<String, String>();
		response.put("result", res + "");
		return response;
	}
	
}
