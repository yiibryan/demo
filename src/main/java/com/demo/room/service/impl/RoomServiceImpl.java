package com.demo.room.service.impl;

import com.demo.room.domain.Room;
import com.demo.room.mapper.RoomMapper;
import com.demo.room.service.RoomService;

import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.DataResponse;
import com.lxxx.common.rest.PageResponse;
import com.lxxx.common.rest.ResultEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

	private Logger logger = LoggerFactory.getLogger(RoomServiceImpl.class);

	@Resource
	private RoomMapper roomMapper;

	@Override
	public PageResponse<List<Room>> find(Room room) {
		// TODO Auto-generated method stub
		List<Room> list = roomMapper.find(room);


		PageResponse<List<Room>> resultBean = new PageResponse<List<Room>>(true, ResultEnum.SELECT_SUCCESS,list);

		return resultBean;
	}

	public DataResponse<Room> findOne(Integer id){
		Room room = new Room();

		room.setId(id);
		Room one = roomMapper.findOne(room);
		DataResponse<Room> resultBean = new DataResponse<Room>(true,ResultEnum.SELECT_SUCCESS,one);

		return resultBean;
	}


	@Override
	@Transactional
	public BaseResponse save(Room room) {
		// TODO Auto-generated method stub
		BaseResponse response ;
		try {
			//room.setId(StringUtils.createUUID());
			roomMapper.save(room);
			response=new BaseResponse(true,ResultEnum.INSERT_SUCCESS);
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			response=new BaseResponse(false,ResultEnum.INSERT_FAIL);
			e.printStackTrace();
		}

		return response;
	}

	@Override
	@Transactional
	public BaseResponse update(Room room) {
		// TODO Auto-generated method stub
		BaseResponse response;
		try {
			roomMapper.update(room);
			response=new BaseResponse(true,ResultEnum.UPDATE_SUCCESS);
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			response=new BaseResponse(false,ResultEnum.UPDATE_FAIL);
			e.printStackTrace();
		}

		return response;
	}

	@Override
	@Transactional
	public BaseResponse delete(Room room) {
		// TODO Auto-generated method stub
		BaseResponse response;
		try {
			roomMapper.delete(room);
			response=new BaseResponse(true,ResultEnum.DELETE_SUCCESS);
    	} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
    		response=new BaseResponse(false,ResultEnum.DELETE_FAIL);
		}

		return response;
	}
}
