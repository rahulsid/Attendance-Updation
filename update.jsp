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
	
	String[] rolls= request.getParameterValues("attendance");
	for(int i=0;i<rolls.length;i++)
	{
		PreparedStatement ps=con.prepareStatement("update cse set attndc +=3 where rollno=?;");
		ps.setString(1,rolls[i]);
		out.println(rolls[i]);
		ps.executeUpdate();
	}
 }
 catch(Exception e)
 {
	 out.println(e.getMessage());
 }
 %>
 </body>
   
   
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
%>
</body>