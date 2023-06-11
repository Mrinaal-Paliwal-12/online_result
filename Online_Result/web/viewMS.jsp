<%-- 
    Document   : viewMS
    Created on : Jan 13, 2022, 4:25:18 AM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page errorPage="mserror.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <title>Student result</title>
        <script>
var x=1;
var tag;

function change()
  {
    tag = setInterval(color,500);
  }


function color()
  {
    if(x%2==0)
       {
         //document.getElementById('pass').style.backgroundColor = "white";
         document.getElementById('pass').style.color = "#FF0099";
         document.getElementById('pass').style.fontFamily = "consolas";
         document.getElementById('pass').style.fontSize = "15px";
       }
       else if(x%3==0)
       {
         //document.getElementById('pass').style.backgroundColor = "yellow";
         document.getElementById('pass').style.color = "dodgerblue";
         document.getElementById('pass').style.fontFamily = "consolas";
         document.getElementById('pass').style.fontSize = "25px";
         x=0;
       }
     else
       {
         //document.getElementById('pass').style.backgroundColor = "black";
         document.getElementById('pass').style.color = "crimson";
         document.getElementById('pass').style.fontFamily = "consolas";
         document.getElementById('pass').style.fontSize = "35px";
        document.getElementById('pass').style.padding = "5px";
       }
    x++;
  }


function stop()
  {
    clearTimeout(tag);
  }

</script>
        <style>
            div{
                margin: auto;
                text-align: center;
            }
        body{
                background: #8E2DE2;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #4A00E0, #8E2DE2);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #4A00E0, #8E2DE2); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */




                background-attachment: fixed;
            }
            h1{
                text-align: center;
                background: linear-gradient(to right,white,cyan,yellow,khaki);
            }
            table{
                padding: 5px;
                margin: auto;
                width: 95%;
                height: 100%;
                border: 1px solid black;
                border-collapse: collapse;
                
            }
            th{
background: #ED213A;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #93291E, #ED213A);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #93291E, #ED213A); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */



                color: white;
                font-size: 20px;
                padding: 15px;
                text-align:center;
                border: 1px solid black;
            }
            td{
                padding: 30px;
                text-align:center;
                font-size: 25px;
                border: 1px solid black;
                font-weight: bold;
                font-family: consolas;
                background: #A1FFCE;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #FAFFD1, #A1FFCE);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #FAFFD1, #A1FFCE); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            }
            
            p{
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
        </style>
    </head>
    <body onload="change()" onclick="stop()">
        <br><br>
        <%
        int sid = Integer.parseInt(request.getParameter("sid"));
        String sem = request.getParameter("sem");
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/resultproj";
        Connection con = DriverManager.getConnection(url, "root", "");
        PreparedStatement ps = con.prepareStatement("select s.batch_id,b.batch_name from student s inner join batch b on s.batch_id = b.batch_id where s.student_id = ?");
        ps.setInt(1, sid);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int batch_id = rs.getInt(1);
        String batch = rs.getString(2);
        int cid = Integer.parseInt(session.getAttribute("teacher_course_id").toString());
        ps = con.prepareStatement("select course_name from course where course_id = ?");
        ps.setInt(1, cid);
        rs = ps.executeQuery();
        rs.next();
        String cname = rs.getString(1);
        ps = con.prepareStatement("select s.student_id ,s.name,c.course_name,b.batch_name from student s inner join batch b on s.batch_id = b.batch_id inner join course c on b.course_id = c.course_id where c.course_id = ? and s.student_id = ?");
        ps.setInt(1,cid);
        ps.setInt(2,sid);
        rs = ps.executeQuery();
        rs.next(); 
        %>
        <table>
            <tr><th>Student_ID</th><th>Name</th><th>Course</th><th>Batch</th><th>Sem</th><th>Sub1</th><th>Sub2</th><th>Prac1</th><th>Prac2</th><th>Percentage</th><th>Status</th></tr>
            <tr><td><%=rs.getInt(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=sem%></td>
                <%
                ps = con.prepareStatement("SELECT sem.* , batch.batch_name FROM sem inner join batch on sem.batch_id = batch.batch_id WHERE sem_name = ? and sem.batch_id = ?");
                ps.setString(1,sem);
                ps.setInt(2,batch_id);
                rs = ps.executeQuery();
                rs.next();
                int semid = rs.getInt(1);
                ps = con.prepareStatement("select sub1,sub2,prac1,prac2,percentage from marks where marks.st_id = ? and marks.sem_id = ?");
                ps.setInt(1,sid);
                ps.setInt(2,semid);
                rs = ps.executeQuery();
                rs.next();
                %>
                <td><%=rs.getInt(1)%></td><td><%=rs.getInt(2)%></td><td><%=rs.getInt(3)%></td><td><%=rs.getInt(4)%></td><td><%=rs.getDouble(5)%></td>
                <%
                Double status = rs.getDouble(5);
                String grade;
                if(status<40){
                    grade = "Fail";
                }
                else{
                    grade = "Pass";
                }
                %>
                
                
                <td id="pass"><%=grade%></td></tr> 
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
        </table><br><BR><br><BR><br><BR>
       <div class="container borderYtoX"><a href="manageM.jsp">Go back</a></div>
    </body>
</html>
