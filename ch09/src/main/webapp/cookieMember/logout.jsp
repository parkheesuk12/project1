<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<!-- logout : pc에 있는 cookie 사용 못하게 작업
	 loginForm으로 보내기 -->

<%
	Cookie[] cooks = request.getCookies();
	if (cooks == null) response.sendRedirect("loginForm.jsp");
	else {
		for (int i= 0; i < cooks.length; i++) {
			if (cooks[i].getName().equals("id")) {
				cooks[i].setMaxAge(0); // cookie 사용 못하게
				// 현재 사용하는 쿠키를 사용종료로 변경하여 덮어쓴다
				response.addCookie(cooks[i]); 
				break;
			}
		}
	}
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다");
	location.href="loginForm.jsp";
</script>
</body>
</html>