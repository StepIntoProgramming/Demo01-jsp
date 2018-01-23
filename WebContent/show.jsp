<%@page import="com.a.method.Method"%>
<%@page import="com.a.util.DButil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.a.bean.Person"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>编号</td><td>姓名</td><td>性别</td><td>年龄</td><td>住址</td><td>操作</td>
		</tr>
		<%
			List<Person> personList = new ArrayList<Person>();
			Method method = new Method();
			personList = method.selectMessMethod();
			for(Person person:personList){
		%>
					<tr>
						<td><%=person.getId() %></td>
						<td><%=person.getName() %></td>
						<td><%=person.getSex() %></td>
						<td><%=person.getAge() %></td>
						<td><%=person.getLoc() %></td>
						<td>
							<a href="delete.jsp?id=<%=person.getId() %>">删除</a>
							<a href="change.jsp?id=<%=person.getId() %>">修改</a>
						</td>
					</tr>
				<% 
			}
		%>
		<tr>
			<td>
				<a href="add.jsp">添加</a>
			</td>
		</tr>
	</table>
</body>
</html>