<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<title></title>
<link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>

</body>
<script>
	function logout() {
	    window.location = "./login.jsp";
	    <% session.invalidate();%>
	}
	
	function changePage(page){
		$("#iframe").attr("src","${pageContext.request.contextPath}/Views/"+page);
		
	}
</script>

</html>