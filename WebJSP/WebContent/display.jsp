<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 
<html>
    <head>
        <title>Display all persons</title>
        <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
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
FROM testdb.T_PEOPLE AS p
INNER JOIN testdb.T_MAILS AS m ON p.id  = m.T_PEOPLE_ID
INNER JOIN testdb.T_ADDRESSES  AS o ON p.id  = o.T_PEOPLE_ID
        </sql:query>
        
    <center>
        <form>
            <table border="1" width="40%">
                <caption>Person List</caption>
                <tr>
                
                    <th>Person Id</th>
                    <th>Person Name</th>
                    <th>Pin #</th>
                    <th>E-mail</th>
                    <th>Address</th>
                    
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.ID}"/></td>
                        <td><c:out value="${row.FULL_NAME}"/></td>
                        <td><c:out value="${row.PIN}"/></td>
                        <td><c:out value="${row.EMAIL}"/></td>
                        <td><c:out value="${row.ADDR_INFO}"/></td>
                        
                        <td><a href="update.jsp?id=<c:out value="${row.id}"/>">Update</a></td>
                        <td><a href="javascript:confirmGo('Sure to delete this record?','delete.jsp?id=<c:out value="${row.id}"/>')">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="index.jsp">Go Home</a>
    </center>
</body>
</html>