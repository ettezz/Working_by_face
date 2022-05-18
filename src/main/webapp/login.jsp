
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.swing.*" %>

<%!
	//void clickLoginBtn(HttpServletRequest request){
	void clickLoginBtn(String userId, String passwd, JspWriter out){
		//String username = request.getParameter("username");
		//String passwd = request.getParameter("password");
			
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
	    try {
	      String url = "jdbc:mysql://localhost:3306/fp"; //mysql DB�W��
	      String user = "root";
	      String password = new Scanner(System.in).next(); //�heclipse console��Jmysql�K�X ����J�|�L�k�hsql����(�Ȯɨϥ�)
	      String driver = "com.mysql.jdbc.Driver";
	      Class.forName(driver);
	      con = DriverManager.getConnection(url, user, password);
	      String sql = "SELECT USER_NAME, ROLE_TYPE FROM FP_USERS WHERE USER_ID = ? AND PASSWD = ? ";
	      stmt = con.prepareStatement(sql);
	      stmt.setString(1, userId);
	      stmt.setString(2, passwd);
	      rs = stmt.executeQuery();
	      
	      if(rs.next()){
	      	String USER_NAME = rs.getString("USER_NAME");
	      	String ROLE_TYPE = rs.getString("ROLE_TYPE");
	      	
	        out.println("<script type='text/javascript'>alert('�w�� " + USER_NAME + " �n�J');</script>");
	        out.println("<script>window.location='entryPage.jsp'</script>");
	        
	        //JOptionPane.showMessageDialog(null, "�w�� " + USER_NAME + " �n�J");
	      }else{
	    	out.println("<script type='text/javascript'>alert('�n�J����');</script>");
	    	//JOptionPane.showMessageDialog(null, "�n�J����");
	    	
	      }
	    } catch (Exception ex) {
	      System.out.println(ex);
	    }
	}
%>

<%  
	String username = request.getParameter("username");
	String passwd = request.getParameter("password");
	
    if(username != null && passwd != null){
    	clickLoginBtn(username, passwd, out);
        
    }
%>
<html>
	<head>
		<meta charset="BIG5">
		<link rel="stylesheet" type="text/css" href="./css/login-style.css" />
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
	<body style="background-image:url('./image/background.jpg'); background-repeat: no-repeat;
	 background-position: center; background-attachment: fixed;">
		<div class="logo"><img src="./image/logo.png" alt=""></div>
		<div class="login_tb">
		    <form method="POST" action="#" class="login">
		        <h1 class="title">�n�J����</h1>
		            
		           <!-- <label for="username" id="username" class ="username">�ϥΪ̱b��</label> -->
		        <input type="text" placeholder="�п�J�b��"  name="username" id="username" class="username">
		            <!-- <label for="password" id="password" class = "password">�ϥΪ̱K�X</label>  -->
		        <input type="password" placeholder="�п�J�K�X" name="password"  id="password" class="password">
		    
		        <input type="submit" class="send_btn" id="loginBtn" value="�n�J">
		
		    </form>
		</div>
	</body>
</html>