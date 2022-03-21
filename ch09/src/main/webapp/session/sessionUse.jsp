<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<h2>찾아서 전부 읽기</h2>
<%
	Enumeration<String> et = session.getAttributeNames();
	while(et.hasMoreElements()){
		String name = et.nextElement();
		String value = (String)session.getAttribute(name);
		out.println(name+" ; "+value+"<p>");
		
	}
%>

<h2>직접 읽기</h2>
아이디 : <%=session.getAttribute("id") %><p>
암호 : <%=session.getAttribute("pass") %>
</body>
</html>