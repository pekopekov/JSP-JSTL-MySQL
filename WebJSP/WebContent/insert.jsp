<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert person</title>
        
             <script type="text/javascript">
            function validate()
            {
                var a = document.getElementById("fname");
                var b = document.getElementById("pin");
				var c = document.getElementById("fname").value;
				var d = document.getElementById("pin").value;
				var f  = document.getElementById("adr").value;
                var valid = true;
                if(a.value.length<=0 || b.value.length!=10 || f.value.length<=0) {
                     alert("Wrong input: Provide a name with 10 digits pin!");
                     valid = false;
                }
                else{
                    if(isNaN(d)){
                       	alert("Wrong input: Provide a name with 10 digits pin!");
                    	valid = false;
                    }
                    var x = document.forms["inputf"]["email"].value;
                    var atpos = x.indexOf("@");
                    var dotpos = x.lastIndexOf(".");
                    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
                        alert("Not a valid e-mail address");
                        return false;
                    }
                }
                return valid;
            };

        </script>
        
    </head>
    <body>
        <form action="insertdb.jsp" name = "inputf" method="post" onsubmit="return validate();" >
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Add Person</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>Person Name</label></td>
                        <td><input type="text" name="fname" id="fname" /></td>
                    </tr>
                    <tr>
                        <td><label>PIN</label></td>
                        <td><input type="text" name="pin" id="pin"/></td>
                    </tr>
                    <tr>
                    <td><label>E-mail</label></td>
                        <td><input type="text" name="email" id="email" /></td>
                    </tr>
                    <tr>
                        <td><label>Address</label></td>
                        <td><input type="text" name="adr" id="adr"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Save" /></td>
                        <td><input type="reset" value="reset"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            <a href="index.jsp">Go Back</a>
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
            <a href="index.jsp">Go Back</a>
        </c:if></font>
 
    </body>
</html>