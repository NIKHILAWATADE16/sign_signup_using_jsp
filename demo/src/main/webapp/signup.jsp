<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@page import="java.sql.*,java.util.*" %>
        <% 
        String userid=request.getParameter("userid");
        String email=request.getParameter("email");
        session.putValue("userid",userid);
        String password=request.getParameter("pwd");
        Class.forName("com.mysql.jdbc.Driver"); 
        java.sql.Connection
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root",""); 
        Statement st=con.createStatement(); 
        ResultSet rs=st.executeQuery("select * from user where userid='"+userid+"' and password='"+password+"' and email='"+email+"'"); 
    try{
	    rs.next();
	            if(rs.getString(" password").equals(password)&&rs.getString("userid").equals(userid)&&rs.getString("email").equals(email)) 
                {
                     out.println("Welcome "  +userid); 
		        } 
		else{
			 out.println(" Invalid password or username."); } } catch (Exception e) { e.printStackTrace(); }
%> --%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

 <!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signup</title>
 </head>
 <body>
    

<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("email");
String userid=request.getParameter("userid");
String password=request.getParameter("pwd");
String div=request.getParameter("div");
String cls=request.getParameter("class");
String city=request.getParameter("city");

RequestDispatcher dispatcher=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?useSSL=false", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into user(email,uname,password,class,division,city)values('"+email+"','"+userid+"','"+password+"','"+cls+"','"+div+"','"+city+"')");
dispatcher=request.getRequestDispatcher("index.jsp");
if(i>0)
{
    request.setAttribute("status","sucess");
}
else
{
    request.setAttribute("status","fail");

}
dispatcher.forward(request,response);
conn.close();
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<p>Thank you for register ! Please  to continue.</p>
<a href='index.jsp'>Login</a>

 </body>
 </html>