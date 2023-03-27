<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <style>
            body {
                font-family: cursive;
                background-color: #5a98c5
            }

            #grad {
                background-image: linear-gradient(to right, rgb(3, 26, 56), rgb(132, 198, 226));
            }

            div {
                width: 400px;
                margin: 0px auto;
                box-shadow: 0px 1px 10px #a8a8a8;
                background-color: #fff;
                padding-bottom: 10px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%)
            }

            h1 {
                background-color: #d1a134;
                text-align: center;
                margin-top: 0;
                padding: 20px;
                color: #fff
            }

            input {
                display: block;
                margin: auto;
                font-size: 20px
            }

            p {
                text-align: center;
                font-size: 20px;
                color: #6a595b;
            }

            input {
                width: 70%;
                border: 1px solid #34cbd1;
                background-color: #fff;
                outline: none;
                border-radius: 5px;
                height: 40px;
                padding: 10px
            }

            input[type='submit']:hover {
                background-color: #54b0bc;
                border: 0
            }

            input[type='submit'] {
                background-color: #34cbd1;
                color: #fff;
                cursor: pointer
            }

            .btn {
                width: 150px;
                background-color: #5995fd;
                border: none;
                outline: none;
                height: 49px;
                border-radius: 49px;
                color: #fff;
                text-transform: uppercase;
                font-weight: 600;
                margin: 10px 0;
                cursor: pointer;
                transition: 0.5s;
            }

            .btn:hover {
                background-color: #4d84e2;
            }

            ;
        </style>
    </head>

    <body id="grad">
        <div>
            <%@page import="java.sql.*,java.util.*" %>
                <% String email=request.getParameter("email"); String password=request.getParameter("password");
                    Connection con=null; Statement st=null; ResultSet rs=null; try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?useSSL=false","root","");
                    st=con.createStatement(); String query="select * from user where email='" + email
                    + "' and password='" + password +"'" ; rs=st.executeQuery(query); if(rs.next()) { String
                    name=rs.getString("uname"); String e=rs.getString("email"); String cls=rs.getString("class"); String
                    div=rs.getString("division"); String city=rs.getString("city"); out.println("<h1>Welcome</h1>");
                    out.println("<h2><p>Name : "+name+"</p></h2>");
                    out.println("<h2><p>Email : "+e+"</p></h2>");
                    out.println("<h2><p>Class : "+cls+"</p></h2>");
                    out.println("<h2><p>Division : "+div+"</p></h2>");
                    out.println("<h2><p>City : "+city+"</p></h2>");

                    out.println("<a href='index.jsp'><input style=\"margin: 0px auto\" type=\"submit\" value=\"Logout\" class=\"btn solid\" /></a>");

                    }
                    else
                    {
                    out.println("<h1 style='background-color: #947917'>Invalid email or password !</h1>");
                    out.println("<a href='index.jsp'><input style=\"margin: 0px auto\" type=\"submit\" value=\"Login\" class=\"btn solid\" /></a>");
                    }
                    }
                    catch(ClassNotFoundException e){
                    out.println(e);
                    }
                    catch(SQLException e){
                    out.println(e);
                    }
                    finally
                    {
                    try
                    {
                    rs.close();
                    st.close();
                    con.close();
                    }
                    catch(SQLException e){
                    out.println(e);
                    }
                    }
                    %>


                    
                    <!-- <p><a href='login.html'>Back</a></p> -->
        </div>
        
    </body>

    </html>