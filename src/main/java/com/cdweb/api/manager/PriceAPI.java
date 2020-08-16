package com.cdweb.api.manager;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.model.PriceModel;
import com.cdweb.model.RentDetailModel;
import com.cdweb.service.intf.PriceService;

@Controller
@RequestMapping("/api/gia")
public class PriceAPI {
	
	@Autowired
	PriceService priceService;
	
	@GetMapping("tim-kiem/{offset}/{numItem}/{searchedString}")
	@ResponseBody
	public List<PriceModel> searchPrice(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") Long searchedString) {
		List<PriceModel> priceModels = priceService.findAllById(offset, numItem, searchedString);
		return priceModels;
	}
	
	@DeleteMapping("/xoa")
	@ResponseBody
	public HashMap<String, Boolean> deletePrice(@RequestBody PriceModel priceModel) {
		HashMap<String, Boolean> res = new HashMap<>();
		res.put("message", priceService.detele(priceModel.getId()));
		return res;
	}
	
	@GetMapping(value = "/chi-tiet/{id}")
	@ResponseBody
	public PriceModel viewDetail(@PathVariable("id") Long id) {
		PriceModel priceModel = priceService.getOne(id);
		return priceModel;
	}

	@PutMapping(value = "/chinh-sua")
	public ModelAndView modifyPrice(@Valid @RequestBody PriceModel priceModel, BindingResult result,
			ModelAndView mav) {
		if (result.hasErrors()) {
			mav.setViewName("common/ajax/pricemodifyingform");
			mav.addObject("priceModel", priceModel);
			return mav;
		}
		Boolean res = priceService.modifyPrice(priceModel);
		mav.setViewName("common/ajax/message");
		mav.addObject("message", res ? "Chỉnh sửa giá thành công" : "Chỉnh sửa giá thất bại");
		return mav;
	}
}
