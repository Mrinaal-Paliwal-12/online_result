<%-- 
    Document   : updateT
    Created on : Jan 10, 2022, 4:07:56 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page errorPage="updateT-error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update Page</title>
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
    <body><bR><BR><BR><div>
        <%
            int course = Integer.parseInt(request.getParameter("course"));
            int tid = Integer.parseInt(request.getParameter("tid"));
            try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/resultproj";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement ds = con.prepareStatement("select * from teacher where teacher_id = ?");
            ds.setInt(1, tid);
            ResultSet es = ds.executeQuery();
            es.next();
            es.getInt(1);
            PreparedStatement ps = con.prepareStatement("update teacher set course_id = ? where teacher_id = ?");
            ps.setInt(1, course);
            ps.setInt(2, tid);
            int i = ps.executeUpdate();
            out.println("<h1>Updated successfully!</h1>");
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
        </div><div class="container borderYtoX"><a href="manageT.jsp">Go back</a></div>
    </body>
</html>
