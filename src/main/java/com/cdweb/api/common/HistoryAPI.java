package com.cdweb.api.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cdweb.service.impl.HistoryServiceImpl;

@Controller
public class HistoryAPI {
	@Autowired
	HistoryServiceImpl historyServiceImpl;
	
	@GetMapping(value = "/image/{id}/{imageName}")
	public @ResponseBody byte[] getImageInOut(@PathVariable("id") long id,@PathVariable("imageName") String imageName){
		return historyServiceImpl.getImage(id, imageName);
	}
}
