<%-- 
    Document   : newjsp
    Created on : 6 Oct 2021, 10:22:44
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <center><body>
        <h1>Hello World!</h1>
        <hr>
        <a href=".">Home</a> | 
        <a href="./newjsp.jsp">Example 1</a> | 
        <a href="./jspexample2.jsp">Example 2</a> | 
        <a href="./jspexample3.jsp">Example 3</a>
        <hr>
        <p>the time is <%= new Date() %></p>
        </body></center>
</html>
