<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <title>Student Rankings</title>
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
                padding: 10px;
                margin: auto;
                width: 90%;
                height: 50%;
                border: 1px solid black;
                border-collapse: collapse;
                
            }
            th{
                background-color: crimson;
                color: white;
                font-size: 40px;
                padding: 20px;
                text-align:center;
                border: 1px solid black;
            }
            td{
                padding: 10px;
                text-align:center;
                font-size: 30px;
                border: 1px solid black;
                font-weight: bold;
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
    <body><br><BR>
        <%
        int semid = Integer.parseInt(request.getParameter("semid"));
         try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/resultproj";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement ps = con.prepareStatement("update marks set percentage = (sub1+sub2+prac1+prac2)/4;");
            int u = ps.executeUpdate();
            ps = con.prepareStatement("SELECT marks.st_id , student.name ,sem.sem_name ,marks.percentage from marks inner join student on marks.st_id = student.student_id inner join sem on sem.sem_id = marks.sem_id where marks.sem_id = ? order by marks.percentage desc;");
            ps.setInt(1,semid);
            ResultSet rs = ps.executeQuery();
            int i = 1;
        %>
        <table>
            <tr><th>Rank</th><th>Student-ID</th><th>Name</th><th>Sem</th><th>Percentage</th></tr>
        <%
        while(rs.next()){
            out.println("<tr><td>"+i+"</td><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td></tr>");
            i++;
        }
        if(i==1){
         out.println("<tr><td colspan='5'>No Data for this semester</td></tr>");   
        }
        %>
            
        </table>
        <br><br><div class="container borderYtoX"><a href="stmark.jsp">Select another Semester</a>
        <a href="studentDash.jsp?email=<%=session.getAttribute("student_email")%>&password=<%=session.getAttribute("student_password")%>">Go back to DAshboard</a></div>
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
