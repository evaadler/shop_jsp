<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

欢迎<%=session.getAttribute("user") %>使用用户管理系统
<a href="../admin/list.jsp">用户管理</a>
<a href="">退出系统</a>
<hr/>