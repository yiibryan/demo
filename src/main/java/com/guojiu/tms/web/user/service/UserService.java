package com.guojiu.tms.web.user.service;

import java.util.List;

import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.DataResponse;
import com.lxxx.common.rest.PageResponse;

import com.guojiu.tms.web.user.domain.User;
import com.guojiu.tms.web.user.domain.UserNew;

public interface UserService {

    public PageResponse<List<UserNew>> findShort(UserNew user);
    public PageResponse<List<User>> find(User user);
	public DataResponse<User> findOne(String id);
	public BaseResponse save(User user);
	public BaseResponse update(User user);
	public BaseResponse delete(User user);

}
