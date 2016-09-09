<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<?xml version="1.0" encoding="UTF-8"?>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
    function postForm(method) {
	var form = document.getElementById('formEstabelecimento');
	form.elements["dispatch"].value = method;
	form.submit();
    }
</script>
</head>
<body>
	<html:form action="/estabelecimento" styleId="formEstabelecimento">
		<html:hidden property="dispatch" />
		<table>
			<tr>
				<td>Estabelecimento</td>
				<td><html:text property="descricao" size="20" /></td>
				<td><html:button value="Buscar" property="" onclick="postForm('pesquisarEstabelecimentos')" /></td>
			</tr>
		</table>
	</html:form>

	<br>
	<logic:notEmpty name="estabelecimentos">
		<table width="100%">
			<tr>
				<td bgcolor="#FF9900">Descrição</td>
				<td bgcolor="#FF9900">Situação</td>
			</tr>
			<logic:iterate name="estabelecimentos" id="estabelecimento">
				<tr>
					<td bgcolor="#DBEAF9"><bean:write name="estabelecimento" property="descricao" /></td>
					<td bgcolor="#DBEAF9"><bean:write name="estabelecimento" property="situacao" /></td>
				</tr>
			</logic:iterate>
		</table>
	</logic:notEmpty>

	<br>
	<br>
	<html:link href="${pageContext.request.contextPath}/"> Voltar para página principal </html:link>
</body>
</html>