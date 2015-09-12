<%@page import="com.nina.util.ValidateUtil"%>
<%@page import="java.util.Map"%>
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

	<jsp:include page="inc.jsp"></jsp:include>
	
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String id = request.getParameter("user");
		User user = null;
		if (id != null && !id.equals("")) {
			user = (User) request.getAttribute(id);
		}
	%>

	<form action="add.jsp" method="post">
		用户名：<input type="text" name="username"
			value='<%=user != null ? user.getUsername() : ""%>' />
			<%=ValidateUtil.showError(request, "username") %>
			<br /> 
			
		用户密码：<input
			type="password" name="password"
			value='<%=user != null ? user.getPassword() : ""%>' />
			<%=ValidateUtil.showError(request, "password") %>
					<br /> 
		用户昵称：<input
			type="text" name="nickname"
			value='<%=user != null ? user.getNickname() : ""%>' />
			<%=ValidateUtil.showError(request, "nickname") %>
			<br />
		<%
			if (user == null) {
		%>
		<input type="submit" value="添加用户"/>
		<%
			} else {
		%>
		<input type="submit" value="更新用户" />
		<%
			}
		%>
	</form>
</body>
</html>