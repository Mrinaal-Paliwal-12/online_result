<%-- 
    Document   : finalprint
    Created on : Jan 17, 2022, 1:21:25 PM
    Author     : asus
--%>

<%@page import="java.sql.*"%>
<%@page errorPage="finalerror.jsp" %>
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
                background: linear-gradient(to bottom, #FFFFFF, #6DD5FA, #2980B9); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


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
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Content-disposition","attachment;filename=myResult.xls");
            //response.setContentType("application/pdf");

        //response.setHeader("Content-disposition","inline; filename='javatpoint.pdf'");
        int sid = Integer.parseInt(session.getAttribute("student_id").toString());
        int batch_id = Integer.parseInt(session.getAttribute("student_batch_id").toString());
        int sem = Integer.parseInt(request.getParameter("semid"));
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/resultproj";
        Connection con = DriverManager.getConnection(url, "root", "");
        PreparedStatement ps = con.prepareStatement("select batch_name from batch where batch_id = ?");
        ps.setInt(1, batch_id);
        ResultSet rs = ps.executeQuery();
        rs.next();
        String batch = rs.getString(1);
        ps = con.prepareStatement("select course.course_id ,course.course_name from course inner join batch on batch.course_id = course.course_id where batch.batch_id = ?");
        ps.setInt(1, batch_id);
        rs = ps.executeQuery();
        rs.next();
        int cid = rs.getInt(1);
        String cname = rs.getString(2);
        String sname = session.getAttribute("student_name").toString();
        ps = con.prepareStatement("select sem_name from sem where sem_id = ?");
        ps.setInt(1, sem);
        rs = ps.executeQuery();
        rs.next();
        String semname = rs.getString(1);
        //ps = con.prepareStatement("select s.student_id ,s.name,c.course_name,b.batch_name from student s inner join batch b on s.batch_id = b.batch_id inner join course c on b.course_id = c.course_id where c.course_id = ? and s.student_id = ?");
        //ps.setInt(1,cid);
        //ps.setInt(2,sid);
        //rs = ps.executeQuery();
        //rs.next(); 
        %>
        <table>
            <tr><th>Student_ID</th><th>Name</th><th>Course</th><th>Batch</th><th>Sem</th><th>Subject 1</th><th>Subject 2</th><th>Practical 1</th><th>Practical 2</th><th>Percentage</th><th>Status</th></tr>
            <tr><td><%=sid%></td><td><%=sname%></td><td><%=cname%></td><td><%=batch%></td><td><%=semname%></td>
            
       <%
                ps = con.prepareStatement("select sub1,sub2,prac1,prac2,percentage from marks where marks.st_id = ? and marks.sem_id = ?");
                ps.setInt(1,sid);
                ps.setInt(2,sem);
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
            
        
        </table><br><BR><br><BR><br><BR>
        
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
    </body>
</html>
