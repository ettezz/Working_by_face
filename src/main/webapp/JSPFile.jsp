<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
    try {
      String url = "jdbc:mysql://localhost:3306/demo";
      String user = "root";
      String password = "ckj0508";
      String driver = "com.mysql.jdbc.Driver";
      Class.forName(driver);
      con = DriverManager.getConnection(url, user, password);
      stmt = con.createStatement();
      String sql = "select userid,userpassword,username from userdata order by userid";
      rs = stmt.executeQuery(sql);
    } catch (Exception ex) {
      System.out.println(ex);
    }
    
    //測試GIT有沒有毛病
%>

  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show All User</title>
  
  
  <%
    if(rs!=null){
      %>
      <table border="1">
        <thead>
          <tr>
            <th>User ID</th>
            <th>User Password</th>
            <th>User Name</th>
          </tr>
        </thead>
        <%
        while(rs.next()){
          String uid = rs.getString(1);
          String upwd = rs.getString(2);
          String uname = rs.getString(3);
        %>
        <tbody>
          <tr>
            <td><%=uid%></td>
            <td><%=upwd%></td>
            <td><%=uname%></td>
          </tr>
        </tbody>
        <%
        }
        %>
      </table>
      <%
    }
  %>
  