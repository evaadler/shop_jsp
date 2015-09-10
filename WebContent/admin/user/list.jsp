<%@page import="com.nina.dao.DAOFactory"%>
<%@page import="com.nina.dao.IUserDao"%>
<%@page import="com.nina.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>

		<table border="1" width="800" align="center">
		<thead>
			<tr><th>ID</th><th>用户名</th><th>用户昵称</th><th>操作</th></tr>
		</thead>
		<tbody>
			<%
			IUserDao userDao = DAOFactory.getUserDao();
			List<User> users = userDao.list();
			for(User u : users){
				//out.print("用户名："+u.getUsername()+"--用户昵称："+u.getNickname()+"<br/>");
				request.setAttribute(u.getId()+"", u);
				%>
				<tr><td><%=u.getId() %></td><td><%=u.getUsername() %></td><td><%=u.getNickname() %></td><td><a href="delete.jsp?id=<%=u.getId()%>">删除</a><a href="input.jsp?user=<%=u.getId()%>">更新</a></td></tr>
			<% 
			}
			%>
		</tbody>
		</table>
</body>
</html>