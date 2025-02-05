<%@ page import="java.sql.*"%>
<%
String userName=request.getParameter("uname");
String userPwd=request.getParameter("upwd");
String userGender=request.getParameter("ugender");
long userNumber=Long.parseLong(request.getParameter("unumber"));



Connection con=null;
PreparedStatement ps=null;
String result=null;

		
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","yogi","charan");
	ps=con.prepareStatement("insert into student values(?,?,?,?)");
	ps.setString(1,userName);
	ps.setString(2,userPwd);
	ps.setString(3,userGender);
	ps.setLong(4,userNumber);

		
	int n=ps.executeUpdate();	
	if(n>0) {
		result="Account created!!";
	}
	else {
		result="Something went wrong";
	}
			
			
}
catch(Exception e) {
		response.sendError(509,e.toString());
			
}
finally{
	try{
		if(ps!=null){
			ps.close();
		}
		else if(con!=null){
			con.close();
		}
	}
	catch(Exception e){}
}

		
out.println(result+"<br/>"); 

out.println("<a href=\"/LoginForm/login.html\" >back to login</a>");	
		
		
%>