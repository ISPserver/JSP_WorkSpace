<%@ page contentType="text/html; charset=utf-8"%>
<%
	//스크립플릿 영역: 로직을 작성하는 영역
	//jsp는 자바의 문법을 따르므로, 곧 자바코드를 작성하면 된다.
	String[] days={"Sun","Mon","Tue","Wed","Thur","Fri","Sat"};
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8"> 
<title>Document</title>
<script>
function getMsg(){
	return "안녕";
}
</script>
</head>
<body>
JSP는 JAVA코드가 실행된다
<table border="1px">
	<tr>
		<%for(int i=0; i<days.length; i++){%>
		<td><%=days[i]%></td>
		<%}%>
	</tr>
</table>
</body>
</html>
