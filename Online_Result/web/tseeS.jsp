<%-- 
    Document   : tseeS
    Created on : Jan 12, 2022, 4:52:18 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>See Records</title>
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
  width: 100%;
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
          text-align: center;
      }
            p{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            int course_id = Integer.parseInt(session.getAttribute("teacher_course_id").toString());
            try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/resultproj";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement ps = con.prepareStatement("select batch_id , batch_name from batch where course_id=?");
            ps.setInt(1,course_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int bid1 = rs.getInt(1);
            String bname1 = rs.getString(2);
            rs.next();
            int bid2 = rs.getInt(1);
            String bname2 = rs.getString(2);
         %>
         <div class="row"><div class="column">
         <table>
             <tr><th>STUDENT_ID</th><th>Name</th><th>Course</th><th>Batch</th></tr>
        
        <%
            ps = con.prepareStatement("SELECT s.student_id , s.name , c.course_name , b.batch_name from student s inner join batch b on s.batch_id = b.batch_id inner join course c ON b.course_id = c.course_id where s.batch_id = ? order by s.student_id");
            ps.setInt(1,bid1);
            rs = ps.executeQuery();
            while(rs.next()){
                out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
            }
        %>
        <tr><td colspan="4"><p><a href="ranking.jsp?bid=<%=bid1%>">Rankings</a></p></td></tr>
         </table></div>
         <div class="column">
         <table>
             <tr><th>STUDENT_ID</th><th>Name</th><th>Course</th><th>Batch</th></tr>
        
        <%
            ps = con.prepareStatement("SELECT s.student_id , s.name , c.course_name , b.batch_name from student s inner join batch b on s.batch_id = b.batch_id inner join course c ON c.course_id = b.course_id where s.batch_id = ? order by s.student_id");
            ps.setInt(1,bid2);
            rs = ps.executeQuery();
            while(rs.next()){
                out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
            }
        %>
        <tr><td colspan="4"><p><a href="ranking.jsp?bid=<%=bid2%>">Rankings</a></p></td></tr>
         </table><br><br><br><br></div>
           
        <div class="center"><a href="teacherDash.jsp?email=<%=session.getAttribute("teacher_email")%>&password=<%=session.getAttribute("teacher_password")%>">Go back to Dashboard</a></div>
             
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
         </div>
    </body>
</html>
