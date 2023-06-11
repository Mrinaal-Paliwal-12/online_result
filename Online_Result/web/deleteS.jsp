<%-- 
    Document   : deleteS
    Created on : Jan 11, 2022, 4:50:26 PM
    Author     : asus
--%>

<%@page import="java.sql.*"%>
<%@page errorPage="insertS-error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
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
        <%
            
        try{
            
            int s_id = Integer.parseInt(request.getParameter("sid"));
            String admin_name = session.getAttribute("admin_name").toString();
            String pass = request.getParameter("pass");
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/resultproj";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement ps=con.prepareStatement("select email from admin where name=? and password=?");
            ps.setString(1, admin_name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String ae;
            ae = rs.getString(1);
            if(ae.length()>0){
                ps = con.prepareStatement("select name from student where student_id = ?");
                ps.setInt(1, s_id);
                rs = ps.executeQuery();
                rs.next();
                String sname = rs.getString(1);
                out.println("<h1>Deleting student: "+sname+"</h1><br>");
                ps=con.prepareStatement("delete from marks where st_id = ?");
                ps.setInt(1,s_id);
                int i = ps.executeUpdate();
                ps=con.prepareStatement("delete from student where student_id = ?");
                ps.setInt(1,s_id);
                int j = ps.executeUpdate();
                if(j>0){
                    out.println("<h1>Data deleted successfully</h1>");
                }else{
                    out.println("No data for student!");
                }
                rs.close();
                ps.close();
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
            response.sendRedirect("insertT-error.jsp");
        }
                    
        %>
        </div>
        
        
        
        <br><BR>
        <div class="container borderYtoX"><a href="manageS.jsp">Go back</a></div>
    </body>
</html>
