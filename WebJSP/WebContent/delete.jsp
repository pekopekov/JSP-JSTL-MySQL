<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Person</title>
    </head>
    <body>
    
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/testdb"
                           user="root" password="root"/>
              
        <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM T_MAILS WHERE T_PEOPLE_ID ='${param.id}'
        </sql:update>
        
        <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM T_ADDRESSES WHERE T_PEOPLE_ID ='${param.id}'
        </sql:update>
                           
        <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM T_PEOPLE WHERE id='${param.id}'
        </sql:update>
        
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations! Data delete.</font>
            <a href="index.jsp">Go Home</a>          
        </c:if>
        
        <c:if test="${count<=0}">
            <font size="5" color='red'> Error! Data delete.</font>
            <a href="index.jsp">Go Home</a>          
        </c:if>
    </body>
</html>