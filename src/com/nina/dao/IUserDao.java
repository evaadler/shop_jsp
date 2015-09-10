package com.nina.dao;

import java.util.List;

import com.nina.model.User;

public interface IUserDao {
	public void add(User user);
	public void delete(int id);
	public void update(User user);
	public User load(int id);
	public List<User> list();
	public User login(String username, String password);
}
