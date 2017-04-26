<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.sql.rowset.JdbcRowSet"%>
<%@ page import="com.sun.rowset.*"%>
<%@ page import="javax.sql.rowset.JdbcRowSet"%>
<%@ page import="com.sun.rowset.*"%>
<body>
<% 
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","alohomora"); 
	String name3,pass;
	Statement statement=con.createStatement();
	//String n=request.getParameter("name1");
	String u=request.getParameter("username");
	ResultSet rs=statement.executeQuery("select * from regis ");
	
	
	String p=request.getParameter("password1");
	out.println(p);
	
	if(!rs.next()) 
	{
                out.println("Sorry, could not find that publisher. ");
    } 
	else 
	{
		name3=rs.getString("username");
		out.println("username is:"+u);
		out.println("user is:"+name3);
		
		pass=rs.getString("password1");
		out.println("pass:"+pass);
		//out.println("password:"+pass);
		if(pass.equals(p))
		{
			out.println("hello"+name3);
			response.sendRedirect("c1.html");
		}
		else
			out.println("incorrect password");
		
	}
	//String n=request.getParameter("name1");
	
	//out.println("welcome"+n);
	
	
	
}
catch(Exception e)
{  
	out.println("error:"+e.getMessage());
}
%>

//attendance<input type="radio" id="abc" value="present"  onclick="return disable(this);" emem cheshnavoo chupiii









</body>