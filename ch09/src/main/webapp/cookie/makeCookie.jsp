<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
 <%   // 다른 컴퓨터 사용자에게 넣을 수 있는 데이터는 쿠키만 가능
     //                   속성(변수) 값
	Cookie cook = new Cookie("id","k1");
	// cooks.setValue("kim"); //쿠키값 변경
	//cook.setMaxAge(2 * 60); // 2분 2시간 2*60*60 브라우저 닫더라도 2분 유지
	cook.setMaxAge(0); // 쿠키 삭제 효과
	// MaxAge (-1) 브라우저 닫으면 쿠키 삭제(default)
	response.addCookie(cook);
%>
<h2>쿠키 생성</h2>
<a href="cookieUse.jsp">쿠키 값 확인</a>
</body>
</html>