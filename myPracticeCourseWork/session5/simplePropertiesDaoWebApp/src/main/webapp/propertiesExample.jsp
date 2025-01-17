<%-- 
    Document   : propertiesExampleJsp
    Created on : 27 Oct 2021, 01:41:23
    Author     : cgallen
--%>

<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();

    String url = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String username = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.username");
    String password = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.password");
    String cardname = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardname");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String expiry = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.expiry");
    String issuenumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber");
    String message = "";
    
    String action = (String) request.getParameter("action");
    if ("updateProperties".equals(action)) {
        message = "updating properties";
        url = (String) request.getParameter("url");
        username = (String) request.getParameter("username");
        password = (String) request.getParameter("password");
        cardname = (String) request.getParameter("cardname");
        cardnumber = (String) request.getParameter("cardnumber");
        cvv = (String) request.getParameter("cvv");
        expiry = (String) request.getParameter("expiry");
        issuenumber = (String) request.getParameter("issuenumber");

        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.url", url);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.username", username);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.password", password);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cardname", cardname);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber", cardnumber);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cvv", cvv);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.expiry", expiry);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber", issuenumber);

    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Properties Example Jsp</title>
    </head>
    <body>
        <h1>Properties Example Jsp</h1>
        <p><%=message %></p>
        <form action="./propertiesExample.jsp" method="POST">
            <p>URL Property <input type="text" name="url" value="<%=url%>"></p>
            <p>Username Property <input type="text" name="username" value="<%=username%>"></p>
            <p>Password Property <input type="text" name="password" value="<%=password%>"></p>
            <p>Name on Card <input type="text" name="cardname" value="<%=cardname%>"></p>
            <p>Card Number <input type="text" name="cardnumber" value="<%=cardnumber%>"></p>
            <p>cvv <input type="text" name="cvv" value="<%=cvv%>"></p>
            <p>Card expiry <input type="text" name="expiry" value="<%=expiry%>"></p>
            <p>Issue number <input type="text" name="issuenumber" value="<%=issuenumber%>"></p>
            <input type="hidden" name="action" value="updateProperties">

            <button class="btn" type="submit" >Update Properties</button>
        </form> 
    </body>
</html>
