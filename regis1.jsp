<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<body>
<% 
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","alohomora"); 
	PreparedStatement stmt=con.prepareStatement("insert into regis(name1,email,mobile,username,password1) values (?,?,?,?,?)"); 
	String n=request.getParameter("name1");
	String e=request.getParameter("email");
	int m=Integer.parseInt(request.getParameter("mobile"));
	String u=request.getParameter("username");
	String p=request.getParameter("password1");
	out.println(n);
	out.println(e);
	out.println(m);
	out.println(u);
	out.println();
	stmt.setString(1,n);
	stmt.setString(2,e);
	stmt.setInt(3,m);
	stmt.setString(4,u);
	stmt.setString(5,p);
	stmt.execute();
	response.sendRedirect("http://localhost:8081/studentinfo/mini/login1.html");
}
catch(Exception e)
{  
	out.println("error:"+e.getMessage());
}
%>
</body>