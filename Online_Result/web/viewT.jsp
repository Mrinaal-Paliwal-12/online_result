<%-- 
    Document   : viewT
    Created on : Jan 10, 2022, 2:38:02 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher record</title>
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
        <%
        int course_id = Integer.parseInt(request.getParameter("course"));
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/resultproj";
        Connection con = DriverManager.getConnection(url, "root", "");
        PreparedStatement ps = con.prepareStatement("select t.teacher_id,t.name,c.course_name from teacher t inner join course c on t.course_id = c.course_id where c.course_id="+course_id);
        ResultSet rs = ps.executeQuery();
        PreparedStatement ds = con.prepareStatement("select * from course where course_id="+course_id);
        ResultSet es = ds.executeQuery();
        es.next();
        String cs = es.getString(2);
        %>
       
        <table class="center-table">
            <tr><th colspan="3"><h1>All Teachers In <%out.println(cs);es.close();ds.close();%></h1></th></tr>
            <tr><th>Teacher_ID</th><th>Name</th><th>Course</th></tr>       
        <%
        while(rs.next()){
            int tid = rs.getInt(1);
            String name = rs.getString(2);
            String course = rs.getString(3);
            out.println("<tr><td>"+tid+"</td><td>"+name+"</td><td>"+course+"</td></tr>");
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
        </table><br><br>
        <div class="center"><a href="manageT.jsp">Go back</a></div>
         
    </body>
</html>
