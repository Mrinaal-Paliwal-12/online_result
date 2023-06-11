<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page!</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
        <style>
            h1{
                font-family: sofia;
                color : crimson;
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
	                min-width: 340px;
                    font-size: 30px;
                    font-family: sofia;
                    
            }
            .btn:hover,.btn:active{
                 background: #d9a7c7;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #fffcdc, #d9a7c7);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #fffcdc, #d9a7c7); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            }
            .inpw{
                height: 41px;
                min-width: 350px;
	            background: #f2f2f2;
	            box-shadow: none !important;
	            border: none;
            }
            
            
            #login{
                background: #FF1493;
            }
            #reset{
                background: #CB356B;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #BD3F32, #CB356B);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #BD3F32, #CB356B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                color: white;

            }
            #reset:hover{
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
  background: -webkit-linear-gradient( #009FFF, #F37335);
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
            int i=Integer.parseInt(request.getParameter("login"));
            String type = "";
            if(i==1){
                type="admin";
                out.println("<script>document.body.style.background = '#191970';</script>");
            }else if(i==2){
                type="teacher";
                out.println("<script>document.body.style.background = '#FF4500';</script>");
            }else{
                type="student";
                out.println("<script>document.body.style.background = '#DA70D6';</script>");
            }
            session.setAttribute("user", type);
        %>
        <div align="center">
            
        <form action="<%=type%>Dash.jsp"><br><br>
             <fieldset style="height:530px ; width:420px ; border: 1px solid black;background:#FFFFFF;">
                 <h1 class="font-effect-shadow-multiple">** Login page : <%=session.getAttribute("user")%> **</h1><hr><br>
                 <input type="email" name="email" class="inpw" placeholder="Enter Email"/><br><br>
            <input type="password" name="password" class="inpw" placeholder="Enter Password"/><br><br><br>
            <input type="submit" class="btn" /><br><br><input type="reset" id='reset' class="btn"/><br><br>
            <input type="button" id='forgot' class="btn" value='Forgot Pass?' onclick="window.location.href='page2.jsp'"/>
            <br><br>
        <a href="index.html" >Dashboard</a>
        </fieldset>
        </form>
        
        </div>
    </body>
</html>
