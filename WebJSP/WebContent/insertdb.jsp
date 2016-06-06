<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 
<html>
    <head>
        <title>Insert person</title>
    </head>
    <body>
        <c:if test="${ empty param.fname or empty param.pin or empty param.email or empty param.adr}">
            <c:redirect url="insert.jsp" >
                <c:param name="errMsg" value="Please Enter Person and PIN" />
            </c:redirect>
        </c:if>
        
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/testdb"
                           user="root"  password="root"/>
 
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO T_PEOPLE(FULL_NAME, PIN) VALUES (?,?);
            <sql:param value="${param.fname}" />
            <sql:param value="${param.pin}" />
        </sql:update>
        
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO T_MAILS (EMAIL_TYPE, EMAIL, T_PEOPLE_ID) VALUES (?,?, (SELECT ID FROM T_PEOPLE ORDER BY ID DESC LIMIT 1));
            <sql:param value="typed" /> 
            <sql:param value="${param.email}" />
        </sql:update>
                
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO T_ADDRESSES (ADDR_TYPE, ADDR_INFO, T_PEOPLE_ID) VALUES (?,?, (SELECT ID FROM T_PEOPLE ORDER BY ID DESC LIMIT 1));
            <sql:param value="typ" />
            <sql:param value="${param.adr}" />
        </sql:update>
        
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted </font>
 
            <c:redirect url="insert.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted successfully." />
            </c:redirect>
        </c:if>
        <c:if test="${result<=0}" >
        	<font size="5" color='red'> Error inserting! </font>
 
            <c:redirect url="insert.jsp" >
                <c:param name="susMsg" value="Error inserting!" />
            </c:redirect> 
        </c:if>
 
 
    </body>
</html>