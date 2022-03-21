<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch09.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8"); %>
<!-- Member member = new Member() -->
<jsp:useBean id="member" class="ch09.Member"></jsp:useBean>
<!-- id, password, name을 묶어서 한번에 member객체에 setter메서드를 통하여 저장 -->
<jsp:setProperty property="*" name="member"/>

<%  // singleton을 이용한 객체 생성 public되어 있는 클래스 메서드 getInstance()를 사용
	MemberDao md = MemberDao.getInstance(); // new MemberDao(); 생성자가 private 사용 못함
	int result = md.insert(member);
	if (result > 0) {
%>

<script type="text/javascript">
	alert("와우 ! 회원가입 성공 ㅋㅋ");
	location.href="loginForm.jsp";
</script>
<%  } else { %>
<script type="text/javascript">
	alert("에효 ! 다시해 ㅠㅠ");
	history.go(-1);
</script>
<%  } %>
</body>
</html>