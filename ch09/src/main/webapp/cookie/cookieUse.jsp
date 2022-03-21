<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
 	Cookie[] cooks = request.getCookies();
    // cooks.length : 내 pc에 지금 접근한 사이트에 있는 쿠키의 갯수
	if(cooks != null){
		for(int i =0; i < cooks.length; i++){
			if(cooks[i].getName().equals("id")){
				out.println("쿠키이름 : "+cooks[i].getName()+"<br>");
				out.println("쿠키 값 : "+cooks[i].getValue()+"<p>");
			}
			
		}
	}
%>
</body>
</html>