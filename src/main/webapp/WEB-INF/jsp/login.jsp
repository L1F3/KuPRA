<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<html>  
<head>  
<title>VU PSI</title>  
</head>  
<body>  
    <center>  
    <h1>KuPRA</h1>
    <h2>Prisijungimas</h2>  
    
  
        <div style="text-align: center; padding: 30px;border: 1px solid green;width: 250px;">  
            <form method="post" action="<c:url value='j_spring_security_check' />">   
            <table>
                <tr>
                    <td colspan="2" style="color: red">${message}</td>
                </tr>
                <tr>
                    <td>Prisijungimo vardas:</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Slaptažodis:</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login" /></td>
                </tr>
            </table>
            </form>
        </div>
    </center>
</body>
</html>