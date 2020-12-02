<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="db.DBManager" %>
<%@ page import="java.sql.*" %>
<%
	DBManager dbManager = new DBManager();
	Connection con = dbManager.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//select
	String notice_id = request.getParameter("notice_id");
	String sql="select * from notice where notice_id="+notice_id;
	pstmt = con.prepareStatement(sql);//쿼리 준비
	rs=pstmt.executeQuery();//쿼리 수행
	
	rs.next();//커서 한칸 전진

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
textarea{
	background-color:yellow;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
/*
GET : Http 프로토콜에서 해당 정보에 데이터를 실어 나른다. 아무래도 헤더이다 보니, 그 양이 미미함
	  현실비유) 편지봉투에 데이터 노출하여 보내는 꼴이다.
POST : Http 프로토콜에서 바디영역에 데이터를 실어 나른다. 몸체이다 보니 전송량에 한계가 없음.
	  현실비유) 편지지에 데이터를 숨겨 보내는 꼴이다.
*/
$(function(){
	$("input[type='button']").click(function(){
		//입력방식을 서버에 전송
		$("form").attr({
			method:"post",
			action:"/board/regist.jsp"
		});
		$("form").submit();//전송 행위
	});
});
</script>
</head>
<body>

<div class="container">
  <form>
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="author" value="<%=rs.getString("author")%>">

    <label for="lname">Title</label>
    <input type="text" id="lname" name="title" value="<%=rs.getString("title")%>">

    <label for="subject">Content</label>
    <textarea id="subject" name="content" placeholder="Write something.." style="height:200px"><%=rs.getString("content")%></textarea>

    <input type="button" value="전송">
  </form>
</div>
<div style="text-align:center">
Copyright All reserved java board
</div>
</body>
</html>
<%
	dbManager.release(con,pstmt,rs);
%>