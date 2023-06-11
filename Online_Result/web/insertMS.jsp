<%-- 
    Document   : insertMS
    Created on : Jan 13, 2022, 5:48:40 AM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page errorPage="mserror.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Marks</title>
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
        int sid = Integer.parseInt(request.getParameter("sid"));    
        int cid = Integer.parseInt(session.getAttribute("teacher_course_id").toString());
        int mid = Integer.parseInt(request.getParameter("marks_id"));
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/resultproj";
        Connection con = DriverManager.getConnection(url, "root", "");
        PreparedStatement ps = con.prepareStatement("select batch_id from student where student_id = ?");
        ps.setInt(1, sid);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int bid = rs.getInt(1);
        ps = con.prepareStatement("select course_id from batch where batch_id = ?");
        ps.setInt(1, bid);
        rs = ps.executeQuery();
        rs.next();
        int check = rs.getInt(1);
        if(check==cid){
          ps = con.prepareStatement("select sem_id from sem where sem_name = ? and batch_id = ?");  
          ps.setString(1,request.getParameter("sem"));
          ps.setInt(2, bid);
          rs = ps.executeQuery();
          rs.next();
          int semid = rs.getInt(1);
          int s1 = Integer.parseInt(request.getParameter("sub1"));
          int s2 = Integer.parseInt(request.getParameter("sub2"));
          int p1 = Integer.parseInt(request.getParameter("prac1"));
          int p2 = Integer.parseInt(request.getParameter("prac2"));
          double pc = (s1+s2+p1+p2)/4;
          ps = con.prepareStatement("insert into marks values(?,?,?,?,?,?,?,?)");
          ps.setInt(1,mid);
          ps.setInt(2,sid);
          ps.setInt(3,semid);
          ps.setInt(4,s1);
          ps.setInt(5,s2);
          ps.setInt(6,p1);
          ps.setInt(7,p2);
          ps.setDouble(8,pc);
          int r = ps.executeUpdate();
          ps = con.prepareStatement("select * from marks where sem_id = ? and st_id=?");  
          ps.setInt(1,semid);
          ps.setInt(2, sid);
          rs = ps.executeQuery();
          int c = 0;
          while(rs.next()){
              c++;
          }
          if(c>1){
              ps = con.prepareStatement("delete from marks where marks_id = ?");  
              ps.setInt(1,mid);
              r = ps.executeUpdate();
              out.println("<h1>Data was already there for this sem</h1>");
          }
       %>
       
        <h1>Percentage : <%=pc%></h1>
        <h1>Marks-ID : <%=mid%></h1></div><br><br><br>
         <%
        }else{
            response.sendRedirect("mserror.jsp");
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
        <div class="container borderYtoX"><a href="manageM.jsp">Go back</a></div>
    </body>
</html>
