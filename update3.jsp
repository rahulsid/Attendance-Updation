<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.sql.rowset.JdbcRowSet"%>
<%@ page import="com.sun.rowset.*"%>
<%@ page import="javax.sql.rowset.JdbcRowSet"%>
<%@ page import="com.sun.rowset.*"%>

<body>
<% 
try{
//DriverManager.registerDriver(new com.mysql.jdbc.Driver());

	Class.forName("oracle.jdbc.driver.OracleDriver");    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","N2095050$n"); 
Statement st= con.createStatement(); 
	String[] rolls= request.getParameterValues("attendance");
	for(int i=0;i<rolls.length;i++)
	{
		out.println(rolls[i]);
		ResultSet rs=st.executeQuery("select * from cse3 where rollno='"+rolls[i]+"'");
		if(rs.next())
		{
		int attndc=Integer.parseInt(rs.getString("attndc"));
	    attndc=attndc+2;
	   
		PreparedStatement ps1=con.prepareStatement("update cse3 set attndc=? where rollno=?");
		ps1.setInt(1,attndc);
		ps1.setInt(2,rolls[i]);
		out.println(rolls[i]);
		ps1.executeUpdate();
		}
	}
	}
 catch(Exception e)
 {
	 out.println(e.getMessage());
 }
 %>
 </body>