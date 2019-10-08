package com.guojiu.tms.web.user.controller;

import com.guojiu.common.base.controller.BaseController;
import com.guojiu.common.util.Page;
import com.guojiu.tms.web.user.domain.User;
import com.guojiu.tms.web.user.domain.UserNew;
import com.guojiu.tms.web.user.service.UserService;
import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.PageResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController extends BaseController{

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Resource
	private UserService userService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public BaseResponse list(User user){
		Page.startPage();

        return userService.find(user);
	}

    @RequestMapping(value = "listShort", method = RequestMethod.GET)
    @ResponseBody
    public PageResponse<List<UserNew>> listShort(User user){
        Page.startPage();

        return userService.findShort(user);
    }

	@RequestMapping(value = "{businessId}", method = RequestMethod.GET)
	@ResponseBody
	public BaseResponse detail(@PathVariable("businessId")String businessId){

        return userService.findOne(businessId);
	}


	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public BaseResponse save(@RequestBody User user){

        return userService.save(user);
	}

	@RequestMapping(value = "{businessId}", method = RequestMethod.PUT)
	@ResponseBody
	public BaseResponse update(@PathVariable("businessId")String businessId,@RequestBody User user){

		user.setUserId(businessId);

        return userService.update(user);
	}


	@RequestMapping(value = "{businessId}", method = RequestMethod.DELETE)
	@ResponseBody
	public BaseResponse update(@PathVariable("businessId")String businessId){

		User user = new User();
		user.setUserId(businessId);

        return userService.delete(user);
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
