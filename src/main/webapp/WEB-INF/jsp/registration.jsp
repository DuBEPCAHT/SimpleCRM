<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
    <head>
    <style>
    .msg {
    	padding: 15px;
    	margin-bottom: 20px;
    	border: 1px solid transparent;
    	border-radius: 4px;
    	color: #31708f;
    	background-color: #d9edf7;
    	border-color: #bce8f1;
    }

    #login-box {
    	width: 300px;
    	padding: 20px;
    	margin: 100px auto;
    	background: #fff;
    	-webkit-border-radius: 2px;
    	-moz-border-radius: 2px;
    	border: 1px solid #000;
    }
    </style>
        <title>Spring Security Example </title>
    </head>
    <body>
    <div id="login-box">
    <div align="center">
    <h2>Registration</h2>
            <c:if test="${message}">
    			<div class="msg">${message}</div>
    		</c:if>
        <form name='RegForm'
        		  action="registration" method='POST'>
        		  <table>
        			<tr>
        				<td>User:</td>
        				<td><input type='text' name='username' required></td>
        			</tr>
        			<tr>
        				<td>Password:</td>
        				<td><input type='password' name='password' required /></td>
        			</tr>
        			<tr>
        				<td align="center" colspan='2'><input name="submit" type="submit"
        					value="submit" /></td>
        			</tr>
        		  </table>
        		  <input type="hidden" name="${_csrf.parameterName}"
        			value="${_csrf.token}" />
        		</form>
    </div>
    </div>
    </body>
</html>