<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<%
        
		int x1 = Integer.parseInt(request.getParameter("size"));
		out.print(x1+"\n");
		String[] names= new String[x1]; 
		for(int i=0;i<x1;i++)
		{
        names[i] = request.getParameter("email"+i); 	
        out.println(names[i]+"\n");
        }
		//Class.forName("oracle.jdbc.driver.OracleDriver");
        //Class.forName("com.mysql.jdbc.Driver");
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@Rangita:1521:xe", "system", "rangita");
        // Connection conn=DriverManager.getConnection("jdbc:oracle:thin:system/rangita@Rangita:1521:xe");
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT r_no,avblty,sno FROM C_ROOMS");
        while (resultSet.next())
       {
       		int size=resultSet.getInt("sno");
       		String avblty=resultSet.getString("avblty");
       		int roomno=resultSet.getInt("r_no");
     		out.println("size is"+size);
        	out.println("availability of the room"+avblty);
        	out.println("room no"+roomno);
	    }
       	conn.close();
        	      
%>
</body>

</html>