<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<?xml version="1.0" encoding="UTF-8"?>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript">
		function postForm(method){
			var form = document.getElementById('formSearch');
			form.elements["dispatch"].value = method;
			form.submit();
		}
	</script>
</head>
<body>
	<html:form action="/user" styleId="formSearch">
		<html:hidden property="dispatch" />
		<table>
			<tr>
				<td>Estabelecimento</td>
				<td><html:text property="estabelecimento" size="20" /></td>
				<td ><html:button value="Buscar" property="" onclick="postForm('searchUsers')" /></td>
			</tr>
		</table>
	</html:form>
	
	<br>
	<logic:notEmpty name="users" >
	<table width="100%">
		<tr>
			<td bgcolor="#FF9900">Estabelecimento</td>
			<td bgcolor="#FF9900">Situação</td>
		</tr>
		<logic:iterate name="users" id="user">
			<tr>
				<td bgcolor="#DBEAF9"><bean:write name="user" property="estabelecimento" /></td>
				<td bgcolor="#DBEAF9"><bean:write name="user" property="situacao" /></td>
			</tr>
		</logic:iterate>
	</table>
	</logic:notEmpty>
		
	<br><br>
	<html:link href="${pageContext.request.contextPath}/"> Home </html:link>
</body>
</html>