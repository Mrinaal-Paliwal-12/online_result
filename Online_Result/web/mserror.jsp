<%-- 
    Document   : mserror
    Created on : Jan 13, 2022, 4:36:26 AM
    Author     : asus
--%>
<%@page isErrorPage = "true" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <title>Error Page</title>
        <style> 
            body{
                background: #314755;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #26a0da, #314755);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #26a0da, #314755); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
 
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
      background-color: crimson;color:white;font-family:consolas;
      }
      h1{
          font-family: sofia;
          font-size: 40px;
          color : white;
      }
        </style>
    </head>
    <body><bR><BR><BR>
        <div>
        <h1>Not Allowed</h1>
        </div><br><BR><BR>
        <div class="container borderYtoX">
        <a href="manageM.jsp" >Go back!</a>
        </div>
    </body>
    
   
</html>
