<%-- 
    Document   : page2
    Created on : Jan 14, 2022, 3:31:30 PM
    Author     : asus
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Dosis:wght@600&family=Oswald:wght@300&family=Roboto+Mono:wght@300&family=Shadows+Into+Light&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
        <style>
            .inputfield{
                height: 41px;
                min-width: 350px;
	            background: #f2f2f2;
	            box-shadow: none !important;
	            border: none;
            }
            .btn{
	                 font-weight: bold;
	                background:  #2389cd;
	                border: none;
	                min-width: 340px;
                    font-size: 30px;
                    font-family: sofia;
            }
            .btn:hover,.btn:active{
                background-color: slateblue;
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
                background: #f44336;
            }
            #login:hover,#reset:hover{
                background-color: slateblue;
            }
            h1{
                color:#333;
                font-weight: bold;
                margin-top: 0;
                font-family: 'Shadows Into Light', cursive;
                color: #c31432;
            }
            body{
                background: #0f0c29;  /* fallback for old browsers */
                background: -webkit-linear-gradient(to right, #24243e, #302b63, #0f0c29);  /* Chrome 10-25, Safari 5.1-6 */
                background: linear-gradient(to right, #24243e, #302b63, #0f0c29); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
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
        <script>
            function validate(){
                var p1= document.getElementById("4").value;
                var p2 = document.getElementById("5").value;
                if(p1==p2){
                    alert("Passwords Match Successful!");
                }
                else{
                    alert("Passwords do not match!");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <%
        String type= session.getAttribute("user").toString();
        int i = 0;
        if(type.equals("admin")){
            i=1;
        }
        else if(type.equals("teacher")){
            i=2;
        }
        else{
            i=3;
        }
        %>
        <br>
        <c:set var="type" value="<%=type%>"/>
        <div align="center">

        <form action="updatepass.jsp" onsubmit="return validate()" method="post">
            <fieldset style="height:620px ; width:400px ; border: 1px solid black;background-color: white;">
                <br>
                <h1 >Forgot Password? ${fn:toUpperCase(type)}</h1><hr><br>
                <input type="text" placeholder="Enter <%=type%> ID" class="inputfield" name="id" id="2"><br><BR>
                <input type="text" placeholder="Enter Name" class="inputfield" name="name" id="1"><br><BR>
                <input type="email" placeholder="Enter Email" class="inpw" name="email" id="3"><br><br>
                <input type="password" placeholder="Enter New Password" class="inpw" name="password" id="4"><br><br>
                <input type="password" placeholder="Confirm Password" class="inpw" id="5"><br><Br>
                <input type="submit" class="btn" ><br><Br>
                <input type="reset" class="btn" id="reset"><br><Br>
                <input type="button" class="btn" value="Login Again?" id="login" onclick="window.location.href='loginpage.jsp?login=<%=i%>'"><br><Br>
                
            </fieldset>
        </form>
        </div>      
        
    </body>
</html>
