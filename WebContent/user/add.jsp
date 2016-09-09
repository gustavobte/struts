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
			var form = document.getElementById('formAdd');
			form.elements["dispatch"].value = method;
			form.submit();
		}
	</script>
</head>
<body style="padding-top: 0px; padding: 0px; padding-bottom: 0px; padding-left: 0px; 
padding-right: 0px; background-image:url('img/topo.png'); background-repeat: no-repeat;">
<br><br><br><br><br><br><br><br>
	<div style="height: 25px;" >
	<small>Voce esta aqui: > Tabelas de Apoio > <b>Cadastrar Estabelecimento</b></small>
	</div>
<h2><b>Estabelecimento</b></h2>
<hr color="#3866B5">
<div>
	<h4><p>Inserir</p></h4>
</div>
	<hr width="1300px" >
	<html:form action="/user" styleId="formAdd">
		<html:hidden property="dispatch" />
		<table>
			<tr>
				<td>Estabelecimento</td>
				<td><html:text property="estabelecimento" size="20" /></td>
			</tr>
			<tr>
				<td>Situação</td>
				<td>
				<select name="situacao" property="situacao" required="true">
					<option value="">--- Selecione a Situação ---</option>
				    <option property="situacao" value="ATIVO">ATIVO  </option>
				    <option property="situacao" value="INATIVO">INATIVO</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><html:button value="Salvar" property=""
						onclick="postForm('addUser')" /></td>
			</tr>
		</table>
	</html:form>
	
	<font color="green" size=2> 
		<logic:present name="success">
			Sucessosss!! 
		</logic:present>
	</font>
	


	<font color="red" size=2> 
		<logic:present name="failure">
			Ooops!!!
		</logic:present>
	</font>	
	<br><br>
	
	<html:link href="${pageContext.request.contextPath}/"> Voltar </html:link>
</body>
</html>