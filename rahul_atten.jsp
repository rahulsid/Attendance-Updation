<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<body>
<% 
try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","N2095050$n");
	String[] rolls= request.getParameterValues("attendance");
	for(int i=1;i<rolls.length;i++)
	{
		out.println(rolls[i]);
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from cse3" );
		if(!rs.next())
		{out.println("NO Result");}
		while(rs.next())
		{
		int attndc=rs.getInt(3);
		attndc=attndc+2;
		out.println(attndc);
		PreparedStatement ps1=con.prepareStatement("update cse3 set attndc=? where rollno=?");
		ps1.setInt(1,attndc);
		ps1.setString(2,rolls[i]);
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
   