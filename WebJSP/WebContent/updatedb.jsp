<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Person</title>
    </head>
    <body>
    
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/testdb"
                           user="root"  password="root"/>
                           
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE T_PEOPLE SET FULL_NAME = ?, PIN = ? WHERE id='${param.id}'
            <sql:param value="${param.fname}" />
            <sql:param value="${param.pin}" />
        </sql:update>
        
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE T_MAILS SET EMAIL = ? WHERE T_PEOPLE_ID='${param.id}'
            <sql:param value="${param.email}" />
        </sql:update>
        
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE T_ADDRESSES SET ADDR_INFO = ? WHERE T_PEOPLE_ID='${param.id}'
            <sql:param value="${param.adr}" />
        </sql:update>
        
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations! Data update successfull.</font>
              <a href="index.jsp">Go Home</a>          
        </c:if>
        
        <c:if test="${count<=0}">
            <font size="5" color='red'> Sorry! Data updated error.</font>
              <a href="index.jsp">Go Home</a>          
        </c:if>
        
    </body>
</html>