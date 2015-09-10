<%@page import="com.nina.model.ShopException"%>
<%@page import="com.nina.dao.DAOFactory"%>
<%@page import="com.nina.dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	int userId = Integer.parseInt(request.getParameter("id"));
	
	IUserDao userDao = DAOFactory.getUserDao();
	try{
		userDao.delete(userId);
		%>
			删除用户成功!
			
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