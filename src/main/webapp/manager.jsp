<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<title>登入</title>
</head>

<body>
	<div class="navbar">
		<div id="logo">
			<img src="./image/logo.png" alt="">
		</div>
		<div class="menu">
			<div class="dropdown">
				<button class="dropbtn">個人資料</button>
				<div class="dropdown-content">
					<a href="">修改密碼</a> <a href="">申請休假</a> <a href="">查詢請假紀錄</a> <a
						href="">查詢出勤紀錄</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">修改核准</button>
				<div class="dropdown-content">
					<a href="">修改打卡紀錄</a> <a href="">核准休假</a>
				</div>

			</div>
			<div class="dropdown">
				<button class="dropbtn">查詢功能</button>
				<div class="dropdown-content">
					<a href="">查詢員工出勤紀錄</a> <a href="">查詢員工請假紀錄</a>
				</div>
			</div>

		</div>
		<div class="Employee">
			<div class="personalinformation">
				<p>員工編號:</p>
				<p>A00001</p>
				<p>姓名:</p>
				<p>王測試</p>
				<p>身分:</p>
				<p>管理部</p>

			</div>
		</div>


		<div class="Signout">
			<button class="Signoutbtn" onclick="window.location='login.jsp'">登出</button>
		</div>





	</div>
</body>
</html>