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
         color : white;
         text-align: center;
         background: linear-gradient(to bottom, #BB377D, #FBD3E9);
         background-attachment: fixed;

         }
      body{
        font-family: Arial, Helvetica, sans-serif;
        background: #FBD3E9;  /* fallback for old browsers */
background: -webkit-linear-gradient(to bottom, #BB377D, #FBD3E9);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to bottom, #BB377D, #FBD3E9); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background-attachment: fixed;
        }
      /* Style the header */
      header {
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
        font-size: 30px;
        font-family: consolas;
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
        background-color: black;
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
          color:#240b36;
          font-weight: bold;
          background: #00C9FF;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #92FE9D, #00C9FF);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #92FE9D, #00C9FF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

          border: none;
	  min-width: 300px;
          font-size: 25px;
          font-family: sofia;
      }
      button:hover,.button:active{
          color:black;
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
        int batch_id = rs.getInt(5);
        int sid = rs.getInt(1);
        session.setAttribute("student_name",name);
        session.setAttribute("student_email",email);
        session.setAttribute("student_password",password);
        session.setAttribute("student_batch_id",batch_id);
        session.setAttribute("student_id",sid);
        
        %>
     <header>
      <h1>Welcome <%=name%></h1>
    </header>
    <section>
      <nav>
        <ul>
          <li><button onclick="window.location.href = 'stmark.jsp';">Show Rankings</button><br><BR></li>
        <li><button onclick="window.location.href = 'myresult.jsp';">My result</button><br><BR></li>
        <li><a href='index.html'>Log Out</a> <!--ill change this to logout button --> </li>
        </ul>
      </nav>
        
        <article>
        <p>
            All the best for your result
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
