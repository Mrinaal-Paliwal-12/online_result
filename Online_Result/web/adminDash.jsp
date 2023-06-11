<%-- 
    Document   : adminDash
    Created on : Dec 22, 2021, 4:28:14 AM
    Author     : asus
--%>
<%@page errorPage="loginError.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome <%=session.getAttribute("user")%></title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <style>
      *{
        box-sizing: border-box;
      }
      h1{
         font-family: sofia;
         color : black;
         text-align: center;
         background: linear-gradient(to right, #E9E4F0, #D3CCE3);
         }
      body{
        font-family: Arial, Helvetica, sans-serif;
        background: #D3CCE3;  /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #E9E4F0, #D3CCE3);  /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #E9E4F0, #D3CCE3); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
      /* Style the header */
      header {
        background-image: url("img/bg1.jpg");
        padding: 30px;
        text-align: center;
        font-size: 35px;
        color: black;    
      }
      /* Create two columns/boxes that floats next to each other */
      nav {
        float: left;
        width: 30%;
        height: 300px; /* only for demonstration, should be removed */
        background: #ccc;
        padding: 20px;
      }
      /* Style the list inside the menu */
      nav ul {
        list-style-type: none;
        padding: 0;
      }
      article {
        float: left;
        padding: 20px;
        width: 70%;
        background-color: #f1f1f1;
        height: 300px; /* only for demonstration, should be removed */
      }
      /* Clear floats after the columns */
      section::after {
        content: "";
        display: table;
        clear: both;
      }
      /* Style the footer */
      footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: crimson;
        padding: 10px;
        text-align: center;
        color: white;
      }
      a:link, a:visited {
        background-color: black;color: white;padding: 14px 25px;
        text-align: center;text-decoration: none;display: inline-block;
        min-width: 300px;
      }
      a:hover, a:active {
      background-color: crimson;color:white;font-family:consolas;
      }   
      /* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
      @media (max-width: 600px) {
        nav,
        article {
          width: 100%;
          height: auto;
        }
      }
      button{
          font-weight: bold;
          background: #800080;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #ffc0cb, #800080);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #ffc0cb, #800080); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */




          border: none;
	  min-width: 300px;
          font-size: 25px;
          font-family: sofia;
      }
      button:hover,.button:active{
                 background: #d9a7c7;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #fffcdc, #d9a7c7);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #fffcdc, #d9a7c7); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            }
    </style>
    </head>
    <body>
        <%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String type = session.getAttribute("user").toString();
    
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/resultproj";
        Connection con = DriverManager.getConnection(url, "root", "");
        PreparedStatement ps = con.prepareStatement("select * from "+type+" where email ='"+email+"' and password='"+password+"'");
        ResultSet rs = ps.executeQuery();
        rs.next();
        String name = rs.getString(2);
        session.setAttribute("admin_name",name);
        %>
        
        
    <header>
      <h1>Welcome <%=name%></h1>
    </header>
    <section>
      <nav>
        <ul>
          <li><button onclick="window.location.href = 'manageT.jsp';">Manage teachers</button><br><BR></li>        
                 
          <li><button onclick="window.location.href = 'manageS.jsp';">Manage Students</button><br><BR></li>
          <li><a href='index.html'>Log Out</a> <!--ill change this to logout button --> </li>
        </ul>
      </nav>

      <article>
        <p>
            Have fun managing your website!
        </p>
      </article>
    </section>

    <footer>
      <p>&copy; Copyright Mrinaal Paliwal</p>
    </footer>
          <%
        }
        catch(ClassNotFoundException e){
            out.println("<script>alert('Error : "+e.getStackTrace()+"\\n\\nClassNotFoundException');</script>");
        }
        catch(SQLException e){
            out.println("<script>alert('Error : "+e.getStackTrace()+"\\n\\nSQL Exception');</script>");
            throw new RuntimeException("Error condition!!!");
        }
        catch(Exception e){
            out.println("<script>alert('"+e.getStackTrace()+"');</script>");
        }
        %>
    </body>
    
</html>
