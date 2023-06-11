<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Sem</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <style>
            div.container
{
    font-family: Raleway;
    margin: 0 auto;
	padding: 5em 3em;
	text-align: center;
}

div.container a
{
    color: white;
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
body{
     background: #00C9FF;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #92FE9D, #00C9FF);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #92FE9D, #00C9FF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


background-attachment: fixed;
margin: 0;
     }
     h1{
        font-family: sofia;
         color : #373B44;
         text-align: center;
         background: rgba(255,255,255,0.5);
         backdrop-filter: blur(5px);
         padding: 30px;
        font-size: 55px;
            }
            a:link, a:visited {
        background-color: black;padding: 14px 25px;
        text-align: center;text-decoration: none;display: inline-block;
      }
      a:hover, a:active {
      background-color: blue;
      }
        </style>
    </head>
    <body>
        <%
            int bid = Integer.parseInt(session.getAttribute("student_batch_id").toString());
            try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/resultproj";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement ps = con.prepareStatement("select sem_id from sem where batch_id=?");
            ps.setInt(1,bid);
            ResultSet rs = ps.executeQuery();
            int i = 1;
            
        %>
        <h1>Select Semester:</h1>
        <div class="container borderYtoX">
        <%
        while(rs.next()){
            out.println("<a href='final.jsp?semid="+rs.getInt(1)+"'>Sem "+i+"</a>");
            i++;
        }
        %>
        </div>    
        
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
        <br><br><div class="container borderYtoX"><a href="studentDash.jsp?email=<%=session.getAttribute("student_email")%>&password=<%=session.getAttribute("student_password")%>">Go back to DAshboard</a></div>
        
    </body>
</html>
