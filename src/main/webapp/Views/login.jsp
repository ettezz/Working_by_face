
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.swing.*" %>
<%@page import="Models.User" %>

<%  
	if (request.getAttribute("sent") != null){
		if (request.getAttribute("userModel") != null){
			User user = (User)request.getAttribute("userModel");
			String USER_ID = user.getUserId();
			String USER_NAME = user.getUserName();
			int USER_PHONE = user.getPhone();
			String USER_ADDRESS = user.getAddress();
			String ROLE_TYPE = user.getRoleType();
			String DEPARTMENT = user.getDepartment();
			
			session.setAttribute("USER_ID", USER_ID);
			session.setAttribute("USER_NAME", USER_NAME);
			session.setAttribute("USER_PHONE", USER_PHONE);
			session.setAttribute("USER_ADDRESS", USER_ADDRESS);
			session.setAttribute("ROLE_TYPE", ROLE_TYPE);
			session.setAttribute("DEPARTMENT", DEPARTMENT);
			
			out.println("<script type='text/javascript'>alert('�w�� " + USER_NAME + " �n�J');</script>");
			//�������
			out.println("<script type='text/javascript'>window.location.href='./Views/entryPage.jsp';</script>");
		}
		else{
			out.println("<script type='text/javascript'>alert('�n�J����');</script>");
		}
	}
	
%>
<html>
	<head>
		<meta charset="BIG5">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login-style.css" />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
		<title>�n�J</title>
	</head>
	<script type="text/javascript">
        /*$(document).ready(function() {
            $('#loginBtn').click(function (){
                $.ajax({
                    type: "post",
                    url: "login.jsp", 
                    data: "username=" + $('#username').val() + "&password="+$('#password').val(),
                    success: function(msg){      
                        alert('success');
                    }
                });
            });
        });*/
        
        /*function clickLoginBtn(){
        	$.ajax({
                type: "post",
                url: "login.jsp", 
                data: "username=" + $('#username').val() + "&password="+$('#password').val(),
                success: function(msg){      
                	alert('success:' + msg);
                }
            });
        }*/
	</script>
	<body style="background-image:url('${pageContext.request.contextPath}/image/background.jpg'); background-repeat: no-repeat;
	 background-position: center; background-attachment: fixed;">
		<div class="logo"><img src="${pageContext.request.contextPath}/image/logo.png" alt=""></div>
		<div class="login_tb">
		    <form method="POST" action="${pageContext.request.contextPath}/US001Servlet" class="login">
		        <h1 class="title">�n�J����</h1>
		            
		           <!-- <label for="username" id="username" class ="username">�ϥΪ̱b��</label> -->
		        <input type="text" placeholder="�п�J�b��"  name="username" id="username" class="username">
		            <!-- <label for="password" id="password" class = "password">�ϥΪ̱K�X</label>  -->
		        <input type="password" placeholder="�п�J�K�X" name="password"  id="password" class="password">
		    
		        <input type="submit" class="send_btn" id="loginBtn" value = "�n�J">
		
		    </form>
		</div>
	</body>
</html>