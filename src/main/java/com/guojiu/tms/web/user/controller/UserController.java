package com.guojiu.tms.web.user.controller;

import java.util.List;

import javax.annotation.Resource;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.*;

import com.guojiu.common.util.Page;
import com.guojiu.common.util.StringUtils;
import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.DataResponse;
import com.lxxx.common.rest.PageResponse;
import com.guojiu.common.base.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.guojiu.tms.web.user.domain.UserNew;
import com.guojiu.tms.web.user.domain.User;
import com.guojiu.tms.web.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController extends BaseController{

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Resource
	private UserService userService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public PageResponse<List<UserNew>> list(UserNew userNew){
		Page.startPage();

		PageResponse<List<UserNew>> data = userService.find(userNew);

		return data;
	}

	@RequestMapping(value = "{businessId}", method = RequestMethod.GET)
	@ResponseBody
	public BaseResponse detail(@PathVariable("businessId")String businessId){

		BaseResponse detail = userService.findOne(businessId);

		return detail;
	}


	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public BaseResponse save(@RequestBody User user){

		BaseResponse response = userService.save(user);

		return response;
	}

	@RequestMapping(value = "{businessId}", method = RequestMethod.PUT)
	@ResponseBody
	public BaseResponse update(@PathVariable("businessId")String businessId,@RequestBody User user){

		user.setUserId(businessId);

		BaseResponse response = userService.update(user);

		return response;
	}


	@RequestMapping(value = "{businessId}", method = RequestMethod.DELETE)
	@ResponseBody
	public BaseResponse update(@PathVariable("businessId")String businessId){

		User user = new User();
		user.setUserId(businessId);

		BaseResponse response = userService.delete(user);

		return response;
	}


	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public BaseResponse delete(@RequestBody Integer[] ids){
		BaseResponse response ;

		if(ids!=null && ids.length >0){
			User user = new User();
			user.setIds(Arrays.asList(ids));
			response = userService.delete(user);
		}else{
			response = new BaseResponse(false,"302","没有传id");
		}
		return response;
	}


}
