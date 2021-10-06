<%-- 
    Document   : jspexample3-modify
    Created on : 6 Oct 2021, 11:19:24
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.solent.oodd.webexercise1.model.User" %>
<%
    // retreive the stored users list from the session
    List<User> users = (List<User>) session.getAttribute("userList");
    if (users == null) {
        users = new ArrayList<User>();
        session.setAttribute("userList", users);
    }

    String name = request.getParameter("userName");
    String address = request.getParameter("userAddress");
    String phoneNumber = request.getParameter("userPhoneNumber");
    String index = request.getParameter("index");
    int i = Integer.parseInt(index);
    User user = users.get(i);

    // find what action to perform on the page
    String action = request.getParameter("action");

    if ("modifyUser".equals(action)) {
        user.setAddress(address);
        user.setName(name);
        user.setPhoneNumber(phoneNumber);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3</title>
    </head>
    <center><body>
        <h1>JSP Example 3: Modify User table</h1>

        <h2>Modify user</h2>
        <form action="./jspexample3-modify.jsp" method="get">
            <p>user name <input type="text" name="userName" value="<%= user.getName()%>"></p>
            <p>user address <input type="text" name="userAddress" value="<%= user.getAddress()%>"></p>
            <p>user phone number <input type="text" name="userPhoneNumber" value="<%= user.getPhoneNumber()%>"></p>
            <input type="hidden" name="action" value="modifyUser">
            <input type="hidden" name="index" value="<%=index%>">
            <button type="submit" >modify user</button>
        </form> 
        <br>
        <form action="./jspexample3.jsp" method="get">
            <button type="submit" >return to user list</button>
        </form> 
        <br>
        </body></center>
</html>