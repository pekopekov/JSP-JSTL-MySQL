<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>options:</h1>
        <a href="insert.jsp">Insert Record</a><p></p>
        <a href="display.jsp">Show All Records</a><p></p>
        
         <form action="searchdb.jsp" method="post">
         	<table border="0" cellspacing="2" cellpadding="5">
                <tbody>    
                	<tr>
                        <td><input type="text" name="fname"/></td>
                        <td><input type="submit" value="Search" /></td>
                    </tr>
                </tbody>
         	</table>
         </form>

    </body>
</html>