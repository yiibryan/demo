package com.demo.room.service;

import java.util.List;


import com.demo.room.domain.Room;
import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.DataResponse;
import com.lxxx.common.rest.PageResponse;

public interface RoomService {

	public PageResponse<List<Room>> find(Room room);
	public DataResponse<Room> findOne(Integer id);
	public BaseResponse save(Room room);
	public BaseResponse update(Room room);
	public BaseResponse delete(Room room);

}
