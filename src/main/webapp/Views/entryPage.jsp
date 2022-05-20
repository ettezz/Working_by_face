<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<title>首頁</title>
<link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>
	<div class="navbar">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/image/logo.png" alt="">
		</div>


		<div class="menu" style="display: flex">
			<!--員工-->
			<div class="dropdown" id="Employee" style="display: none;">
				<button class="dropbtn">個人資料</button>
				<div class="dropdown-content">
					<a href="">修改密碼</a> <a href="">申請休假</a> <a href="">查詢請假紀錄</a> <a href="">查詢出勤紀錄</a>
				</div>
			</div>

			<!-- 主管-->
			<div class="dropdown" id="Manager" style="display: none;">
				<button class="dropbtn">修改核准</button>
				<div class="dropdown-content">
					<a href="">修改打卡紀錄</a> <a href="">核准休假</a>
				</div>
			</div>
			<div class="dropdown" id="Manager2" style="display: none;">
				<button class="dropbtn">查詢功能</button>
				<div class="dropdown-content">
					<a href="">查詢員工出勤紀錄</a> <a href="">查詢員工請假紀錄</a>

				</div>
			</div>

			<!-- 人資 -->

			<div class="dropdown" id="HR" style="display: none;">
				<button class="dropbtn">計算薪資</button>
				<div class="dropdown-content">
					<a href="">計算月薪</a> <a href="">計算時薪</a>
				</div>

			</div>
			<div class="dropdown" id="HR2" style="display: none">
				<button class="dropbtn">資料維護</button>
				<div class="dropdown-content">
					<a href="">新增員工資料</a> <a href="">修改員工資料</a> <a href="">查詢員工資料</a> <a href="">維護薪資規則</a> <a href="">投保級距</a>
				</div>
			</div>
			<div class="dropdown" id="HR3" style="display: none;">
				<button class="dropbtn">匯出功能</button>
				<div class="dropdown-content">
					<a href="">匯出出勤紀錄</a> <a href="">匯出請假紀錄</a> <a href="">匯出薪資條</a>
				</div>

			</div>
		</div>

		<!-- 登入員工資訊 -->
		<div class="Employee">
			<div class="personalinformation">
				<p>員工編號:</p>
				<%
				out.println("<p>" + session.getAttribute("USER_ID") + "</p>");
				%>
				<p>姓名:</p>
				<%
				out.println("<p>" + session.getAttribute("USER_NAME") + "</p>");
				%>
				<p>身分:</p>
				<%
				out.println("<p>" + session.getAttribute("DEPARTMENT") + "</p>");
				%>
			</div>
		</div>

		<!-- 登出 -->

		<div class="Signout">
			<!--<form action="${pageContext.request.contextPath}/Controllers/US002Servlet" method="POST">
				
			</form>-->
			<button class="Signoutbtn" onclick="logout()">登出</button>
		</div>



	</div>
	<!--navbar-->
	<div style="background-color: #FFFFFF; width: 100%; height: 500px;"></div>

</body>

<%
String roleType = session.getAttribute("ROLE_TYPE").toString();
switch (roleType) {
	//主管
	case "A" :
		out.println(
		"<script type='text/javascript'>document.getElementById('Employee').style.display='block';</script>");
		out.println(
		"<script type='text/javascript'>document.getElementById('Manager').style.display='block';</script>");
		out.println(
		"<script type='text/javascript'>document.getElementById('Manager2').style.display='block';</script>");
		break;

	//人資
	case "B" :
		out.println(
		"<script type='text/javascript'>document.getElementById('Employee').style.display='block';</script>");
		out.println("<script type='text/javascript'>document.getElementById('HR').style.display='block';</script>");
		out.println("<script type='text/javascript'>document.getElementById('HR2').style.display='block';</script>");
		out.println("<script type='text/javascript'>document.getElementById('HR3').style.display='block';</script>");
		break;

	//員工	
	case "C" :
		out.println(
		"<script type='text/javascript'>document.getElementById('Employee').style.display='block';</script>");
		break;

	default :
		out.println("<script type='text/javascript'>alert('沒有符合的條件');</script>");
}

out.println("<script type='text/javascript'>window.onload = navbarSelect (" + roleType + ");</script>");
%>
<script>
	function logout() {
	    window.location = "./login.jsp"
		<%response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.flushBuffer();%>
			
		<%Cookie cleanCookie = new Cookie("mycookie", null);
		cleanCookie.setMaxAge(0);
		cleanCookie.setPath("/");
		response.addCookie(cleanCookie);%>
	}

    /*var ROLE_TYPE = 'A';//抓取資料

    function navbarSelect(ROLE_TYPE) {

	    switch (ROLE_TYPE) {
		    case 'C':
			    document.getElementById("Employee").style.display = "block";

			    break;
		    case 'A'://主管
			    document.getElementById("Employee").style.display = "block";
			    document.getElementById("Manager").style.display = "block";
			    document.getElementById("Manager2").style.display = "block";

			    break;
		    case 'B'://人資
			    document.getElementById("Employee").style.display = "block";
			    document.getElementById("HR").style.display = "block";
			    document.getElementById("HR2").style.display = "block";
			    document.getElementById("HR3").style.display = "block";
			    break;
		    default:
			    alert('沒有符合的條件');
	    }

    }

    window.onload = navbarSelect(ROLE_TYPE);*/
</script>
</html>