package com.guojiu.tms.web.user.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.guojiu.tms.web.user.domain.User;

@Repository
@Mapper
public interface UserMapper {

	public List<User> find(User user);
	public User findOne(User user);
	public void save(User user);
	public void saveList(List<User> users);
	public void update(User user);
	public void delete(User user);
}
