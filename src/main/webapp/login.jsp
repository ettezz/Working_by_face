
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
	      String url = "jdbc:mysql://localhost:3306/fp"; //mysql DB名稱
	      String user = "root";
	      String password = new Scanner(System.in).next(); //去eclipse console輸入mysql密碼 不輸入會無法去sql抓資料(暫時使用)
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
	      	
	        out.println("<script type='text/javascript'>alert('歡迎 " + USER_NAME + " 登入');</script>");
	        out.println("<script>window.location='entryPage.jsp'</script>");
	        
	        //JOptionPane.showMessageDialog(null, "歡迎 " + USER_NAME + " 登入");
	      }else{
	    	out.println("<script type='text/javascript'>alert('登入失敗');</script>");
	    	//JOptionPane.showMessageDialog(null, "登入失敗");
	    	
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
		<title>登入</title>
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
		        <h1 class="title">登入頁面</h1>
		            
		           <!-- <label for="username" id="username" class ="username">使用者帳號</label> -->
		        <input type="text" placeholder="請輸入帳號"  name="username" id="username" class="username">
		            <!-- <label for="password" id="password" class = "password">使用者密碼</label>  -->
		        <input type="password" placeholder="請輸入密碼" name="password"  id="password" class="password">
		    
		        <input type="submit" class="send_btn" id="loginBtn" value="登入">
		
		    </form>
		</div>
	</body>
</html>