package com.demo.room.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.demo.room.domain.Room;

@Repository
@Mapper
public interface RoomMapper {

	public List<Room> find(Room room);
	public Room findOne(Room room);
	public void save(Room room);
	public void saveList(List<Room> rooms);
	public void update(Room room);
	public void delete(Room room);
}
