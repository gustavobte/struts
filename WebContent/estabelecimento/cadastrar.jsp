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
	var form = document.getElementById('formCadastrar');
	form.elements["dispatch"].value = method;
	form.submit();
    }
</script>
</head>
<body>
	<html:form action="/estabelecimento" styleId="formCadastrar">
		<html:hidden property="dispatch" />
		<table>
			<tr>
				<td>Descrição</td>
				<td><html:text property="descricao" size="20" /></td>
			</tr>
			<tr>
				<td>Situação</td>
				<td><select name="situacao" property="situacao" required="true">
						<option value="">--- Selecione a Situação ---</option>
						<option property="situacao" value="ATIVO">ATIVO</option>
						<option property="situacao" value="INATIVO">INATIVO</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><html:button value="Salvar" property=""
						onclick="postForm('cadastrarEstabelecimento')" /></td>
			</tr>
		</table>
	</html:form>

	<font color="green" size=2> <logic:present name="success">
			Sucesso@!! 
		</logic:present>
	</font>



	<font color="red" size=2> <logic:present name="failure">
			Ooops!!!
		</logic:present>
	</font>
	<br>
	<br>
	<html:link href="${pageContext.request.contextPath}/"> Voltar para página principal </html:link>
</body>
</html>