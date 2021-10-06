<%-- 
    Document   : jspexample3
    Created on : 22-Jul-2021, 11:16:28
    Author     : admin
    THIS EXAMPLE SHOWS HOW OBJECTS CAN BE STORED IN THE SESSION
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="org.solent.oodd.webexercise1.model.User" %>
<%
    // retrieve the stored users list from the session
    List<User> users = (List<User>) session.getAttribute("userList");
    if (users == null) {
        users = new ArrayList<User>();
        session.setAttribute("userList", users);
    }

    String name = request.getParameter("userName");
    String address = request.getParameter("userAddress");
    String phoneNumber = request.getParameter("userPhoneNumber");
    String index = request.getParameter("index");

    // find what action to perform on the page
    String action = request.getParameter("action");

    if ("removeUser".equals(action)) {
        int i = Integer.parseInt(index);
        users.remove(i);
    } else if ("addUser".equals(action)) {
        User user = new User();
        user.setName(name);
        user.setAddress(address);
        user.setPhoneNumber(phoneNumber);
        users.add(user);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3</title>
    </head>
    <center><body>
        <h1>JSP Example 3: User list</h1>
        <hr>
        <a href=".">Home</a> | 
        <a href="./newjsp.jsp">Example 1</a> | 
        <a href="./jspexample2.jsp">Example 2</a> | 
        <a href="./jspexample3.jsp">Example 3</a>
        <hr>

        <h2>User Table</h2>
        <table> 
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th></th>
            </tr>
            <% for (int idx = 0; idx < users.size(); idx++) {
                    User user = users.get(idx);
            %>
            <tr>
                <td><%=idx + 1%></td>
                <td><%=user.getName()%></td>
                <td><%=user.getAddress()%></td>
                <td><%=user.getPhoneNumber()%></td>
                <td>
                    <form action="./jspexample3.jsp" method="get">
                        <input type="hidden" name="index" value="<%=idx%>">
                        <input type="hidden" name="action" value="removeUser">
                        <button type="submit" >remove</button>
                    </form>
                    <form action="./jspexample3-modify.jsp" method="get">
                        <input type="hidden" name="index" value="<%=idx%>">
                        <button type="submit" >modify</button>
                    </form>    
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <h2>Add Users</h2>
        <form action="./jspexample3.jsp" method="get">
            <p>user name <input type="text" name="userName" value=""></p>
            <p>user address <input type="text" name="userAddress" value=""></p>
            <p>user phone number <input type="text" name="userPhoneNumber" value=""></p>
            <input type="hidden" name="action" value="addUser">
            <button type="submit" >add user to list</button>
        </form> 
        <br>
        </body></center>
</html>