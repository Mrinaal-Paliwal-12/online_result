<%-- 
    Document   : updateS
    Created on : Jan 11, 2022, 5:21:03 PM
    Author     : asus
--%>

<%@page import="java.sql.*"%>
<%@page errorPage="insertS-error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
  box-sizing: border-box;
}
body{
        background: #0f0c29;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #24243e, #302b63, #0f0c29);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #24243e, #302b63, #0f0c29); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


background-attachment: fixed;
        }
        h1{
                font-family: sofia;
                color : #7303c0;
                font-size: 20px;
            }
.row {
  margin: auto;
}
  
.column {
  float: left;
  width: 50%;
  padding: 25px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 70%;
  border: 1px solid #ddd;
}

th, td {

  text-align: center;
  padding: 10px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
tr:nth-child(odd) {
  background-color: white;
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other on screens that are smaller than 600 px */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}
           a:link, a:visited {
        background-color: black;color: white;padding: 14px 25px;
        text-align: center;text-decoration: none;display: inline-block;
        min-width: 300px;
      }
      a:hover, a:active {
      background-color: crimson;color:white;font-family:consolas;
      }
      .center{
          margin-left: auto;
            margin-right: auto;
          text-align: center;
      }
      .center-table{
          margin-left: auto;
          margin-right: auto;
      }
            
        </style>
    </head>
    <body><br><br>
        <table class="center-table">
            <tr><th colspan="3">Old record</th></tr>
        <%
            int new_course_id = Integer.parseInt(request.getParameter("course"));
            String new_batch_name = request.getParameter("batch");
            int sid = Integer.parseInt(request.getParameter("sid"));
            try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/resultproj";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement ps = con.prepareStatement("select s.name,c.course_name,b.batch_name from student s inner join batch b on s.batch_id = b.batch_id inner join course c on b.course_id = c.course_id where s.student_id = ?");
            ps.setInt(1,sid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");
        %>
        <tr><th colspan="3">New record</th></tr>           
        <%  
            ps = con.prepareStatement("select batch_id from batch where batch_name = ? and course_id = ?");
            ps.setString(1,new_batch_name);
            ps.setInt(2,new_course_id);
            rs = ps.executeQuery();
            rs.next();
            int new_batch_id = rs.getInt(1);
            ps = con.prepareStatement("update student set batch_id = ? where student_id = ?");
            ps.setInt(1,new_batch_id);
            ps.setInt(2,sid);
            int i = ps.executeUpdate();
            ps = con.prepareStatement("select s.name,c.course_name,b.batch_name from student s inner join batch b on s.batch_id = b.batch_id inner join course c on b.course_id = c.course_id where s.student_id = ?");
            ps.setInt(1,sid);
            rs = ps.executeQuery();
            rs.next();
            out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");
            ps = con.prepareStatement("delete from marks where st_id =?");
            ps.setInt(1,sid);
            int z = ps.executeUpdate();
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
        </table><br><br><br><br>
        <div class="center"><a href="manageS.jsp">Go back</a></div>
    </body>
</html>
