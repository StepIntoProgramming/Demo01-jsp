<%@ page import="com.a.method.Method"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="change_FormNum.jsp" method = "post">
		<%
			String id = request.getParameter("id");
		%>
		<input type = "hidden" name = "id" value = "<%=id %>" />
		请输入要修改的项目<input type = "text" name = "select" />
		请输入修改后的值<input type = "text" name = "value" />
		<input type = "submit" value = "提交" />
		<input type = "reset" value = "重置" /> 
	</form>
</body>
</html>