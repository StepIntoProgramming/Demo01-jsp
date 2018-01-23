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
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%	
		Method method = new Method();
		String id = request.getParameter("id");
		String select = request.getParameter("select");
		String values = request.getParameter("value");
		int rows = -1;
		int ids = Integer.parseInt(id);
		String sql = null;
		switch (select){
			case "姓名":
					sql = "update person set name = ? where id = ?";
					rows = method.changeMethod(sql,values,ids);
				break;
			case "性别":
					sql = "update person set sex = ? where id = ?";
					rows = method.changeMethod(sql,values,ids);
				break;
			case "住址":
					sql = "update person set location = ? where id = ?";
					rows = method.changeMethod(sql,values,ids);
				break;
			case "年龄":
					sql = "update person set age = ? where id = ?";
					rows = method.changeMethod(sql,Integer.parseInt(values),ids);
				break;
			default :
				break;
		}
		if(0<rows){
			response.sendRedirect("show.jsp");
		}else{
			out.print("修改失败");
		}
	%>
</body>
</html>