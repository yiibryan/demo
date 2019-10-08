package com.guojiu.tms.web.user.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import com.guojiu.tms.web.user.domain.UserNew;
import org.springframework.stereotype.Service;

import com.guojiu.common.util.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.DataResponse;
import com.lxxx.common.rest.PageResponse;
import com.lxxx.common.rest.ResultEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.guojiu.tms.web.user.mapper.UserMapper;
import com.guojiu.tms.web.user.domain.User;
import com.guojiu.tms.web.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Resource
	private UserMapper userMapper;

    @Override
    public PageResponse<List<UserNew>> findShort(User user) {
        // TODO Auto-generated method stub
        List<User> list = userMapper.find(user);
        List<UserNew> collect = list.stream().map(UserNew::new).collect(Collectors.toList());
        return new PageResponse<>(true,ResultEnum.SELECT_SUCCESS,collect);
    }

    @Override
	public PageResponse<List<User>> find(User user) {
		// TODO Auto-generated method stub
		List<User> list = userMapper.find(user);


		PageResponse<List<User>> resultBean = new PageResponse<List<User>>(true,ResultEnum.SELECT_SUCCESS,list);

		return resultBean;
	}

    /*public PageResponse<List<User>> findShort(User user) {
        // TODO Auto-generated method stub
        List<User> list = userMapper.find(user);


        PageResponse<List<User>> resultBean = new PageResponse<List<User>>(true,ResultEnum.SELECT_SUCCESS,list);

        return resultBean;
    }*/

	public DataResponse<User> findOne(String id){
		User user = new User();

		user.setUserId(id);
		User one = userMapper.findOne(user);
		DataResponse<User> resultBean = new DataResponse<User>(true,ResultEnum.SELECT_SUCCESS,one);

		return resultBean;
	}


	@Override
	@Transactional
	public BaseResponse save(User user) {
		// TODO Auto-generated method stub
		BaseResponse response ;
		try {
			//user.setId(StringUtils.createUUID());
			userMapper.save(user);
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
	public BaseResponse update(User user) {
		// TODO Auto-generated method stub
		BaseResponse response;
		try {
			userMapper.update(user);
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
	public BaseResponse delete(User user) {
		// TODO Auto-generated method stub
		BaseResponse response;
		try {
			userMapper.delete(user);
			response=new BaseResponse(true,ResultEnum.DELETE_SUCCESS);
    	} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
    		response=new BaseResponse(false,ResultEnum.DELETE_FAIL);
		}

		return response;
	}
}
