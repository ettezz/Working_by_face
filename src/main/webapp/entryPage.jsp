<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/navbar.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<title>登入</title>
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
					<a href="">修改密碼</a> <a href="">申請休假</a> <a href="">查詢請假紀錄</a> <a
						href="">查詢出勤紀錄</a>
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
					<a href="">新增員工資料</a> <a href="">修改員工資料</a> <a href="">查詢員工資料</a> <a
						href="">維護薪資規則</a> <a href="">投保級距</a>
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
				<p>A00001</p>
				<p>姓名:</p>
				<p>賴永宏</p>
				<p>身分:</p>
				<p>人資部</p>

			</div>
		</div>

		<!-- 登出 -->
		<div class="Signout">
			<button class="Signoutbtn" onclick="window.location='login.jsp'">登出</button>

		</div>

	</div>
	<!--navbar-->
	<div style="background-color: #B72224; width: 100%; height: 500px;"></div>
</body>

<script>
	var ROLE_TYPE = 'A';//抓取資料

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

	window.onload = navbarSelect(ROLE_TYPE);
</script>

</html>