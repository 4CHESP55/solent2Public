<%-- 
    Document   : jspexample2
    Created on : 6 Oct 2021, 10:30:03
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
// any valid java code can go between the escape sequences

// here we are looking for the userName value in the web request which called this page
    String name = request.getParameter("userName");
    String address = request.getParameter("userAddress");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 2</title>
    </head>
    <center><body>
        <h1>JSP Example 2: Form Request Examples</h1>
        <hr>
        <a href=".">Home</a> | 
        <a href="./newjsp.jsp">Example 1</a> | 
        <a href="./jspexample2.jsp">Example 2</a> | 
        <a href="./jspexample3.jsp">Example 3</a>
        <hr>

        <p>Hello I think your name is <%=name %> and I know you live at <%=address %></p>

        <!-- starting the href with ./ means you are referring relative to the root of this page -->

        <!-- get uses url encoded parameters -->
        <form action="./jspexample2.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <p>user Address <input type="text" name="userAddress" value=""></p>
            <button type="submit" >add name and address using GET</button>
        </form> 
        <br>

        <!-- post avoids url encoded parameters -->
        <form action="./jspexample2.jsp" method="post">
            <!-- here we are pre filling the value with the name variable -->
            <p>user name <input type="text" name="userName" value="<%=name %>"></p>
            <p>user Address <input type="text" name="userAddress" value="<%=address %>"></p>
            <button type="submit" >add name using POST</button>
        </form> 
        </body></center>
</html>
