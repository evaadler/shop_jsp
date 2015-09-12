<%@page import="com.nina.util.ValidateUtil"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.nina.model.ShopException"%>
<%@page import="com.nina.dao.IUserDao"%>
<%@page import="com.nina.dao.DAOFactory"%>
<%@page import="com.nina.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加</title>
</head>
<body>
<%
	//response.setContentType("text/html; charset=utf-8");
    //response.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	boolean valResult = ValidateUtil.validateNull(request, new String[]{"username","password","nickname"});
	System.out.println(valResult);
	if(!valResult){
		%>
			<jsp:forward page="input.jsp"></jsp:forward>
		<%
	}
	User user = new User();
	user.setUsername(username);
	user.setPassword(password);
	user.setNickname(nickname);
	IUserDao userDao = DAOFactory.getUserDao();
	try{
		userDao.add(user);
		%>
			添加用户成功!<a href="input.jsp">继续添加</a>&nbsp;<a href="list.jsp">用户列表</a>
			<br/>
		<%
		response.sendRedirect("list.jsp");
	}catch(ShopException se){
		%>
			<h2 style="color:red">发生错误:<%=se.getMessage() %></h2>
		<%
	}
%>
</body>
</html>