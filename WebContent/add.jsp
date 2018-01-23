<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "add_FormNum.jsp" method = "post">
		<table>
			<tr>
				<td>
					<p>请输入信息</p>
				</td>
			</tr>
			<tr>
				<td>姓名</td><td>性别</td><td>年龄</td><td>住址</td>
			</tr>
			<tr>
				<td>
					<input type = "text" name = "name" />
				</td>
				<td>
					<input type = "text" name = "sex" />
				</td>
				<td>
					<input type = "text" name = "age" />
				</td>
				<td>
					<input type = "text" name = "location" />
				</td>
			</tr>
			<tr>
				<td>
					<input type = "submit" value = "提交" />
					<input type = "reset" value = "重置" /> 
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>