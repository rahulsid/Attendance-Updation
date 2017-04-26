<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.sql.rowset.JdbcRowSet"%>
<%@ page import="com.sun.rowset.*"%>

<body>
<% 
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","N2095050$n"); 
	String sname;
	int rno,attendance;
	Statement statement=con.createStatement();
	
	//String sname=request.getParameter("sname");
	//int rno=Integer.parseInt(request.getParameter("rno"));
	//int attendance=Integer.parseInt(request.getParameter("attendance"));
	
	ResultSet rs3=statement.executeQuery("select * from cse3");
	
	if(!rs3.next()) 
	{
                out.println("Sorry, could not find that publisher. ");
    } 
	else 
	{
		rno=rs3.getInt(1);
		sname=rs3.getString(2);
		attendance=rs3.getInt(3);
		
		out.println(rno);
		out.println(sname);
		out.println(attendance);
		
		
	}
	//String n=request.getParameter("name1");
	
	//out.println("welcome"+n);
	
	
	
}
catch(Exception e)
{  
	out.println("error:"+e.getMessage());
}
%>
</body>