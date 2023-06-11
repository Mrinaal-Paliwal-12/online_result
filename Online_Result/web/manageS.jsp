<%-- 
    Document   : manageS
    Created on : Jan 10, 2022, 2:18:43 PM
    Author     : asus
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
        <title>Manage Records</title>
        <style>
            body{
              font-family: sans;
              text-align: center;
              background: #D3CCE3;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #E9E4F0, #D3CCE3);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #E9E4F0, #D3CCE3); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
 /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

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
                padding: 5px;
            }
            h1{
                font-family: sofia;
                color : #7303c0;
                font-size: 40px;
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
        PreparedStatement ps = con.prepareStatement("select student_id from student order by student_id desc");
        ResultSet rs = ps.executeQuery();
        rs.next();
        int autoid = rs.getInt(1) + 1;
        %>
        <h1>Manage Students , welcome <%=session.getAttribute("admin_name")%></h1><br>
        <div class="center"><div>
        <form action="viewS.jsp" method="get">
            <fieldset style="height:450px ; width:250px ;">
            <h3 class="font-effect-outline">View Students</h3><hr/><br>
            <label class="font-effect-outline" for="course" for="course">Select Course:</label>&nbsp;&nbsp;

                    <select name="course">
                            <option value="11">MCA</option>
                            <option value="12">MBA</option>                            
                    </select><br><BR>
                    <label class="font-effect-outline" for="course">Select Batch:</label>&nbsp;&nbsp;
                    <select name="batch">
                            <option value="2020-2022">2020-2022</option>
                            <option value="2021-2023">2021-2023</option>                            
                    </select><br><BR><br><BR><br><BR><BR><BR><BR><BR><br><br><br><br>
           <input type="submit" class="btn"/>
            </fieldset>
        </form></div>
        <div>
        <form action="insertS.jsp" method="get" >
            <fieldset style="height:450px ; width:250px ;">
            <h3 class="font-effect-outline">Insert a new student</h3><hr/><br>
            <input class="inpw" type="text" name ="sid" value="<%out.println(autoid);%>" readonly><br><br>
            
            <input class="inpw" type="text" name ="sname" placeholder="Enter Student Name"><br><br>
            <input class="inpw" type="email" name ="semail" placeholder="Enter email-id"><br><br>
            <input class="inpw" type="password" name ="spass" placeholder="Give password"><br><br>
            
            <label class="font-effect-outline" for="course">Select Course:</label>&nbsp;&nbsp;
                    <select name="course">
                            <option value="11">MCA</option>
                            <option value="12">MBA</option>                            
                    </select><br><BR>
            <label class="font-effect-outline" for="course">Select Batch:</label>&nbsp;&nbsp;
                    <select name="batch">
                            <option value="2020-2022">2020-2022</option>
                            <option value="2021-2023">2021-2023</option>                            
                    </select>
             
            <br><br><BR><BR>
            
            <input type="submit" class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" class="btn reset" />
            </fieldset>
        </form></div>
            <div>
        <form action="updateS.jsp" method="get" >
            <fieldset style="height:450px ; width:250px ;">
            <h3 class="font-effect-outline">Update Student batch:</h3><hr/><br>
            <input class="inpw" type="text" name ="sid" placeholder="Enter student id">
            <BR><BR>
            <label class="font-effect-outline" for="course">Select Course:</label>&nbsp;&nbsp;
                    <select name="course">
                            <option value="11">MCA</option>
                            <option value="12">MBA</option>                            
                    </select><br><BR>
            <label class="font-effect-outline" for="course">Select Batch:</label>&nbsp;&nbsp;
                    <select name="batch">
                            <option value="2020-2022">2020-2022</option>
                            <option value="2021-2023">2021-2023</option>                            
                    </select><br><br><BR><BR><BR><BR><BR><BR><BR><br><br>
            <input type="submit" class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" class="btn reset" />
            </fieldset>
        </form></div>
        <div>
        <form action="deleteS.jsp" method="get" >
            <fieldset style="height:450px ; width:250px ;">
            <h3 class="font-effect-outline">Delete Student Record</h3><hr/><br>
            <input class="inpw" type="text" name ="sid" placeholder="Enter Student id"><br><br>
            <input class="inpw" type="password" name ="pass" placeholder="Enter your password"><br><br>
            <BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
           <input type="submit" class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" class="btn reset" />
            </fieldset>
        </form>
            </div>
            <%
            String admin_name = session.getAttribute("admin_name").toString();
            ps = con.prepareStatement("select email,password from admin where name=?");
            ps.setString(1, admin_name);
            rs = ps.executeQuery();
            rs.next();
            %>
         </div>   
            <div><a href="adminDash.jsp?email=<%out.println(rs.getString(1));%>&password=<%out.println(rs.getString(2));%>">Go back to DAshboard</a></div>
        
        
        
        
        
        
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
