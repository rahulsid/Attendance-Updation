<%@ page language="java" contentType="text/html"%>
<%@ page import="java.servlet.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","alohomora"); 
	String[] roll=request.getParameterValues("att");
	Statement stmt=con.createStatement();
	int count;
	for(int i=0;i<roll.length;i++)
	{
		out.println("Rollno:"+roll[i]);
		String sql="select * from cse3 where rollno='"+roll[i]+"'";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			count=rs.getInt("attndc");
			count+=1;
			out.println("Attendance:"+count);
			PreparedStatement ps=con.prepareStatement("update cse3 set attndc=? where rollno=?");
			ps.setInt(1,count);
			ps.setString(2,roll[i]);
			ps.executeUpdate();
		}
	}
	}
	catch(Exception e)
	{out.println(e.getMessage());}
%>