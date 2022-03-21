<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">

<title>Insert title here</title></head><body>
<%    //             세션명(속성) 세션값 
	session.setAttribute("id", "kim");
	session.setAttribute("pass", "1234");
	
%>
<h2>세션 생선 완료</h2>
<button onclick="location.href='sessionUse.jsp'">세션 보기</button>
</html>