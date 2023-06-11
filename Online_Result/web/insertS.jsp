<%-- 
    Document   : insertS
    Created on : Jan 11, 2022, 4:01:08 PM
    Author     : asus
--%>

<%@page import="java.sql.*"%>
<%@page errorPage="insertS-error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>insert Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <style> 
            body{
                
                background: #FF416C;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #FF4B2B, #FF416C); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

 
            }
            div{
                margin: auto;
                text-align: center;
            }
            div.container a
{
    color: #FFF;
    text-decoration: none;
    font: 20px Raleway;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    cursor: pointer;
}

/* Border from Y to X  */
div.borderYtoX a:before, div.borderYtoX a:after
{
    position: absolute;
    opacity: 0.5;
    height: 100%;
    width: 2px;
    content: '';
    background: #FFF;
    transition: all 0.3s;
}

div.borderYtoX a:before
{
    left: 0px;
    top: 0px;
}

div.borderYtoX a:after
{
    right: 0px;
    bottom: 0px;
}

div.borderYtoX a:hover:before, div.borderYtoX a:hover:after
{
    opacity: 1;
    height: 2px;
    width: 100%;
}
a:link, a:visited {
        background-color: black;color: white;padding: 14px 25px;
        text-align: center;text-decoration: none;display: inline-block;
      }
      a:hover, a:active {
      background-color: dodgerblue;color:white;font-family:consolas;
      }
      h1{
          font-family: sofia;
          font-size: 40px;
          color : white;
      }
        </style>
    </head>
    <body><div>
        <h1>ID: <%out.println(request.getParameter("sid"));%></h1>
        <h1>Name: <%out.println(request.getParameter("sname"));%></h1>
        <h1>Email: <%out.println(request.getParameter("semail"));%></h1>
        <h1>Password: <%out.println(request.getParameter("spass"));%></h1>
        <%
        try{
            int s_id = Integer.parseInt(request.getParameter("sid"));
            String name =request.getParameter("sname") ;
            String email =request.getParameter("semail") ;
            String pass = request.getParameter("spass");
            int course_id = Integer.parseInt(request.getParameter("course"));
            String batch_name = request.getParameter("batch");
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/resultproj";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement ps = con.prepareStatement("select b.batch_id,c.course_name from batch b inner join course c on b.course_id = c.course_id where b.batch_name =? and c.course_id = ?");
            ps.setString(1,batch_name);
            ps.setInt(2,course_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int batch_id = rs.getInt(1);
            ps = con.prepareStatement("insert into student values(?,?,?,?,?)");
            ps.setInt(1,s_id);
            ps.setString(2,name);
            ps.setString(3,pass);
            ps.setString(4,email);
            ps.setInt(5,batch_id);
            int i = ps.executeUpdate();
            if(i>0){
            out.println("<h1>Insert success</h1>");
            }
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
        <br><BR></div>
        <div class="container borderYtoX"> <a href="manageS.jsp">Go back</a></div>
    </body>
</html>
