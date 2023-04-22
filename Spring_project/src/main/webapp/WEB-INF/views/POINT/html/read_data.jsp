<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read_data</title>
</head>
<body>
<c:forEach var='obj' items="${list }">
	${obj.data1 }, ${obj.data2 }, ${obj.data3 }<br>
</c:forEach>
</body>
</html>