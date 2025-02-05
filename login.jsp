<%@ page import="java.sql.*"%>
<%
	String userName=request.getParameter("uname");
	String userPwd=request.getParameter("upwd");


	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","yogi","charan");
		ps=con.prepareStatement("select name from student where name=? and password=?");
		ps.setString(1,userName);
		ps.setString(2,userPwd);
		
		rs=ps.executeQuery();

		if(rs.next()){
			RequestDispatcher rd=request.getRequestDispatcher("/success.jsp");
			rd.forward(request,response);
		}
		else{
			out.println("<font color=red size=10>Login Failed!!</br>");
			out.println("<a href=\"/LoginForm/login.html\" >Try Again</a>");
		}
		
	}
	catch(Exception e){

		response.sendError(509,e.toString());
	}
	finally{
	try{
		if(rs!=null){
			rs.close();
		}
		else if(ps!=null){
			ps.close();
		}
		else if(con!=null){
			con.close();
		}
	}
	catch(Exception e){}
}

%>