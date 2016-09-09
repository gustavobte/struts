<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body style="padding-top: 0px; padding: 0px; padding-bottom: 0px; padding-left: 0px; 
padding-right: 0px; background-image:url('img/topo.png'); background-repeat: no-repeat;">
<br><br><br><br><br><br><br><br>
	<div style="height: 25px;" >
	<small>Voce esta aqui: > Login</b></small>
	</div>
<h2><b>Login</b></h2>
<hr color="#3866B5">


            <form action="user.jsp" style="width: 400px; position:relative; border:5px; border-color: #3866B5 ">
                <table>
                    <tr>
                        <td> Usuario  : </td><td> <input name="username" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Senha  : </td><td> <input name="password" size=15 type="text" /> </td> 
                    </tr>
                </table>
                <input type="submit" value="login" />
            </form>




	<ul>
		<li>
			<html:link href="${pageContext.request.contextPath}/user.do?dispatch=goToSearchPage">
				Listar Estabelecimento
			</html:link>
		</li>
		<li>
			<html:link href="${pageContext.request.contextPath}/user.do?dispatch=goToAddPage">
				Adicionar Estabelecimento
			</html:link>
		</li>
	</ul>
</body>
</html>