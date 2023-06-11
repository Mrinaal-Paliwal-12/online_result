<%-- 
    Document   : updatepass
    Created on : Jan 14, 2022, 7:33:59 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page errorPage="password-error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
        <title>Password Success</title>
        <style> 
            body{
                background: #314755;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #26a0da, #314755);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #26a0da, #314755); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
 
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
      background-color: crimson;color:white;font-family:consolas;
      }
      h1{
          font-family: sofia;
          font-size: 40px;
          color : crimson;
      }
        </style>
    </head>
    <body>
        <bR><BR><BR>
        <div class="font-effect-outline">
        <%
            String password = request.getParameter("password");
            int id = Integer.parseInt(request.getParameter("id"));
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String type = session.getAttribute("user").toString();
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/resultproj";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement ps = con.prepareStatement("select password from "+type+" where email =? and name=? and "+type+"_id=?");
            ps.setString(1,email);
            ps.setString(2,name);
            
            ps.setInt(3,id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            out.println("<h1>Old Password: "+rs.getString(1)+"</h1>");
            ps = con.prepareStatement("update "+type+" set password=? where "+type+"_id=?");
            ps.setString(1,password);
            ps.setInt(2,id);
            int x = ps.executeUpdate();
            out.println("<br><h1>New Password: "+password+"</h1>");
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
        
        <%
        
        int i = 0;
        if(type.equals("admin")){
            i=1;
        }
        else if(type.equals("teacher")){
            i=2;
        }
        else{
            i=3;
        }
        %>
        <br><BR>
        <h1 class="font-effect-shadow-multiple" style="color:maroon;">Password set!</h1>
        </div><br><BR><BR>
        <div class="container borderYtoX">
        <a href="loginpage.jsp?login=<%=i%>" >Go to login page!</a>
        </div>
        
    </body>
</html>
