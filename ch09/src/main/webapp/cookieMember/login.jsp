<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch09.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao md = MemberDao.getInstance();
	int chk = md.check(id, password);
	if (chk > 0) { // id와 password가 일치
		//                       쿠키명 쿠키값
		Cookie cook = new Cookie("id", id);
		response.addCookie(cook);
		response.sendRedirect("main.jsp");
	} else if (chk == 0) { // id가 있지만 암호가 다르다
%>
<script type="text/javascript">
	alert("암호가 다릅니다.");
	history.back();
</script>
<%  } else {  // -1이고 없는 아이디 %>
<script type="text/javascript">
	alert("없는 아이디입니다");
	history.back();
</script>
<%  } %>

</body>
</html>