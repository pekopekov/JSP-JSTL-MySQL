<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

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
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT
			  p.id,
			  p.FULL_NAME,
			  p.PIN,
			  m.EMAIL,
			  o.ADDR_INFO
			FROM T_PEOPLE AS p
			INNER JOIN T_MAILS AS m ON p.id  = m.T_PEOPLE_ID
			INNER JOIN T_ADDRESSES  AS o ON p.id  = o.T_PEOPLE_ID where p.id = ?;
            <sql:param value="${param.id}" />
        </sql:query>
        
        <form action="updatedb.jsp" method="post">
            <table border="0" width="40%">
                <caption>Update Person</caption>
                <tr>
                    <th>Person Name</th>
                    <th>Pin #</th>
                    <th>Email</th>
                    <th>Address</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="hidden" value="${row.ID}" name="id"/>
                            <input type="text" value="${row.FULL_NAME}" name="fname"/></td>
                        <td><input type="text" value="${row.PIN}" name="pin"/></td>
                        <td><input type="text" value="${row.EMAIL}" name="email"/></td>
                        <td><input type="text" value="${row.ADDR_INFO}" name="adr"/></td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="index.jsp">Go Home</a>
        </form>
    </body>
</html>