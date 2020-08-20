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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.constant.SystemConstant;
import com.cdweb.model.UserModel;
import com.cdweb.service.intf.UserService;

@Controller
public class UserAPI {

	
	@Autowired
	UserService userService;
	
	@GetMapping("tim-kiem/{offset}/{numItem}/{searchedString}")
	public ModelAndView searchUser(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			@PathVariable("searchedString") String searchedString, ModelAndView mav) {
		List<UserModel> userModels = userService.findAllById(offset, numItem, searchedString);
		if(userModels == null || userModels.size() == 0) {
			mav.addObject("message", "Không tìm thấy kết quả phù hợp");
			mav.setViewName("common/ajax/message");
			return mav;
		}
		mav.addObject("userModels", userModels);
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.addObject("searchedString", searchedString);
		mav.setViewName("common/ajax/pricesearchedtable");
		return mav;
	}
	
	@DeleteMapping("/xoa")
	@ResponseBody
	public HashMap<String, Boolean> deleteUser(@RequestBody UserModel userModel) {
		HashMap<String, Boolean> res = new HashMap<>();
		res.put("message", userService.detele(userModel.getId()));
		return res;
	}
	
	@GetMapping(value = "/chi-tiet/{id}")
	@ResponseBody
	public UserModel viewDetail(@PathVariable("id") String id) {
		UserModel userModel = userService.getOne(id);
		return userModel;
	}

	@PutMapping(value = "/chinh-sua")
	public ModelAndView modifyUser(@Valid @RequestBody UserModel userModel, BindingResult result,
			ModelAndView mav) {
		if (result.hasErrors()) {
			mav.setViewName("common/ajax/usermodifyingform");
			mav.addObject("userModel", userModel);
			return mav;
		}
		Boolean res = userService.modifyUser(userModel);
		mav.setViewName("common/ajax/message");
		mav.addObject("message", res ? "Chỉnh sửa tài khoản thành công" : "Chỉnh sửa tài khoản thất bại");
		return mav;
	}
	
}
