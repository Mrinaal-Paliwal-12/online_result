<%-- 
    Document   : manageM
    Created on : Jan 12, 2022, 8:25:36 PM
    Author     : asus
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Records</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
        <style>
            body{
              font-family: sans;
              text-align: center;
              background: #EECDA3;  /* fallback for old browsers */
                background: linear-gradient(to left, #EF629F, #EECDA3); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            }
            form{
                background-color: #86A8E7;
            }
            .center {
                margin: auto;
                width: 80%;
                padding: 10px;
                }
            div{
                text-align: center;
                display:inline-block;
                padding: 15px;
            }
            h1{
                font-family: sofia;
                color : crimson;
                font-size: 35px;
            }
            h3{
                font-family: sofia;
                color : white;
                font-size: 20px;
            }
            label{
                font-family: consolas;
                color : white;
                font-size: 18px;
            }
            .inputfield{
                height: 41px;
	            background: #f2f2f2;
	            box-shadow: none !important;
	            border: none;
            }
            .btn{
	                 font-weight: bold;
	                 background: #ee9ca7;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #ffdde1, #ee9ca7);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #ffdde1, #ee9ca7); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	                border: none;
	                min-width: 30px;
                    font-size: 20px;
                    font-family: sofia;
                    
            }
            .btn:hover,.btn:active{
                 background: #d9a7c7;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #fffcdc, #d9a7c7);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #fffcdc, #d9a7c7); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            }
            .inpw{
                height: 25px;
                min-width: 250px;
	            background: #f2f2f2;
	            box-shadow: none !important;
	            border: none;
            }
            
            
            #login{
                background: #FF1493;
            }
            .reset{
                background: #CB356B;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #BD3F32, #CB356B);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #BD3F32, #CB356B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                color: white;

            }
            .reset:hover{
                background: #642B73;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #C6426E, #642B73);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #C6426E, #642B73); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


            }
            #forgot:hover{
                background: #41295a;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #2F0743, #41295a);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #2F0743, #41295a); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


            }
            #forgot{
                background: #093028;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #237A57, #093028);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #237A57, #093028); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

                color: white;
            }
            #login:hover,#reset:hover{
                background-color: slateblue;
            }
            a:link, a:visited {
        background-color: black;color: white;padding: 16px 136px;
        text-align: center;text-decoration: none;display: inline-block;
      }
      a:hover, a:active {
      background-color: crimson;color:white;font-family:consolas;
      }
      ::placeholder {
  background: -webkit-linear-gradient( #203A43, #F37335);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  padding: 10px; 
  font-family: sofia;
  font-size: 15px;
}   
        </style>
    </head>
    <body>
        <%
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/resultproj";
        Connection con = DriverManager.getConnection(url, "root", "");
        PreparedStatement ps = con.prepareStatement("select marks_id from marks order by marks_id desc");
        ResultSet rs = ps.executeQuery();
        rs.next();
        int autoid = rs.getInt(1) + 1;
        %>
        <h1 class="font-effect-outline">Manage Student Marksheet , welcome <%=session.getAttribute("teacher_name")%></h1>
        <div class="center">
            <div>
        <form action="viewMS.jsp" method="get" >
            <fieldset style="height:500px ; width:300px ;">
            <h3 class="font-effect-outline">View Result Of A Student</h3><hr/><br>
                    <input type="text" name ="sid" placeholder="Enter Student ID" class="inpw"><br><br><br><BR><br><BR><br><BR><br><BR><br><BR><br><BR><br>
                    <label for="sem" class="font-effect-outline">Select Sem:</label>&nbsp;&nbsp;
                    <select name="sem">
                            <option value="sem1">Sem1</option>
                            <option value="sem2">Sem2</option>
                            <option value="sem3">Sem3</option>
                            <option value="sem4">Sem4</option>
                            <option value="sem5">Sem5</option>
                            <option value="sem6">Sem6</option>
                    </select><br><BR>
                    
            <input type="submit" class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" class="btn reset" />
            </fieldset>
        </form>
            </div>
        <div>
        <form action="insertMS.jsp" method="get" >
            <fieldset style="height:500px ; width:300px ;">
            <h3 class="font-effect-outline">Insert marks for student</h3><hr/><br>
            <input type="text" name ="marks_id" value="<%out.println(autoid);%>" readonly class="inpw"><br><br>
            
            <input type="text" name ="sid" placeholder="Enter Student ID" class="inpw"><br><br>
            <input type="text" name ="sub1" placeholder="Marks for Subject 1" class="inpw"><br><br>
            <input type="text" name ="sub2" placeholder="Marks for Subject 2" class="inpw"><br><br>
            <input type="text" name ="prac1" placeholder="Marks for Practical 1" class="inpw"><br><br>
            <input type="text" name ="prac2" placeholder="Marks for Practical 2" class="inpw"><br><br>
            
            <br>
                    <label for="sem" class="font-effect-outline">Select Sem:</label>&nbsp;&nbsp;
                    <select name="sem">
                            <option value="sem1">Sem1</option>
                            <option value="sem2">Sem2</option>
                            <option value="sem3">Sem3</option>
                            <option value="sem4">Sem4</option>
                            <option value="sem5">Sem5</option>
                            <option value="sem6">Sem6</option>
                    </select><br><BR>
            
            <input type="submit" class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" class="btn reset" />
            </fieldset>
        </form></div>
            <div>
        <form action="updateMS.jsp" method="get">
            <fieldset style="height:500px ; width:300px ;">
            <h3 class="font-effect-outline">Edit student marks:</h3><hr><br>
            <input type="text" name ="sid" placeholder="Enter Student ID" class="inpw"><br><br>
            <input type="text" name ="sub1" placeholder="Marks for Subject 1" class="inpw"><br><br>
            <input type="text" name ="sub2" placeholder="Marks for Subject 2" class="inpw"><br><br>
            <input type="text" name ="prac1" placeholder="Marks for Practical 1" class="inpw"><br><br>
            <input type="text" name ="prac2" placeholder="Marks for Practical 2" class="inpw"><br><br>
            <br><br><br>
            
                    <label for="sem" class="font-effect-outline">Select Sem:</label>
                    <select name="sem">
                            <option value="sem1">Sem1</option>
                            <option value="sem2">Sem2</option>
                            <option value="sem3">Sem3</option>
                            <option value="sem4">Sem4</option>
                            <option value="sem5">Sem5</option>
                            <option value="sem6">Sem6</option>
                    </select><br><BR>
            <input type="submit" class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" class="btn reset"/>
            </fieldset>
        </form></div>
            <!--
        <div>
        <form action="deleteS.jsp" method="get" style="border:1px solid black;padding:10px;">
            <h3>Delete Student record</h3><br>
            <input type="text" name ="sid" placeholder="Enter Student id"><br><br>
            <input type="password" name ="pass" placeholder="Enter your password"><br><br>
            
            <input type="submit" />&nbsp;&nbsp;&nbsp;<input type="reset" />
        </form>
            </div>
            -->
            
            <div><a href="teacherDash.jsp?email=<%=session.getAttribute("teacher_email")%>&password=<%=session.getAttribute("teacher_password")%>">Dashboard</a></div>
        </div>
        
        
        
        
        
           <%
            rs.close();
            ps.close();
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
