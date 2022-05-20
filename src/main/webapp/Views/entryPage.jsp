<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<title>����</title>
<link href="${pageContext.request.contextPath}/css/navbar.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>
	<div class="navbar">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/image/logo.png" alt="">
		</div>


		<div class="menu" style="display: flex">
			<!--���u-->
			<div class="dropdown" id="Employee" style="display: none;">
				<button class="dropbtn">�ӤH���</button>
				<div class="dropdown-content">
					<a href="">�ק�K�X</a> <a href="">�ӽХ�</a> <a href="">�d�߽а�����</a> <a
						href="">�d�ߥX�Ԭ���</a>
				</div>
			</div>

			<!-- �D��-->
			<div class="dropdown" id="Manager" style="display: none;">
				<button class="dropbtn">�ק�֭�</button>
				<div class="dropdown-content">
					<a href="">�ק若�d����</a> <a href="">�֭��</a>
				</div>
			</div>
			<div class="dropdown" id="Manager2" style="display: none;">
				<button class="dropbtn">�d�ߥ\��</button>
				<div class="dropdown-content">
					<a href="">�d�߭��u�X�Ԭ���</a> <a href="">�d�߭��u�а�����</a>

				</div>
			</div>

			<!-- �H�� -->

			<div class="dropdown" id="HR" style="display: none;">
				<button class="dropbtn">�p���~��</button>
				<div class="dropdown-content">
					<a href="">�p����~</a> <a href="">�p����~</a>
				</div>

			</div>
			<div class="dropdown" id="HR2" style="display: none">
				<button class="dropbtn">��ƺ��@</button>
				<div class="dropdown-content">
					<a href="">�s�W���u���</a> <a href="">�ק���u���</a> <a href="">�d�߭��u���</a> <a
						href="">���@�~��W�h</a> <a href="">��O�ŶZ</a>
				</div>
			</div>
			<div class="dropdown" id="HR3" style="display: none;">
				<button class="dropbtn">�ץX�\��</button>
				<div class="dropdown-content">
					<a href="">�ץX�X�Ԭ���</a> <a href="">�ץX�а�����</a> <a href="">�ץX�~���</a>
				</div>

			</div>
		</div>

		<!-- �n�J���u��T -->
		<div class="Employee">
			<div class="personalinformation">
				<p>���u�s��:</p>
				<% out.println("<p>" + session.getAttribute("USER_ID") + "</p>" );%>
				<p>�m�W:</p>
				<% out.println("<p>" + session.getAttribute("USER_NAME") + "</p>" );%>
				<p>����:</p>
				<% out.println("<p>" + session.getAttribute("DEPARTMENT") + "</p>" );%>

			</div>
		</div>

		<!-- �n�X -->

		<div class="Signout">
			<!--<form action="${pageContext.request.contextPath}/Controllers/US002Servlet" method="POST">
				
			</form>-->
			<button class="Signoutbtn" onclick="logout()">�n�X</button>
		</div>



	</div>
	<!--navbar-->
	<div style="background-color: #FFFFFF; width: 100%; height: 500px;"></div>

</body>

<%
	String roleType = session.getAttribute("ROLE_TYPE").toString();
	switch(roleType){
		//�D��
		case "A":
			out.println("<script type='text/javascript'>document.getElementById('Employee').style.display='block';</script>");
			out.println("<script type='text/javascript'>document.getElementById('Manager').style.display='block';</script>");
			out.println("<script type='text/javascript'>document.getElementById('Manager2').style.display='block';</script>");
			break;
		
		//�H��
		case "B":
			out.println("<script type='text/javascript'>document.getElementById('Employee').style.display='block';</script>");
			out.println("<script type='text/javascript'>document.getElementById('HR').style.display='block';</script>");
			out.println("<script type='text/javascript'>document.getElementById('HR2').style.display='block';</script>");
			out.println("<script type='text/javascript'>document.getElementById('HR3').style.display='block';</script>");
			break;
			
		//���u	
		case "C":
			out.println("<script type='text/javascript'>document.getElementById('Employee').style.display='block';</script>");
			break;
			
		default:
			out.println("<script type='text/javascript'>alert('�S���ŦX������');</script>");
	}
	
	out.println("<script type='text/javascript'>window.onload = navbarSelect (" + roleType + ");</script>");
	
%>
<script>
	function logout() {
		window.location = "./login.jsp"
		<%
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.flushBuffer();
		%>
			
		<%
		Cookie cleanCookie = new Cookie("mycookie", null);   
		cleanCookie.setMaxAge(0);   
		cleanCookie.setPath("/");   
		response.addCookie(cleanCookie);
		%>
	}
	
	
	/*	var ROLE_TYPE = 'A';//������
    
    
    function navbarSelect (ROLE_TYPE){
     
     switch (ROLE_TYPE) {
        case 'C':
            document.getElementById("Employee").style.display="block";
    
            break;
        case 'A'://�D��
            document.getElementById("Employee").style.display="block";
            document.getElementById("Manager").style.display="block";
            document.getElementById("Manager2").style.display="block";
    
            break;
        case 'B'://�H��
            document.getElementById("Employee").style.display="block";
            document.getElementById("HR").style.display="block";
            document.getElementById("HR2").style.display="block";
            document.getElementById("HR3").style.display="block";
            break;
        default:
            alert('�S���ŦX������');
    }
    
    }
    
    window.onload = navbarSelect (ROLE_TYPE);*/
</script>
</html>