package com.demo.room.controller;

import java.util.List;

import javax.annotation.Resource;

import java.util.Arrays;

import com.common.util.Page;
import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.PageResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.*;

//import com.common.util.Page;
//import com.common.util.StringUtils;
//import com.guojiu.base.rest.BaseResponse;
//import com.guojiu.base.rest.DataResponse;
//import com.guojiu.base.rest.PageResponse;
import com.common.base.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.demo.room.domain.Room;
import com.demo.room.service.RoomService;

@Controller
@RequestMapping("room")
public class RoomController extends BaseController{

	private Logger logger = LoggerFactory.getLogger(RoomController.class);

	private final String BASE_DIR="room";

	@Resource
	private RoomService roomService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public PageResponse<List<Room>> list(Room room){
		Page.startPage();

		PageResponse<List<Room>> data = roomService.find(room);

		return data;
	}

	@RequestMapping(value = "{businessId}", method = RequestMethod.GET)
	@ResponseBody
	public BaseResponse detail(@PathVariable("businessId")Integer businessId){

		BaseResponse detail = roomService.findOne(businessId);

		return detail;
	}


	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public BaseResponse save(@RequestBody Room room){

		BaseResponse response = roomService.save(room);

		return response;
	}

	@RequestMapping(value = "{businessId}", method = RequestMethod.PUT)
	@ResponseBody
	public BaseResponse update(@PathVariable("businessId")Integer businessId,@RequestBody Room room){

		room.setId(businessId);

		BaseResponse response = roomService.update(room);

		return response;
	}


	@RequestMapping(value = "{businessId}", method = RequestMethod.DELETE)
	@ResponseBody
	public BaseResponse update(@PathVariable("businessId")Integer businessId){

		Room room = new Room();
		room.setId(businessId);

        return roomService.delete(room);
	}


	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public BaseResponse delete(@RequestBody Integer[] ids){
		BaseResponse response ;

		if(ids!=null && ids.length >0){
			Room room = new Room();
			room.setIds(Arrays.asList(ids));
			response = roomService.delete(room);
		}else{
			response = new BaseResponse(false,"302","没有传id");
		}
		return response;
	}


}
