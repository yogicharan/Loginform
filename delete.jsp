<%@ page import="java.sql.*" %>


<%
	String userName=request.getParameter("uname");
	String userPwd=request.getParameter("upwd");
	
	
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","yogi","charan");
		ps=con.prepareStatement("delete from student where name=? and password=?");
		ps.setString(1,userName);
		ps.setString(2,userPwd);
		rs=ps.executeQuery();
		if(rs.next()){
			out.println("<font color=\"red\">Account deleted..!!</font>");
			out.println("<a href=\"/LoginForm/login.html\">back to login</a>");
		}
		else{
			
			out.println("<font color=\"red\">Something went wrong</font>");
			out.println("<a href=\"/LoginForm/login.html\">back to login</a>");
		}
	}
	catch(Exception e){
		response.sendError(509,e.toString());
		out.println("<font color=\"red\">Something went wrong</font>");
		out.println("<a href=\"/LoginForm/login.html\">back to login</a>");
	}
	finally{
		try{
			if(rs!=null){
				rs.close();
			}
			else if(ps!=null){
				ps.close();
			}
			if(con!=null){
				con.close();
			}
		}
		catch(Exception e){}
	}

%>