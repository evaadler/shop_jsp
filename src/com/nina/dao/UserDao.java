package com.nina.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nina.model.ShopException;
import com.nina.model.User;
import com.nina.util.DBUtil;

public class UserDao implements IUserDao {

	@Override
	public void add(User user) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select count(*) from t_user where username=?");
			String username = user.getUsername();
			if(username==null || "".equals(username)){
				throw new ShopException("添加的用户名不能为空！");
			}
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getInt(1)>0) {
					throw new ShopException("添加的用户名已存在！");
				}
			}
			String sql = "insert into t_user (username,password,nickname) values (?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getNickname());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.close(rs);
			DBUtil.close(ps);
			DBUtil.close(conn);
		}
	}

	@Override
	public void delete(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("delete from t_user where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.close(ps);
			DBUtil.close(conn);
		}
	}

	@Override
	public void update(User user) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("update t_user set password=?, nickname=? where id=?");
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getNickname());
			ps.setInt(3, user.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.close(ps);
			DBUtil.close(conn);
		}
	}

	@Override
	public User load(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from t_user where id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()){
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setNickname(rs.getString("nickname"));
				user.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.close(rs);
			DBUtil.close(ps);
			DBUtil.close(conn);
		}
		return user;
	}

	@Override
	public List<User> list() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<User> users = new ArrayList<User>();
		
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from t_user");
			
			rs = ps.executeQuery();
			while(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setNickname(rs.getString("nickname"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.close(rs);
			DBUtil.close(ps);
			DBUtil.close(conn);
		}
		return users;
	}

	@Override
	public User login(String username, String password) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from t_user where username=?");
			ps.setString(1, username);
			
			rs = ps.executeQuery();
			while(rs.next()){
					user = new User();
					user.setId(rs.getInt("id"));
					user.setUsername(username);
					user.setPassword(password);
					user.setNickname(rs.getString("nickname"));
				
					
		
			}
			if(user==null) throw new ShopException("该用户名不存在，登陆失败");
			if(!user.getPassword().equals(password)) throw new ShopException("密码不正确，登陆失败");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.close(rs);
			DBUtil.close(ps);
			DBUtil.close(conn);
		}
		
		return user;
	}

}
